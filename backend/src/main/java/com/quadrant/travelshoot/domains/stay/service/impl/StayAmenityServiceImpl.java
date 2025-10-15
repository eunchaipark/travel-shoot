package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;
import com.quadrant.travelshoot.domains.stay.repository.StayAmenityRepository;
import com.quadrant.travelshoot.domains.stay.service.StayAmenityService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayAmenityServiceImpl implements StayAmenityService {

    private final StayAmenityRepository stayAmenityRepository;

    public List<StayAmenity> findByStayId(Long stayId) {
        return stayAmenityRepository.findByStayId(stayId);
    }
}
