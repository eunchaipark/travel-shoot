package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.stay.dto.response.StayTrendingResponse;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.StayTrendingService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class StayTrendingServiceImpl implements StayTrendingService {
    
    private final StayRepository stayRepository;
    
    private static final int TRENDING_LIMIT = 12;
    
    @Override
    public List<StayTrendingResponse> getTrendingStays() {
        return stayRepository.findTrendingStays(TRENDING_LIMIT);
    }
}