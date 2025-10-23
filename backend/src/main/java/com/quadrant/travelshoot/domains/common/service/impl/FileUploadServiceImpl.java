package com.quadrant.travelshoot.domains.common.service.impl;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.common.repository.FileUploadRepository;
import com.quadrant.travelshoot.domains.common.service.FileUploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileUploadServiceImpl implements FileUploadService {

    private final FileUploadRepository fileUploadRepository;

    public List<FileUpload> findAllByReferenceTypeAndReferenceId(String referenceType, Long referenceId) {
        return fileUploadRepository.findAllByReferenceTypeAndReferenceId(referenceType, referenceId);
    }
}
