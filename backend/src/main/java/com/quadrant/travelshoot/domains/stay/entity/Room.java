package com.quadrant.travelshoot.domains.stay.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "rooms")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "stay_id", nullable = false)
    private Stay stay;

    @Column(name = "stay_code", nullable = false, length = 50)
    private String stayCode;

    @Column(name = "room_code", nullable = false, length = 50)
    private String roomCode;

    @Column(name = "room_name", nullable = false, length = 100)
    private String roomName;

    @Column(name = "room_count", nullable = false)
    private Integer roomCount;

    @Column(name = "standard_capacity", nullable = false)
    private Integer standardCapacity;

    @Column(name = "maximum_capacity", nullable = false)
    private Integer maximumCapacity;

    @Column(name = "check_in_time")
    private LocalTime checkInTime;

    @Column(name = "check_out_time")
    private LocalTime checkOutTime;

    @Column(name = "bedroom_count", nullable = false)
    private Integer bedroomCount;

    @Column(name = "bathroom_count", nullable = false)
    private Integer bathroomCount;

    @Column(name = "single_bed_count", nullable = false)
    private Integer singleBedCount;

    @Column(name = "double_bed_count", nullable = false)
    private Integer doubleBedCount;

    @Column(name = "queen_bed_count", nullable = false)
    private Integer queenBedCount;

    @Column(name = "king_bed_count", nullable = false)
    private Integer kingBedCount;

    @Column(name = "weekday_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal weekdayPrice;

    @Column(name = "weekend_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal weekendPrice;

    @Column(name = "minimum_nights", nullable = false)
    private Integer minimumNights;

    @Column(name = "maximum_nights", nullable = false)
    private Integer maximumNights;

    @Column(name = "room_description", columnDefinition = "TEXT")
    private String roomDescription;

    @Column(name = "reservation_notice", columnDefinition = "TEXT")
    private String reservationNotice;

    @Column(name = "is_available", nullable = false)
    private Boolean isAvailable;

    @Column(name = "view_count", nullable = false)
    private Long viewCount;

    @Column(name = "reservation_count", nullable = false)
    private Integer reservationCount;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}