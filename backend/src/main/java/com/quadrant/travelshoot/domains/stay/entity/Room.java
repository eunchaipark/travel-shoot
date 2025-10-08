package com.quadrant.travelshoot.domains.stay.entity;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "rooms")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private Long roomId;

    @Column(name = "room_code", nullable = false, length = 50)
    private String roomCode;

    @Column(name = "room_name", nullable = false, length = 200)
    private String roomName;

    @Column(name = "stay_id", nullable = false)
    private Long stayId;

    @Column(name = "stay_code", nullable = false, length = 50)
    private String stayCode;

    @Column(name = "standard_capacity", nullable = false)
    @Builder.Default
    private Integer standardCapacity = 2;

    @Column(name = "maximum_capacity", nullable = false)
    @Builder.Default
    private Integer maximumCapacity = 4;

    @Column(name = "check_in_time")
    private LocalTime checkInTime;

    @Column(name = "check_out_time")
    private LocalTime checkOutTime;

    @Column(name = "bedroom_count", nullable = false)
    @Builder.Default
    private Integer bedroomCount = 1;

    @Column(name = "bathroom_count", nullable = false)
    @Builder.Default
    private Integer bathroomCount = 1;

    @Column(name = "single_bed_count", nullable = false)
    @Builder.Default
    private Integer singleBedCount = 0;

    @Column(name = "double_bed_count", nullable = false)
    @Builder.Default
    private Integer doubleBedCount = 0;

    @Column(name = "queen_bed_count", nullable = false)
    @Builder.Default
    private Integer queenBedCount = 0;

    @Column(name = "king_bed_count", nullable = false)
    @Builder.Default
    private Integer kingBedCount = 0;

    @Column(name = "weekday_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal weekdayPrice;

    @Column(name = "weekend_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal weekendPrice;

    @Column(name = "minimum_nights", nullable = false)
    @Builder.Default
    private Integer minimumNights = 1;

    @Column(name = "maximum_nights", nullable = false)
    @Builder.Default
    private Integer maximumNights = 30;

    @Column(name = "room_description", columnDefinition = "TEXT")
    private String roomDescription;

    @Column(name = "reservation_notice", columnDefinition = "TEXT")
    private String reservationNotice;

    @Column(name = "is_available", nullable = false)
    @Builder.Default
    private Boolean isAvailable = true;

    @Column(name = "view_count", nullable = false)
    @Builder.Default
    private Long viewCount = 0L;

    @Column(name = "reservation_count", nullable = false)
    @Builder.Default
    private Integer reservationCount = 0;

    @Column(name = "is_active", nullable = false)
    @Builder.Default
    private Boolean isActive = true;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}