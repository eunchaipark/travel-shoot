package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.*;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class StayRatingResponse {

    private BigDecimal communicationRating;
    private BigDecimal cleanRating;
    private BigDecimal convenienceRating;
    private BigDecimal checkinRating;
    private BigDecimal locationRating;
    private BigDecimal valueRating;
    private BigDecimal totalRating;

    // Double을 받아서 BigDecimal로 변환 (소수점 2자리까지)
    public StayRatingResponse(Double communicationRating, Double cleanRating, Double convenienceRating,
                              Double checkinRating, Double locationRating, Double valueRating, Double totalRating) {
        this.communicationRating = toBigDecimal(communicationRating);
        this.cleanRating = toBigDecimal(cleanRating);
        this.convenienceRating = toBigDecimal(convenienceRating);
        this.checkinRating = toBigDecimal(checkinRating);
        this.locationRating = toBigDecimal(locationRating);
        this.valueRating = toBigDecimal(valueRating);
        this.totalRating = toBigDecimal(totalRating);
    }

    private BigDecimal toBigDecimal(Double value) {
        if (value == null) {
            return null;
        }
        return new BigDecimal(String.valueOf(value))
                .setScale(2, RoundingMode.HALF_UP);
    }
}
