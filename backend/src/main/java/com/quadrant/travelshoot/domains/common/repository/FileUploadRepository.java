package com.quadrant.travelshoot.domains.common.repository;

import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface FileUploadRepository extends JpaRepository<FileUpload, Long> {

    List<FileUpload> findAllByReferenceTypeAndReferenceId(String stayType, Long stayId);

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
}
