package com.quadrant.travelshoot.domains.common.repository;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public interface FileUploadRepository extends JpaRepository<FileUpload, Long> {

    @Query("SELECT f FROM FileUpload f " +
           "WHERE f.referenceType = :referenceType " +
           "AND f.referenceId = :referenceId " +
           "AND f.isRepresentative = true " +
           "AND f.isDeleted = false " +
           "ORDER BY f.sortOrder ASC")
    Optional<FileUpload> findRepresentativeImage(
        @Param("referenceType") String referenceType,
        @Param("referenceId") Long referenceId
    );

    List<FileUpload> findAllByReferenceTypeAndReferenceIdAndIsDeletedFalse(String referenceType, Long referenceId);

    // 숙소 썸네일 이미지 5개
    List<FileUpload> findTop5ByReferenceTypeAndReferenceIdOrderBySortOrderAsc(String referenceType, Long referenceId);
    // 전체 이미지
//    List<FileUpload> findAllByReferenceTypeAndReferenceIdAndIsDeletedFalseOrderBySortOrderAsc(String referenceType, Long referenceId);
    // 숙소 이미지 개수
//    Integer countByReferenceTypeAndReferenceIdAndIsDeletedFalse(String stay, Long stayId);
}
