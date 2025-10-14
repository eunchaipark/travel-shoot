package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.repository.FileUploadRepository;
import com.quadrant.travelshoot.domains.stay.dto.response.StayDetailResponse;
import com.quadrant.travelshoot.domains.stay.entity.Region;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;
import com.quadrant.travelshoot.domains.stay.mapper.StayMapper;
import com.quadrant.travelshoot.domains.stay.repository.StayAmenityRepository;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayService {

    private final StayRepository stayRepository;
    private final FileUploadRepository fileUploadRepository;
    private final StayAmenityRepository stayAmenityRepository;
    private final StayMapper stayMapper;

    /**
     * 숙소 상세 정보 조회
     * @param stayId 숙소 ID
     * @return StayDetailResponse
     */
    @Transactional
    public StayDetailResponse getStayDetail(Long stayId) {

        Stay stay = stayRepository.findByStayId(stayId)
                .orElseThrow(() -> new IllegalArgumentException("이용할 수 없는 숙소입니다."));

        String stayType = "숙소";

        // 편의시설 조회
        List<StayAmenity> stayAmenities = stayAmenityRepository.findByStayId(stayId);
        // 모든 이미지 조회
        List<FileUpload> images = fileUploadRepository.findAllByReferenceTypeAndReferenceId(
                stayType,
                stayId
        );

        // 조회수 증가
        stayRepository.incrementViewCount(stayId);

        return stayMapper.toStayDetailResponse(stay, images, stayAmenities);




    }
}
