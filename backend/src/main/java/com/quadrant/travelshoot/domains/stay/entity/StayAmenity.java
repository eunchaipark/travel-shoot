package com.quadrant.travelshoot.domains.stay.entity;

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
    @Column(name = "stay_amenity_id")
    private Long stayAmenityId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "stay_id")
    private Stay stay;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "amenity_id")
    private Amenity amenity;
}