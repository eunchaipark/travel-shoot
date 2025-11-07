package com.quadrant.travelshoot.domains.stay.document;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Elasticsearch 숙소 검색용 Document
 * 위치: backend/src/main/java/com/quadrant/travelshoot/domains/stay/document/StayDocument.java
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Document(indexName = "stays")
public class StayDocument {

    @Id
    private Long stayId;

    @MultiField(
            mainField = @Field(type = FieldType.Text, analyzer = "nori"),
            otherFields = {
                    @InnerField(suffix = "keyword", type = FieldType.Keyword),
                    @InnerField(suffix = "ngram", type = FieldType.Text, analyzer = "ngram_analyzer")
            }
    )
    private String name;

    @Field(type = FieldType.Keyword)
    private String stayType;

    @Field(type = FieldType.Object)
    private RegionInfo region;

    @Field(type = FieldType.Text, analyzer = "nori")
    private String address;

    @GeoPointField
    private GeoPoint location;

    @Field(type = FieldType.Integer)
    private Integer minPrice;

    @Field(type = FieldType.Float)
    private BigDecimal rating;

    @Field(type = FieldType.Integer)
    private Integer reviewCount;

    @Field(type = FieldType.Keyword)
    private List<String> amenities;

    @Field(type = FieldType.Nested)
    private List<RoomInfo> rooms;

    @Field(type = FieldType.Boolean)
    private Boolean isActive;

    @Field(type = FieldType.Keyword)
    private String checkInTime;

    @Field(type = FieldType.Date, format = DateFormat.date_hour_minute_second)
    private LocalDateTime updatedAt;

    // === 내부 클래스 ===

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class RegionInfo {
        private Long id;

        @MultiField(
                mainField = @Field(type = FieldType.Text, analyzer = "nori"),
                otherFields = @InnerField(suffix = "keyword", type = FieldType.Keyword)
        )
        private String areaName;

        @Field(type = FieldType.Text, analyzer = "nori")
        private String cityName;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class RoomInfo {
        private Long roomId;

        @Field(type = FieldType.Text, analyzer = "nori")
        private String name;

        @Field(type = FieldType.Integer)
        private Integer capacity;

        @Field(type = FieldType.Integer)
        private Integer weekdayPrice;

        @Field(type = FieldType.Integer)
        private Integer weekendPrice;

        @Field(type = FieldType.Integer)
        private Integer bedroomCount;

        @Field(type = FieldType.Integer)
        private Integer bathroomCount;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class GeoPoint {
        private double lat;
        private double lon;

        public GeoPoint(Double lat, Double lon) {
            this.lat = lat != null ? lat : 0.0;
            this.lon = lon != null ? lon : 0.0;
        }
    }
}