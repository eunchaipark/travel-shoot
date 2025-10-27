package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.RoomFilterDto;
import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import com.quadrant.travelshoot.domains.stay.dto.response.StayImageDto;
import com.quadrant.travelshoot.domains.stay.dto.response.StayRatingResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;

import java.util.List;

public interface StayService {

    StayDetailResponse getStayDetail(Long stayId);
    Stay getById(Long stayId);

    List<RoomFilterDto> getRoomFilters(Long stayId);
    StayRatingResponse getStayRating(Long stayId);

}
