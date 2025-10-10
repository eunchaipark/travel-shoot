package com.quadrant.travelshoot.domain.stay.entity;

import jakarta.persistence.*;
import lombok.*;

//숙소 주변 편의시설
@Entity
@Table(name = "amenities")
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Amenity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "amenity_id")
    private Integer amenityId;

    @Column(name = "amenity_name", nullable = false, unique = true, length = 100)
    private String amenityName;
}