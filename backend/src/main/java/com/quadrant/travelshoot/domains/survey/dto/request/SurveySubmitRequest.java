package com.quadrant.travelshoot.domains.survey.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SurveySubmitRequest {
    
    @JsonProperty("preferred_regions")  
    @Valid
    @NotEmpty(message = "선호 지역을 최소 1개 이상 선택해주세요.")
    @Size(min = 1, max = 5, message = "선호 지역은 1~5개까지 선택 가능합니다.")
    private List<RegionPreference> preferredRegions;
    
    @JsonProperty("stay_type")  
    @Valid
    @NotNull(message = "숙박 유형을 선택해주세요.")
    private StayTypePreference stayType;
    
    @JsonProperty("food_preferences")  
    @Valid
    @NotEmpty(message = "선호 음식을 최소 2개 이상 선택해주세요.")
    @Size(min = 2, max = 5, message = "선호 음식은 2~5개까지 선택 가능합니다.")
    private List<FoodPreference> foodPreferences;
    
    @JsonProperty("activity_preferences")  
    @Valid
    @NotEmpty(message = "선호 액티비티를 최소 2개 이상 선택해주세요.")
    @Size(min = 2, max = 4, message = "선호 액티비티는 2~4개까지 선택 가능합니다.")
    private List<ActivityPreference> activityPreferences;
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class RegionPreference {
        @NotNull(message = "지역을 선택해주세요.")
        private String region;
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Double weight;
    }
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class StayTypePreference {
        @NotNull(message = "숙박 유형을 선택해주세요.")
        private String type;
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Double weight;
    }
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class FoodPreference {
        @NotNull(message = "음식 카테고리를 선택해주세요.")
        private String category;
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Double weight;
        
        @NotNull(message = "순서를 입력해주세요.")
        private Integer order;
    }
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ActivityPreference {
        @NotNull(message = "액티비티를 선택해주세요.")
        private String activity;
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Double weight;
        
        @NotNull(message = "순서를 입력해주세요.")
        private Integer order;
    }
}