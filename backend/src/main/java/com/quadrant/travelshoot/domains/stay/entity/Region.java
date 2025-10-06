package com.quadrant.travelshoot.domains.stay.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "regions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Region {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "region_id")
    private Long regionId;

    @Column(name = "area_code", nullable = false, length = 10)
    private String areaCode;

    @Column(name = "area_name", nullable = false, length = 50)
    private String areaName;

    @Column(name = "city_name", length = 50)
    private String cityName;

    @Column(name = "district_name", length = 50)
    private String districtName;
}