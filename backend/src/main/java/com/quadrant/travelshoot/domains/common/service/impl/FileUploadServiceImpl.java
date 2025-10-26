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
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileUploadServiceImpl implements FileUploadService {

    private final FileUploadRepository fileUploadRepository;
    private final S3Service s3Service;

    public List<FileUpload> findAllByReferenceTypeAndReferenceId(String referenceType, Long referenceId) {
        return fileUploadRepository.findAllByReferenceTypeAndReferenceId(referenceType, referenceId);
    }


    public FileUpload uploadAndSave(
            MultipartFile file,
            String referenceType,
            Long referenceId,
            Long creatorId,
            Integer sortOrder,
            Boolean isRepresentative
    ){
        // s3 업로드
        String s3Url = s3Service.uploadFile(file);

        return null;

    }
}
