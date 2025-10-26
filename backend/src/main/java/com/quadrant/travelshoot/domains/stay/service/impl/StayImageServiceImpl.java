package com.quadrant.travelshoot.domains.stay.service.impl;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.repository.FileUploadRepository;
import com.quadrant.travelshoot.domains.stay.dto.response.StayImageDto;
import com.quadrant.travelshoot.domains.stay.service.StayImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class StayImageServiceImpl implements StayImageService {

    private final FileUploadRepository fileUploadRepository;

//    public Integer getImageCount(Long stayId){
//        return fileUploadRepository.countByReferenceTypeAndReferenceIdAndIsDeletedFalse("STAY", stayId);
//    }

    public List<StayImageDto> getThumbnailImages(Long stayId){
        List<FileUpload> images = fileUploadRepository.findTop5ByReferenceTypeAndReferenceIdOrderBySortOrderAsc("STAY", stayId);

        return images.stream()
                .map(this::toStayImageDto)
                .collect(Collectors.toList());
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
