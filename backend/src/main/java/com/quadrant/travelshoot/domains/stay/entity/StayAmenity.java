package com.quadrant.travelshoot.domain.stay.entity;

import jakarta.persistence.*;
import lombok.*;

//숙박시설 - 편의용품
@Entity
@Table(name = "stays_amenities")
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StayAmenity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "stays_amenity_id")
    private Long stayAmenityId;

    @Column(name = "stay_id", nullable = false)
    private Long stayId;

    @Column(name = "amenity_id", nullable = false)
    private Integer amenityId;
}