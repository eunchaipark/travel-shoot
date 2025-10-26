package com.quadrant.travelshoot.domains.common.service;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FileUploadService {

    List<FileUpload> findAllByReferenceTypeAndReferenceId(String stayType, Long stayId);

    FileUpload uploadAndSave(
            MultipartFile file,
            String referenceType,
            Long referenceId,
            Long creatorId,
            Integer sortOrder,
            Boolean isRepresentative
    );
}
