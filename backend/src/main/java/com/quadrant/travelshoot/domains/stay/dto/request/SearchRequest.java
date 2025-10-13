package com.quadrant.travelshoot.domains.stay.dto.request;

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
//    private LocalDate checkIn;
    @Builder.Default
    private LocalDate checkIn = LocalDate.now();

    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private LocalDate checkOut;
    @Builder.Default
    private LocalDate checkOut = LocalDate.now().plusDays(1);

//    private Integer adults;
    @Builder.Default
    private Integer adults = 2;

//    private Integer children;
    @Builder.Default
    private Integer children = 0;

    public Integer getTotalGuests() {
//        int adultCount = (adults != null) ? adults : 0;
//        int childCount = (children != null) ? children : 0;
//        return adultCount + childCount;
        return adults + children;
    }
}