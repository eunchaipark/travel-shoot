package com.quadrant.travelshoot.domains.user.dto.request;

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
    
    @Valid
    @NotEmpty(message = "선호 지역을 최소 1개 이상 선택해주세요.")
    @Size(min = 1, max = 5, message = "선호 지역은 1~5개까지 선택 가능합니다.")
    private List<RegionPreference> preferredRegions;
    
    @Valid
    @NotNull(message = "숙박 유형을 선택해주세요.")
    private StayTypePreference stayType;
    
    @Valid
    @NotEmpty(message = "선호 음식을 최소 2개 이상 선택해주세요.")
    @Size(min = 2, max = 5, message = "선호 음식은 2~5개까지 선택 가능합니다.")
    private List<FoodPreference> foodPreferences;
    
    @Valid
    @NotEmpty(message = "선호 액티비티를 최소 2개 이상 선택해주세요.")
    @Size(min = 2, max = 4, message = "선호 액티비티는 2~4개까지 선택 가능합니다.")
    private List<ActivityPreference> activityPreferences;
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class RegionPreference {
        @NotNull(message = "지역을 선택해주세요.")
        private String region;  // "서울", "부산", "제주도" 등
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Integer weight;  // 5, 4, 3, 2, 1
    }
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class StayTypePreference {
        @NotNull(message = "숙박 유형을 선택해주세요.")
        private String type;  // "펜션", "모텔", "호텔"
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Integer weight;  // 5
    }
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class FoodPreference {
        @NotNull(message = "음식 카테고리를 선택해주세요.")
        private String category;  // "한식", "중식", "일식" 등
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Integer weight;  // 5, 4, 3, 2, 1
        
        @NotNull(message = "순서를 입력해주세요.")
        private Integer order;  // 1, 2, 3, 4, 5
    }
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ActivityPreference {
        @NotNull(message = "액티비티를 선택해주세요.")
        private String activity;  // "자연관광", "문화체험" 등
        
        @NotNull(message = "가중치를 입력해주세요.")
        private Integer weight;  // 5, 4, 3, 2
        
        @NotNull(message = "순서를 입력해주세요.")
        private Integer order;  // 1, 2, 3, 4
    }
}