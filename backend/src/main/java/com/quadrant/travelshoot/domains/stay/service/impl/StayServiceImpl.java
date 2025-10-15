package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.service.impl.FileUploadServiceImpl;
import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;
import com.quadrant.travelshoot.domains.stay.mapper.StayMapper;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayServiceImpl implements StayService {

    private final StayRepository stayRepository;
    private final FileUploadServiceImpl fileUploadService;
    private final StayAmenityServiceImpl stayAmenityService;
    private final StayMapper stayMapper;

    /**
     * 숙소 상세 정보 조회
     * @param stayId 숙소 ID
     * @return StayDetailResponse
     */
    @Override
    @Transactional
    public StayDetailResponse getStayDetail(Long stayId) {
        Stay stay = stayRepository.findByStayId(stayId)
                .orElseThrow(() -> new IllegalArgumentException("이용할 수 없는 숙소입니다."));

        // 조회수 증가 - 조회수 테이블 따로 있어서
//        stayRepository.incrementViewCount(stayId);
        String stayType = "숙소";

        // 편의시설 조회
        List<StayAmenity> stayAmenities = stayAmenityService.findByStayId(stayId);
        // 모든 이미지 조회
        List<FileUpload> images = fileUploadService.findAllByReferenceTypeAndReferenceId(stayType, stayId);
        return stayMapper.toStayDetailResponse(stay, images, stayAmenities);
    }

    @Override
    public Stay getById(Long stayId) {
        return stayRepository.findById(stayId)
                .orElseThrow(() -> new IllegalArgumentException("숙소 정보를 찾을 수 없습니다."));
    }
}
