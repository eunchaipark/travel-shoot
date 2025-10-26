package com.quadrant.travelshoot.domains.common.dto.response;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

/**
 * 파일 이미지 응답 DTO
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileUploadResponse {

    private Long fileId;
    private String originalFilename;
    private String s3Key;
    private String s3Url;
    private String bucketName;
    private Long fileSize;
    private String contentType;
    private Integer sortOrder;
    private Boolean isRepresentative;

    public static FileUploadResponse toFileUploadResponse(FileUpload fileUpload) {
        return FileUploadResponse.builder()
                .fileId(fileUpload.getId())
                .originalFilename(fileUpload.getOriginalFilename())
                .s3Url(fileUpload.getS3Url())
                .contentType(fileUpload.getContentType())
                .sortOrder(fileUpload.getSortOrder())
                .build();
    }
}
