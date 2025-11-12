// GPTRequest.java
package com.quadrant.travelshoot.domains.ai.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GPTRequest {
    private String model;
    private String input;
    private Map<String, String> reasoning;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Message {
        private String role;
        private String content;
    }
}