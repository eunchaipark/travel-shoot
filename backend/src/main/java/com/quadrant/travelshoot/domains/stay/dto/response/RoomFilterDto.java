package com.quadrant.travelshoot.domains.stay.dto.response;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
public class RoomFilterDto {

    private Long roomId;
    private String roomName;

    public RoomFilterDto(Long roomId, String roomName) {
        this.roomId = roomId;
        this.roomName = roomName;
    }

}
