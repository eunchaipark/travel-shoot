package com.quadrant.travelshoot.domains.main.enums.dto.internal;

import com.quadrant.travelshoot.domains.main.enums.UserType;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ScoreWeight {

    private final double surveyWeight;
    private final double patternWeight;
    private final double reviewWeight;
    private final double popularWeight;

    public static ScoreWeight forUserType(UserType userType){
        switch (userType) {
            case NEW:
                return ScoreWeight.builder().surveyWeight(0.7).patternWeight(0.0).reviewWeight(0.0).popularWeight(0.3).build();
            case LIGHT:
                return ScoreWeight.builder().surveyWeight(0.4).patternWeight(0.5).reviewWeight(0.1).popularWeight(0.0).build();
            case HEAVY:
                return ScoreWeight.builder().surveyWeight(0.2).patternWeight(0.6).reviewWeight(0.2).popularWeight(0.0).build();
            default:
                throw new IllegalArgumentException("Unknown user type: " + userType);
        }
    }
}
