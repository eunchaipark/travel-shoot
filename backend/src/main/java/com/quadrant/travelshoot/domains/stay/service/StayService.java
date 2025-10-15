package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;

public interface StayService {

    StayDetailResponse getStayDetail(Long stayId);
    Stay getById(Long stayId);
}
