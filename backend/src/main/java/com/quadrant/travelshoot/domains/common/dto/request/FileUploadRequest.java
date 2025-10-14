package com.quadrant.travelshoot.domains.common.dto.request;


import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 파일 업로드 요청 DTO
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileUploadRequest {

    private String originalFilename;
    private String s3Key;
    private String s3Url;
    private String bucketName;
    private Long fileSize;
    private String contentType;
    private String referenceType;
    private Long referenceId;
    private Integer sortOrder;
    private Boolean isRepresentative;
    private Long creatorId;

    public FileUpload toEntity() {
        return FileUpload.builder()
                .originalFilename(originalFilename)
                .s3Key(s3Key)
                .s3Url(s3Url)
                .bucketName(bucketName)
                .fileSize(fileSize)
                .contentType(contentType)
                .referenceType(referenceType)
                .referenceId(referenceId)
                .sortOrder(sortOrder != null ? sortOrder : 0)
                .isRepresentative(isRepresentative != null ? isRepresentative : false)
                .creatorId(creatorId)
                .uploadedAt(LocalDateTime.now())
                .isPublic(true)
                .isDeleted(false)
                .build();
    }

}
