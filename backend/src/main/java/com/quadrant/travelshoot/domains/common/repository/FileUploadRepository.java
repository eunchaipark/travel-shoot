package com.quadrant.travelshoot.domains.common.repository;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Arrays;
import java.util.List;

public interface FileUploadRepository extends JpaRepository<FileUpload, Long> {

    List<FileUpload> findAllByReferenceTypeAndReferenceId(String stayType, Long stayId);
}
