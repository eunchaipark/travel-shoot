package com.quadrant.travelshoot.domains.stay.service;

import java.util.List;

import com.quadrant.travelshoot.domains.stay.dto.response.TravelNowResponse;

public interface TravelNowService {
    List<TravelNowResponse> getAllTravelNowDestinations();
}