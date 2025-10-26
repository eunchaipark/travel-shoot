package com.quadrant.travelshoot.domains.common.controller;

import com.quadrant.travelshoot.domains.common.dto.response.FileUploadResponse;
import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.service.FileUploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RestController
@RequestMapping("/api/files")
@RequiredArgsConstructor
public class FileUploadController {

    private final FileUploadService fileUploadService;

    /**
     * 파일 업로드 (S3 + DB 저장)
     */
    @PostMapping(value = "/upload-files", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<FileUploadResponse> uploadImageWithFiles(
            @RequestParam("file") MultipartFile file,
            @RequestParam(required = false) String referenceType,
            @RequestParam(required = false) Long referenceId,
            @RequestParam(required = false) Long userId,
            @RequestParam(required = false) Integer sortOrder,
            @RequestParam(required = false) Boolean isRepresentative
    ) {
        // 임시 userId (실제로는 인증에서 가져와야 함)
        if (userId == null) {
            userId = 17L;
        }

        if (file.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }

        try {
            // S3 업로드 + DB 저장을 한번에 처리
            FileUpload fileUpload = fileUploadService.uploadAndSave(
                    file,
                    referenceType,
                    referenceId,
                    userId,
                    sortOrder,
                    isRepresentative
            );

            // 응답 DTO 생성
            FileUploadResponse response = FileUploadResponse.builder()
                    .fileId(fileUpload.getId())
                    .originalFilename(fileUpload.getOriginalFilename())
                    .s3Key(fileUpload.getS3Key())
                    .s3Url(fileUpload.getS3Url())
                    .bucketName(fileUpload.getBucketName())
                    .fileSize(fileUpload.getFileSize())
                    .contentType(fileUpload.getContentType())
//                    .referenceType(fileUpload.getReferenceType())
//                    .referenceId(fileUpload.getReferenceId())
                    .sortOrder(fileUpload.getSortOrder())
                    .build();

            log.info("파일 업로드 성공 - S3 Key: {}, DB ID: {}", response.getS3Key(), response.getFileId());

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            log.error("파일 업로드 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
