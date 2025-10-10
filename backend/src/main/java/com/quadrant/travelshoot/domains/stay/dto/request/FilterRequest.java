package com.quadrant.travelshoot.domain.stay.dto.request;

import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FilterRequest {

    private String region;
    private LocalDate checkIn;
    private LocalDate checkOut;
    private Integer adults;
    private Integer children;

    public Integer getTotalGuests() {
        int adultCount = (adults != null) ? adults : 0;
        int childCount = (children != null) ? children : 0;
        return adultCount + childCount;
    }

    private BigDecimal minPrice;
    private BigDecimal maxPrice;
    private List<String> stayTypes;
    private Integer minGuests;
    private Integer maxGuests;
    private Integer bedroomCount;
    private Integer bathroomCount;
    private List<Integer> ratings;
    private List<String> amenities;
    private Boolean instantBooking;
    private Boolean freeCancellation;

    public int getActiveFilterCount() {
        int count = 0;
        if (minPrice != null || maxPrice != null) count++;
        if (stayTypes != null && !stayTypes.isEmpty()) count++;
        if (amenities != null && !amenities.isEmpty()) count++;
        if (minGuests != null || maxGuests != null) count++;
        if (bedroomCount != null) count++;
        if (bathroomCount != null) count++;
        if (ratings != null && !ratings.isEmpty()) count++;
        if (Boolean.TRUE.equals(instantBooking)) count++;
        if (Boolean.TRUE.equals(freeCancellation)) count++;
        return count;
    }
}