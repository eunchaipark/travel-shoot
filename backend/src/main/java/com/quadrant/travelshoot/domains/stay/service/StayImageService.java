package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.dto.response.StayImageDto;
import com.quadrant.travelshoot.domains.stay.dto.response.StayImagesResponse;

import java.util.List;

public interface StayImageService {

    /**
     * 대표 이미지 5개 조회 (썸네일용)
     */
    List<StayImageDto> getThumbnailImages(Long stayId);

    /**
     * 전체 이미지 조회 (모달용)
     */
//    public StayImagesResponse getAllImages(Long stayId);
}
