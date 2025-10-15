package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;

public interface StayService {

    StayDetailResponse getStayDetail(Long stayId);

}
