package com.quadrant.travelshoot.domain.stay.dto.request;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SearchRequest {

    private String region;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkIn;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkOut;

    private Integer adults;
    private Integer children;

    public Integer getTotalGuests() {
        int adultCount = (adults != null) ? adults : 0;
        int childCount = (children != null) ? children : 0;
        return adultCount + childCount;
    }
}