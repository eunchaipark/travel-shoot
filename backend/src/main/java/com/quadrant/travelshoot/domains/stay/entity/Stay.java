package com.quadrant.travelshoot.domains.stay.entity;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "stays")
@Getter @Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Stay {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "stay_id")
    private Long id;

    @Column(name = "operator_user_id", nullable = false)
    private Long operatorUserId;

    @Column(name = "stay_code", nullable = false, length = 50)
    private String stayCode;

    @Column(name = "stay_name", nullable = false, length = 200)
    private String name;

    @Column(name = "stay_type", nullable = false, length = 20)
    private String stayType; // '호텔', '모텔', '펜션'

    @Column(name = "address", nullable = false, length = 500)
    private String address;

    @Column(name = "address_detail", length = 500)
    private String addressDetail;

    @Column(name = "region_id", nullable = false)
    private Long regionId;

    @Column(name = "latitude", nullable = false, precision = 10, scale = 8)
    private BigDecimal latitude;

    @Column(name = "longitude", nullable = false, precision = 11, scale = 8)
    private BigDecimal longitude;

    @Column(name = "stay_description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "check_in_time", nullable = false)
    private LocalTime checkInTime;

    @Column(name = "check_out_time", nullable = false)
    private LocalTime checkOutTime;

    @Column(name = "reservation_notice", columnDefinition = "TEXT")
    private String reservationNotice;

    @Column(name = "average_rating", precision = 3, scale = 2)
    private BigDecimal averageRating;

    @Column(name = "review_count")
    private Integer reviewCount;

    @Column(name = "view_count")
    private Long viewCount;

    @Column(name = "is_active")
    private Boolean isActive;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "stay", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Room> rooms = new ArrayList<>();

    @OneToMany(mappedBy = "stay", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<StayAmenity> stayAmenities = new ArrayList<>();

    @Transient
    @Builder.Default
    private List<FileUpload> stayImages = new ArrayList<>();
    /// ////////////////////

    @Transient
    private String regionName;

    @Transient
    private BigDecimal minPrice;

    @Transient
    private String mainImageUrl;

    @Transient
    private Integer maxGuests;

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public void setMinPrice(BigDecimal minPrice) {
        this.minPrice = minPrice;
    }

    public void setMainImageUrl(String mainImageUrl) {
        this.mainImageUrl = mainImageUrl;
    }

    public void setMaxGuests(Integer maxGuests) {
        this.maxGuests = maxGuests;
    }

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (averageRating == null)
            averageRating = BigDecimal.ZERO;
        if (reviewCount == null)
            reviewCount = 0;
        if (viewCount == null)
            viewCount = 0L;
        if (isActive == null)
            isActive = true;
        if (checkInTime == null)
            checkInTime = LocalTime.of(15, 0);
        if (checkOutTime == null)
            checkOutTime = LocalTime.of(11, 0);
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    // ===== 검색용 편의 메서드 =====

    /**
     * 지역명 조회를 위한 메서드 (검색용)
     * 실제로는 Region 엔티티를 조인해야 하지만,
     * 검색 성능을 위해 regionId로만 처리
     */
    public String getRegion() {
        // 이 메서드는 Repository에서 JOIN으로 처리하거나
        // 별도의 Region 조회 로직 필요
        return "지역_" + regionId; // 임시
    }

    // 숙소 대표 이미지
    public String getThumbnailImage() {
        // 실제로는 Room 또는 별도 이미지 테이블에서 가져와야 함
        return null; // 일단 null
    }

    // 숙소 기본 이용 가격
    public BigDecimal getBasePrice() {
        // 실제로는 Room 테이블에서 최저가 조회 필요
        return BigDecimal.valueOf(100000); // 임시
    }

    // 최대 수용 가능 인원수
    public Integer getMaxGuests() {
        // 실제로는 Room 테이블에서 최대값 조회 필요
        return 4; // 임시
    }

    // 예약 가능 여부
    public Boolean getInstantBooking() {
        return isActive; // 활성화된 숙소는 즉시 예약 가능으로 간주
    }

    // 무료 취소 가능 여부
    public Boolean getFreeCancellation() {
        return true; // 기본값
    }
}