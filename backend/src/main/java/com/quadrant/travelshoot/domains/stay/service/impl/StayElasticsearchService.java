package com.quadrant.travelshoot.domains.stay.service.impl;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.FieldValue;
import co.elastic.clients.elasticsearch._types.SortOrder;
import co.elastic.clients.elasticsearch._types.query_dsl.*;
import co.elastic.clients.json.JsonData;
import com.quadrant.travelshoot.common.enums.PlaceType;
import com.quadrant.travelshoot.domains.stay.document.StayDocument;
import com.quadrant.travelshoot.domains.stay.dto.request.FilterRequest;
import com.quadrant.travelshoot.domains.stay.dto.request.SearchRequest;
import com.quadrant.travelshoot.domains.stay.dto.response.AutocompleteResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.SearchResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.StayListItem;
import com.quadrant.travelshoot.domains.stay.service.StaySearchService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service("elasticsearchService")
@RequiredArgsConstructor
public class StayElasticsearchService implements StaySearchService {

    private final ElasticsearchClient esClient;

    @Override
    public List<AutocompleteResponse> autocomplete(String keyword) {
        log.info("🔍 ES 자동완성 - keyword: {}", keyword);
        List<AutocompleteResponse> results = new ArrayList<>();

        try {
            co.elastic.clients.elasticsearch.core.SearchResponse<StayDocument> regionSearch = esClient.search(s -> s
                .index("stays")
                .size(5)
                .query(q -> q.bool(b -> b
                    .should(sh -> sh.match(m -> m.field("region.areaName").query(keyword)))
                    .should(sh -> sh.match(m -> m.field("region.cityName").query(keyword)))
                ))
                .aggregations("unique_regions", agg -> agg
                    .terms(t -> t.field("region.areaName.keyword").size(5))
                ),
                StayDocument.class
            );

            regionSearch.aggregations().get("unique_regions").sterms()
                .buckets().array().forEach(bucket -> 
                    results.add(AutocompleteResponse.builder()
                        .keyword(bucket.key().stringValue())
                        .type("REGION")
                        .build())
                );

            co.elastic.clients.elasticsearch.core.SearchResponse<StayDocument> staySearch = esClient.search(s -> s
                .index("stays")
                .size(5)
                .query(q -> q.bool(b -> b
                    .must(m -> m.term(t -> t.field("isActive").value(true)))
                    .must(m -> m.match(mt -> mt.field("name.ngram").query(keyword)))
                ))
                .sort(sort -> sort.field(f -> f.field("reviewCount").order(SortOrder.Desc))),
                StayDocument.class
            );

            staySearch.hits().hits().forEach(hit -> 
                results.add(AutocompleteResponse.builder()
                    .keyword(hit.source().getName())
                    .type("STAY")
                    .build())
            );

        } catch (IOException e) {
            log.error("❌ ES 자동완성 실패", e);
        }

        return results;
    }

    @Override
    public SearchResponse search(SearchRequest request, Pageable pageable) {
        log.info("🔍 ES 검색 - region: {}, stayName: {}", request.getRegion(), request.getStayName());

        try {
            BoolQuery.Builder boolBuilder = new BoolQuery.Builder();
            boolBuilder.must(m -> m.term(t -> t.field("isActive").value(true)));

            if (request.getStayName() != null && !request.getStayName().isEmpty()) {
                boolBuilder.should(sh -> sh.match(m -> m
                    .field("name")
                    .query(request.getStayName())
                    .boost(2.0f)
                ));
                boolBuilder.should(sh -> sh.match(m -> m
                    .field("name.ngram")
                    .query(request.getStayName())
                ));
            }

            if (request.getRegion() != null && !request.getRegion().isEmpty()) {
                boolBuilder.should(sh -> sh.match(m -> m
                    .field("region.areaName")
                    .query(request.getRegion())
                ));
                boolBuilder.should(sh -> sh.match(m -> m
                    .field("region.cityName")
                    .query(request.getRegion())
                ));
            }

            if (request.getStayName() != null || request.getRegion() != null) {
                boolBuilder.minimumShouldMatch("1");
            }

            if (request.getTotalGuests() != null) {
                Integer totalGuests = request.getTotalGuests();
                boolBuilder.must(m -> m.nested(n -> n
                    .path("rooms")
                    .query(nq -> nq.range(r -> r
                        .number(nr -> nr
                            .field("rooms.capacity")
                            .gte((double) totalGuests)
                        )
                    ))
                ));
            }

            co.elastic.clients.elasticsearch.core.SearchResponse<StayDocument> esResponse = 
                esClient.search(s -> s
                    .index("stays")
                    .query(q -> q.bool(boolBuilder.build()))
                    .from(pageable.getPageNumber() * pageable.getPageSize())
                    .size(pageable.getPageSize())
                    .sort(sort -> sort.field(f -> f.field("rating").order(SortOrder.Desc))),
                    StayDocument.class
                );

            return buildSearchResponse(esResponse, pageable);

        } catch (IOException e) {
            log.error("❌ ES 검색 실패", e);
            throw new RuntimeException("검색 중 오류가 발생했습니다.", e);
        }
    }

