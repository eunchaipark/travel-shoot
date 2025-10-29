package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.repository.FileUploadRepository;
import com.quadrant.travelshoot.domains.stay.dto.response.StayImageDto;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.repository.StayRepository;
import com.quadrant.travelshoot.domains.stay.service.StayImageService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayImageServiceImpl implements StayImageService {

    private final StayRepository stayRepository;
    private final FileUploadRepository fileUploadRepository;


    /**
     * 숙소 이미지 목록 조회하기 편한 메서드
     */
    public Stay getStayWithImages(Long stayId) {
        Stay stay = stayRepository.findById(stayId)
                .orElseThrow(() -> new EntityNotFoundException("존재하지 않는 숙소입니다."));

        List<FileUpload> images = fileUploadRepository.findAllByReferenceTypeAndReferenceIdAndIsDeletedFalseOrderBySortOrderAsc("STAYS", stay.getId());
        stay.setStayImages(images);
        return stay;
    }

    /**
     * 숙소 썸네일 이미지 최소 5개
     * @param stayId
     * @return List<StayImageDto>
     */
    public List<StayImageDto> getThumbnailImages(Long stayId){
        List<FileUpload> images = fileUploadRepository.findTop5ByReferenceTypeAndReferenceIdOrderBySortOrderAsc("STAYS", stayId);

        return images.stream()
                .map(this::toStayImageDto)
                .collect(Collectors.toList());
    }

    /**
     * 숙소 전체 이미지 조회
     */
    public List<StayImageDto> getAllStayImages(Long stayId){
        List<FileUpload> images = fileUploadRepository.findAllByReferenceTypeAndReferenceIdAndIsDeletedFalseOrderBySortOrderAsc("STAYS", stayId);
        return images.stream().map(this::toStayImageDto).toList();
    }

    /**
     * 객실 조회용 이미지 1개
     * @param roomId
     * @return
     */
    public String getRoomImage(Long roomId){
        String roomImageUrl = fileUploadRepository.findFirstByReferenceTypeAndReferenceIdAndIsDeletedFalseOrderBySortOrderAsc("ROOMS", roomId)
                .map(FileUpload::getS3Url)
                .orElse("/images/product/hotel-bathroom-modern-design.jpg");

        return roomImageUrl;
    }

    /**
     * FileUpload -> 간단한 StayImageDto 변환
     * private Long fileId;
     *     private String s3Key;
     *     private String s3Url;
     *     private Integer sortOrder;
     */
    private StayImageDto toStayImageDto(FileUpload fileUpload) {
        return StayImageDto.builder()
                .imageId(fileUpload.getId())
                .s3Key(fileUpload.getS3Key())
                .s3Url(fileUpload.getS3Url())
                .sortOrder(fileUpload.getSortOrder())
                .build();
    }


}
