package com.quadrant.travelshoot.domains.common.service.impl;

import com.quadrant.travelshoot.common.service.S3Service;
import com.quadrant.travelshoot.domains.common.dto.response.FileUploadResponse;
import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.repository.FileUploadRepository;
import com.quadrant.travelshoot.domains.common.service.FileUploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileUploadServiceImpl implements FileUploadService {

    private final FileUploadRepository fileUploadRepository;
    private final S3Service s3Service;

    public List<FileUpload> findAllByReferenceTypeAndReferenceId(String referenceType, Long referenceId) {
        return fileUploadRepository.findAllByReferenceTypeAndReferenceIdAndIsDeletedFalse(referenceType, referenceId);
    }

    /**
     * 파일 업로드 + File 저장
     * uploadFile과 따로 만든 이유는 File 엔티티 저장하기 위함
     */
    public FileUpload uploadAndSave(
            MultipartFile file,
            String referenceType,
            Long referenceId,
            Long creatorId,
            Integer sortOrder,
            Boolean isRepresentative
    ){
        // aws s3에 업로드 후 업로드값 가져오기
        FileUploadResponse fileUploadResponse = s3Service.saveFileUpload(file);

        // DB 저장
        FileUpload fileUpload = FileUpload.builder()
                .originalFilename(fileUploadResponse.getOriginalFilename())
                .s3Key(fileUploadResponse.getS3Key())
                .s3Url(fileUploadResponse.getS3Url())
                .bucketName(fileUploadResponse.getBucketName())
                .fileSize(fileUploadResponse.getFileSize())
                .contentType(fileUploadResponse.getContentType())
                .referenceType(referenceType)
                .referenceId(referenceId)
                .creatorId(creatorId)
                .sortOrder(sortOrder != null ? sortOrder : 0)
                .isRepresentative(isRepresentative != null ? isRepresentative : false)
                .build();

        return fileUploadRepository.save(fileUpload);

    }
}