    @Override
    public SearchResponse filterSearch(FilterRequest request, Pageable pageable) {
        log.info("🔍 ES 필터 검색 - 활성 필터: {}개", request.getActiveFilterCount());

        try {
            BoolQuery.Builder boolBuilder = new BoolQuery.Builder();
            boolBuilder.must(m -> m.term(t -> t.field("isActive").value(true)));

            // ===== 가격 범위 =====
            if (request.getMinPrice() != null || request.getMaxPrice() != null) {
                BigDecimal minPriceBD = request.getMinPrice();
                BigDecimal maxPriceBD = request.getMaxPrice();
                
                boolBuilder.must(m -> m.nested(n -> n
                    .path("rooms")
                    .query(nq -> nq.range(r -> r
                        .number(nr -> {
                            nr.field("rooms.weekdayPrice");
                            if (minPriceBD != null) {
                                nr.gte(minPriceBD.doubleValue());
                            }
                            if (maxPriceBD != null) {
                                nr.lte(maxPriceBD.doubleValue());
                            }
                            return nr;
                        })
                    ))
                ));
            }

            // ===== 숙소 타입 =====
            if (request.getStayTypes() != null && !request.getStayTypes().isEmpty()) {
                List<FieldValue> typeValues = request.getStayTypes().stream()
                    .map(FieldValue::of)
                    .collect(Collectors.toList());
                
                boolBuilder.must(m -> m.terms(t -> t
                    .field("stayType")
                    .terms(tv -> tv.value(typeValues))
                ));
            }

            // ===== 평점 =====
            if (request.getRatings() != null && !request.getRatings().isEmpty()) {
                BoolQuery.Builder ratingBool = new BoolQuery.Builder();
                
                for (Integer rating : request.getRatings()) {
                    ratingBool.should(sh -> sh.range(r -> r
                        .number(nr -> nr
                            .field("rating")
                            .gte((double) rating)
                            .lt((double) (rating + 1))
                        )
                    ));
                }
                
                boolBuilder.must(m -> m.bool(ratingBool.build()));
            }

            // ===== 편의시설 =====
            if (request.getAmenities() != null && !request.getAmenities().isEmpty()) {
                for (String amenity : request.getAmenities()) {
                    boolBuilder.must(m -> m.term(t -> t
                        .field("amenities")
                        .value(amenity)
                    ));
                }
            }

            // ===== 침실/욕실 개수 =====
            if (request.getBedroomCount() != null || request.getBathroomCount() != null) {
                Integer bedroomCount = request.getBedroomCount();
                Integer bathroomCount = request.getBathroomCount();
                
                BoolQuery.Builder roomBool = new BoolQuery.Builder();
                
                if (bedroomCount != null) {
                    roomBool.must(rm -> rm.range(r -> r
                        .number(nr -> nr
                            .field("rooms.bedroomCount")
                            .gte((double) bedroomCount)
                        )
                    ));
                }
                
                if (bathroomCount != null) {
                    roomBool.must(rm -> rm.range(r -> r
                        .number(nr -> nr
                            .field("rooms.bathroomCount")
                            .gte((double) bathroomCount)
                        )
                    ));
                }
                
                Query roomQuery = roomBool.build()._toQuery();
                
                boolBuilder.must(m -> m.nested(n -> n
                    .path("rooms")
                    .query(roomQuery)
                ));
            }

            co.elastic.clients.elasticsearch.core.SearchResponse<StayDocument> esResponse = 
                esClient.search(s -> s
                    .index("stays")
                    .query(q -> q.bool(boolBuilder.build()))
                    .from(pageable.getPageNumber() * pageable.getPageSize())
                    .size(pageable.getPageSize())
                    .sort(sort -> sort.field(f -> f.field("rating").order(SortOrder.Desc)))
                    .sort(sort -> sort.field(f -> f.field("reviewCount").order(SortOrder.Desc))),
                    StayDocument.class
                );

            log.info("✅ 필터 검색 완료 - 결과: {}개", esResponse.hits().total().value());
            return buildSearchResponse(esResponse, pageable);

        } catch (IOException e) {
            log.error("❌ ES 필터 검색 실패", e);
            throw new RuntimeException("필터 검색 중 오류가 발생했습니다.", e);
        }
    }

    @Override
    public SearchResponse infiniteSearch(
        SearchRequest searchRequest,
        FilterRequest filterRequest,
        Pageable pageable
    ) {
        if (filterRequest != null && filterRequest.getActiveFilterCount() > 0) {
            return filterSearch(filterRequest, pageable);
        } else {
            return search(searchRequest, pageable);
        }
    }

    private SearchResponse buildSearchResponse(
        co.elastic.clients.elasticsearch.core.SearchResponse<StayDocument> esResponse,
        Pageable pageable
    ) {
        List<StayListItem> items = esResponse.hits().hits().stream()
            .map(hit -> toStayListItem(hit.source()))
            .collect(Collectors.toList());

        long totalHits = esResponse.hits().total().value();

        return SearchResponse.builder()
            .stays(items)
            .totalCount(totalHits)
            .currentPage(pageable.getPageNumber())
            .totalPages((int) Math.ceil((double) totalHits / pageable.getPageSize()))
            .hasNext(esResponse.hits().hits().size() == pageable.getPageSize())
            .build();
    }

    private StayListItem toStayListItem(StayDocument doc) {
        BigDecimal latitude = doc.getLocation() != null 
            ? BigDecimal.valueOf(doc.getLocation().getLat()) 
            : null;
        BigDecimal longitude = doc.getLocation() != null 
            ? BigDecimal.valueOf(doc.getLocation().getLon()) 
            : null;

        return StayListItem.builder()
            .stayId(doc.getStayId())
            .name(doc.getName())
            .stayType(doc.getStayType())
            .region(doc.getRegion().getAreaName() + " " + 
                    (doc.getRegion().getCityName() != null ? doc.getRegion().getCityName() : ""))
            .address(doc.getAddress())
            .thumbnailImage(null)
            .lowestPrice(doc.getMinPrice() != null ? doc.getMinPrice() : 0)
            .rating(doc.getRating())
            .reviewCount(doc.getReviewCount())
            .latitude(latitude)
            .longitude(longitude)
            .checkInTime(doc.getCheckInTime())
            .amenities(doc.getAmenities())
            .placeType(PlaceType.STAY)
            .build();
    }
}