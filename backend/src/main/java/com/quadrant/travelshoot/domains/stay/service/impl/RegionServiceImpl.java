package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.stay.entity.Region;
import com.quadrant.travelshoot.domains.stay.repository.RegionRepository;
import com.quadrant.travelshoot.domains.stay.service.RegionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RegionServiceImpl implements RegionService {

    private final RegionRepository regionRepository;

    @Override
    public Region findByAddress(String address) {
        return regionRepository.findByAddress(address)
                .orElseGet(() -> {
                    log.warn("주소에서 지역을 찾을 수 없습니다. 기본값(제주시) 반환 - address: {}", address);
                    // 기본값으로 제주시 반환 (region_id = 50110)
                    return regionRepository.findById(50110L)
                            .orElseThrow(() -> new IllegalStateException("기본 지역 데이터가 없습니다."));
                });
    }
}