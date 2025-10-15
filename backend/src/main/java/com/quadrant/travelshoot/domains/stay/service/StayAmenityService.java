package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;

import java.util.List;

public interface StayAmenityService {

    List<StayAmenity> findByStayId(Long stayId);
}
