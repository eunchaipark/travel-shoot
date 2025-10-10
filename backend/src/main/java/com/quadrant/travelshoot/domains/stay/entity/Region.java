package com.quadrant.travelshoot.domains.stay.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "regions")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Region {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "region_id")
    private Long id;

    @Column(name = "area_code")
    private Integer areaCode;

    @Column(name = "area_name", length = 50)
    private String areaName; // 제주, 서울 등

    @Column(name = "city_name", length = 50)
    private String cityName; // 제주시, 서귀포시 등

    @Column(name = "district_name", length = 50)
    private String districtName; // 구/군 이름

    // 검색용 메서드: 전체 지역명 반환
    public String getRegionName() {
        if (districtName != null) {
            return areaName + " " + cityName + " " + districtName;
        } else if (cityName != null) {
            return areaName + " " + cityName;
        } else {
            return areaName;
        }
    }
}