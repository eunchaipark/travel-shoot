package com.quadrant.travelshoot.domains.ai.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.quadrant.travelshoot.domains.activity.entity.Activity;
import com.quadrant.travelshoot.domains.restaurant.entity.Restaurant;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.StayLocation;
import com.quadrant.travelshoot.domains.travelcourse.dto.response.TravelCourseRecommendationData;
import com.quadrant.travelshoot.domains.travelcourse.entity.CourseSpot;
import com.quadrant.travelshoot.domains.travelcourse.entity.TravelCourse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class TravelCourseGenerationService {

    private final OpenAIService openAIService;
    private final ObjectMapper objectMapper;

    public List<CourseSpot> generateCourse(
            Long reservationId,
            Integer totalDays,
            TravelCourse travelCourse,
            TravelCourseRecommendationData recommendationData) {
        try {
            log.info("여행 코스 생성 시작 - reservationId: {}, totalDays: {}", reservationId, totalDays);

            String systemPrompt = buildSystemPrompt();
            String userPrompt = buildUserPrompt(totalDays, recommendationData);

            String gptResponse = openAIService.callGPT(systemPrompt, userPrompt);
            List<CourseSpot> courseSpots = parseGPTResponse(gptResponse, travelCourse);

            log.info("여행 코스 생성 완료 - spots: {}", courseSpots.size());
            return courseSpots;

        } catch (Exception e) {
            log.error("여행 코스 생성 실패: {}", e.getMessage(), e);
            throw new RuntimeException("여행 코스 생성 실패", e);
        }
    }

    private String buildSystemPrompt() {
        return "You are a professional travel course planner. " +
                "Analyze user preferences and create an optimal travel itinerary. " +
                "Return only valid JSON format without any additional text. " +
                "**Write the 'comment' field in KOREAN.**";
    }

    private String buildUserPrompt(Integer totalDays, TravelCourseRecommendationData data) {
        StringBuilder prompt = new StringBuilder();

        prompt.append("You are a professional travel planner. Create an optimal travel itinerary based on the following information.\n\n");

        // Basic Info
        prompt.append("=== Basic Information ===\n");
        prompt.append("Total Days: ").append(totalDays).append(" days\n");

        // Stay Location
        if (data.getStayLocation() != null) {
            StayLocation stay = data.getStayLocation();
            prompt.append("\n=== Accommodation ===\n");
            prompt.append("- Name: ").append(stay.getStayName()).append("\n");
            prompt.append("- Address: ").append(stay.getAddress()).append("\n");
            prompt.append("- Coordinates: ").append(stay.getLatitude())
                    .append(", ").append(stay.getLongitude()).append("\n");
        }

        // Survey availability
        if (data.getHasSurvey() != null && data.getHasSurvey()) {
            prompt.append("\n※ User survey data is available. Please consider preferences.\n");
        }

        // Restaurant candidates
        prompt.append("\n=== Restaurant Candidates ===\n");
        if (data.getRestaurants() != null && !data.getRestaurants().isEmpty()) {
            for (int i = 0; i < data.getRestaurants().size(); i++) {
                Restaurant r = data.getRestaurants().get(i);
                prompt.append(String.format("%d. [ID: %d] %s\n",
                        i + 1, r.getId(), r.getRestaurantName()));
                prompt.append(String.format("   - Address: %s\n", r.getAddress()));
                if (r.getFoodType() != null) {
                    prompt.append(String.format("   - Food Type: %s\n", r.getFoodType()));
                }
                if (r.getRating() != null && r.getRating().compareTo(BigDecimal.ZERO) > 0) {
                    prompt.append(String.format("   - Rating: %.1f\n", r.getRating()));
                }
                if (r.getSignatureMenu() != null) {
                    prompt.append(String.format("   - Signature: %s\n", r.getSignatureMenu()));
                }
                if (r.getClosedDays() != null) {
                    prompt.append(String.format("   - Closed: %s\n", r.getClosedDays()));
                }
                prompt.append(String.format("   - Location: (%.6f, %.6f)\n",
                        r.getLatitude(), r.getLongitude()));
                prompt.append("\n");
            }
        } else {
            prompt.append("No restaurant candidates available.\n\n");
        }

        // Activity candidates
        prompt.append("=== Activity/Tourist Spot Candidates ===\n");
        if (data.getActivities() != null && !data.getActivities().isEmpty()) {
            for (int i = 0; i < data.getActivities().size(); i++) {
                Activity a = data.getActivities().get(i);
                prompt.append(String.format("%d. [ID: %d] %s\n",
                        i + 1, a.getId(), a.getActivityName()));
                prompt.append(String.format("   - Address: %s\n", a.getAddress()));
                if (a.getActivityType() != null) {
                    prompt.append(String.format("   - Type: %s\n", a.getActivityType()));
                }
                if (a.getRating() != null && a.getRating().compareTo(BigDecimal.ZERO) > 0) {
                    prompt.append(String.format("   - Rating: %.1f\n", a.getRating()));
                }
                prompt.append(String.format("   - Location: (%.6f, %.6f)\n",
                        a.getLatitude(), a.getLongitude()));
                prompt.append("\n");
            }
        } else {
            prompt.append("No activity candidates available.\n\n");
        }

        // Requirements
        prompt.append("\n=== Requirements ===\n");
        prompt.append("1. Select spots ONLY from the candidates provided above\n");
        prompt.append("2. Use the exact ID as spotId in your response\n");
        prompt.append("3. Optimize routes considering accommodation location and coordinates\n");
        prompt.append("4. Schedule restaurants for lunch (12:00-14:00) and dinner (18:00-20:00) times\n");
        prompt.append("5. Daily schedule should be between 09:00-21:00\n");
        prompt.append("6. Consider appropriate duration and travel time between spots (use coordinates to estimate distance)\n");
        prompt.append("7. Avoid restaurants on their closed days if specified\n");
        prompt.append("8. **IMPORTANT: Provide 'comment' field in KOREAN**\n");
        prompt.append("9. Use '관광지' for activities and '맛집' for restaurants in the 'type' field\n\n");

        // JSON format
        prompt.append("=== Response Format (JSON) ===\n");
        prompt.append("{\n");
        prompt.append("  \"courses\": [\n");
        prompt.append("    {\n");
        prompt.append("      \"day\": 1,\n");
        prompt.append("      \"spots\": [\n");
        prompt.append("        {\n");
        prompt.append("          \"order\": 1,\n");
        prompt.append("          \"type\": \"관광지\",\n");
        prompt.append("          \"spotId\": 1085,\n");
        prompt.append("          \"startTime\": \"09:00\",\n");
        prompt.append("          \"endTime\": \"12:00\",\n");
        prompt.append("          \"comment\": \"아침 일찍 방문하여 한적하게 관람\"\n");
        prompt.append("        },\n");
        prompt.append("        {\n");
        prompt.append("          \"order\": 2,\n");
        prompt.append("          \"type\": \"맛집\",\n");
        prompt.append("          \"spotId\": 2041,\n");
        prompt.append("          \"startTime\": \"12:30\",\n");
        prompt.append("          \"endTime\": \"13:30\",\n");
        prompt.append("          \"comment\": \"현지 맛집에서 점심 식사\"\n");
        prompt.append("        }\n");
        prompt.append("      ]\n");
        prompt.append("    }\n");
        prompt.append("  ]\n");
        prompt.append("}\n\n");

        prompt.append("※ Respond ONLY in the JSON format above. No additional text.\n");
        prompt.append("※ Write 'comment' field in KOREAN for Korean users.\n");
        prompt.append("※ Ensure all spotIds match the IDs provided in the candidates list.\n");

        return prompt.toString();
    }

    private List<CourseSpot> parseGPTResponse(String content, TravelCourse travelCourse) {
        try {
            // JSON 파싱
            CourseResponse courseResponse = objectMapper.readValue(content, CourseResponse.class);

            List<CourseSpot> courseSpots = new ArrayList<>();

            for (CourseResponse.DayCourse dayCourse : courseResponse.getCourses()) {
                for (CourseResponse.SpotData spotData : dayCourse.getSpots()) {
                    CourseSpot courseSpot = CourseSpot.builder()
                            .travelCourse(travelCourse)
                            .day(dayCourse.getDay())
                            .spotOrder(spotData.getOrder())
                            .spotType(CourseSpot.SpotType.valueOf(spotData.getType()))
                            .referenceId(spotData.getSpotId())
                            .startTime(LocalTime.parse(spotData.getStartTime()))
                            .endTime(LocalTime.parse(spotData.getEndTime()))
                            .aiComment(spotData.getComment())
                            .build();

                    courseSpots.add(courseSpot);
                }
            }

            return courseSpots;

        } catch (JsonProcessingException e) {
            log.error("GPT 응답 파싱 실패: {}", e.getMessage());
            throw new RuntimeException("GPT 응답 파싱 실패", e);
        }
    }

    // GPT 응답 파싱용 DTO
    @lombok.Data
    private static class CourseResponse {
        private List<DayCourse> courses;

        @lombok.Data
        private static class DayCourse {
            private Integer day;
            private List<SpotData> spots;
        }

        @lombok.Data
        private static class SpotData {
            private Integer order;
            private String type;
            private Long spotId;
            private String startTime;
            private String endTime;
            private String comment;
        }
    }
}