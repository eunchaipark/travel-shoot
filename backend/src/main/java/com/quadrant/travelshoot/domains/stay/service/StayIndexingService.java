package com.quadrant.travelshoot.domains.stay.service;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.indices.CreateIndexRequest;
import co.elastic.clients.elasticsearch.indices.ExistsRequest;
import com.quadrant.travelshoot.domains.stay.document.StayDocument;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayElasticsearchRepository;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * MySQL → Elasticsearch 데이터 동기화 서비스
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class StayIndexingService {

    private final StayRepository mysqlRepository;
    private final StayElasticsearchRepository esRepository;
    private final ElasticsearchClient esClient;

    /**
     * Elasticsearch 인덱스 생성 (최초 1회 실행)
     */
    public void createIndex() throws IOException {
        // 인덱스 존재 여부 확인
        boolean exists = esClient.indices()
            .exists(ExistsRequest.of(e -> e.index("stays")))
            .value();

        if (exists) {
            log.warn("stays 인덱스가 이미 존재합니다.");
            return;
        }

        log.info("stays 인덱스 생성 중...");

        // JSON 파일에서 매핑 읽기
        try (InputStream inputStream = getClass()
                .getResourceAsStream("/elasticsearch/stays-index.json")) {
            
            if (inputStream == null) {
                throw new RuntimeException("stays-index.json 파일을 찾을 수 없습니다. 경로: /elasticsearch/stays-index.json");
            }

            // 인덱스 생성
            esClient.indices().create(CreateIndexRequest.of(c -> c
                .index("stays")
                .withJson(inputStream)
            ));

            log.info("stays 인덱스 생성 완료!");
        } catch (Exception e) {
            log.error("인덱스 생성 실패", e);
            throw new RuntimeException("인덱스 생성 중 오류 발생: " + e.getMessage(), e);
        }
    }

    /**
     * 전체 숙소 데이터 재색인 (초기 구축 또는 재구축 시)
     */
    @Transactional(readOnly = true)
    public void reindexAll() {
        log.info("전체 숙소 재색인 시작...");

        List<Stay> stays = mysqlRepository.findAll();
        List<StayDocument> documents = stays.stream()
                .map(this::convertToDocument)
                .collect(Collectors.toList());

        esRepository.saveAll(documents);

        log.info("재색인 완료 - 총 {}개 숙소", documents.size());
    }

    /**
     * 특정 숙소 단건 색인
     */
    @Transactional(readOnly = true)
    public void indexStay(Long stayId) {
        Stay stay = mysqlRepository.findById(stayId)
                .orElseThrow(() -> new IllegalArgumentException("숙소를 찾을 수 없습니다: " + stayId));

        StayDocument document = convertToDocument(stay);
        esRepository.save(document);

        log.info("숙소 색인 완료 - stayId: {}", stayId);
    }

    /**
     * 숙소 삭제 (논리 삭제 시 isActive = false 업데이트)
     */
    public void deleteStay(Long stayId) {
        esRepository.deleteById(stayId);
        log.info("숙소 삭제 완료 - stayId: {}", stayId);
    }

    /**
     * 매일 새벽 3시 증분 동기화 (최근 24시간 내 변경 데이터)
     */
    @Scheduled(cron = "0 0 3 * * *")
    @Transactional(readOnly = true)
    public void syncRecentChanges() {
        log.info("증분 동기화 시작...");

        // 최근 24시간 내 업데이트된 숙소만 동기화
        List<Stay> recentlyUpdated = mysqlRepository
                .findByUpdatedAtAfter(LocalDateTime.now().minusDays(1));

        List<StayDocument> documents = recentlyUpdated.stream()
                .map(this::convertToDocument)
                .collect(Collectors.toList());

        if (!documents.isEmpty()) {
            esRepository.saveAll(documents);
        }

        log.info("증분 동기화 완료 - 업데이트: {}개", documents.size());
    }

    // ===== 변환 메서드 =====

    private StayDocument convertToDocument(Stay stay) {
        // 최저가 계산
        Integer minPrice = stay.getRooms().stream()
                .filter(Room::getIsAvailable)
                .map(Room::getWeekdayPrice)
                .filter(price -> price != null)
                .min(BigDecimal::compareTo)
                .map(BigDecimal::intValue)
                .orElse(0);

        // 편의시설 목록
        List<String> amenities = stay.getAmenities() != null
                ? stay.getAmenities().stream()
                .map(amenity -> amenity.getAmenity().getAmenityName())
                .collect(Collectors.toList())
                : List.of();

        // 객실 정보
        List<StayDocument.RoomInfo> rooms = stay.getRooms() != null
                ? stay.getRooms().stream()
                .filter(Room::getIsAvailable)
                .map(room -> StayDocument.RoomInfo.builder()
                        .roomId(room.getId())
                        .name(room.getRoomName())
                        .capacity(room.getMaximumCapacity())
                        .weekdayPrice(room.getWeekdayPrice() != null ? room.getWeekdayPrice().intValue() : 0)
                        .weekendPrice(room.getWeekendPrice() != null ? room.getWeekendPrice().intValue() : 0)
                        .bedroomCount(room.getBedroomCount())
                        .bathroomCount(room.getBathroomCount())
                        .build())
                .collect(Collectors.toList())
                : List.of();

        return StayDocument.builder()
                .stayId(stay.getId())
                .name(stay.getName())
                .stayType(stay.getStayType())
                .region(StayDocument.RegionInfo.builder()
                        .id(stay.getRegion() != null ? stay.getRegion().getId() : null)
                        .areaName(stay.getRegion() != null ? stay.getRegion().getAreaName() : "")
                        .cityName(stay.getRegion() != null ? stay.getRegion().getCityName() : "")
                        .build())
                .address(stay.getAddress())
                .location(new StayDocument.GeoPoint(
                        stay.getLatitude() != null ? stay.getLatitude().doubleValue() : 0.0,
                        stay.getLongitude() != null ? stay.getLongitude().doubleValue() : 0.0
                ))
                .minPrice(minPrice)
                .rating(stay.getAverageRating())
                .reviewCount(stay.getReviewCount())
                .amenities(amenities)
                .rooms(rooms)
                .isActive(stay.getIsActive())
                .checkInTime(stay.getCheckInTime() != null ? stay.getCheckInTime().toString() : "")
                .updatedAt(stay.getUpdatedAt())
                .build();
    }
}