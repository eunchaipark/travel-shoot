package com.quadrant.travelshoot.domains.ai.dto.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.result.Output;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GPTResponse {
    private List<Choice> choices;
    private List<Output> output;
    private Usage usage;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Choice {
        private Message message;
        @JsonProperty("finish_reason")
        private String finishReason;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Message {
        private String role;
        private String content;
        private String refusal;
        private List<String> annotations;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Output {
        private String id;
        private String type;
        private String status;
        private List<Content> content;
        private String role;
    }


    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Content {
        private String type;
        private String text;
        private List<String> annotations;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Usage {
        @JsonProperty("prompt_tokens")
        private Integer promptTokens;
        @JsonProperty("completion_tokens")
        private Integer completionTokens;
        @JsonProperty("total_tokens")
        private Integer totalTokens;
        @JsonProperty("completion_tokens_details")
        private CompletionTokensDetails completionTokensDetails;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class CompletionTokensDetails {
        @JsonProperty("reasoning_tokens")
        private Integer reasoningTokens;
    }
}