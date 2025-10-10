package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.*;

//자동완성 검색창 ( 지역 )
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AutocompleteResponse {
    private String keyword;
    private String type;
}