package com.quadrant.travelshoot.domains.common.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Comment;

import java.time.LocalDateTime;

@Entity
@Table(name = "files", indexes = {
        @Index(name = "idx_reference", columnList = "reference_type, reference_id"),
        @Index(name = "idx_s3_key", columnList = "s3_key")
})
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Comment("파일")
public class FileUpload {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "file_id")
    @Comment("파일 ID")
    private Long id;

    @Column(name = "original_filename", nullable = false)
    @Comment("원본 파일명")
    private String originalFilename;

    @Column(name = "s3_key", nullable = false, unique = true, length = 500)
    @Comment("S3 키")
    private String s3Key;

    @Column(name = "s3_url", nullable = false, length = 1000)
    @Comment("S3 URL")
    private String s3Url;

    @Column(name = "bucket_name", nullable = false)
    @Comment("버킷명")
    private String bucketName;

    @Column(name = "file_size", nullable = false)
    @Comment("파일 크기")
    private Long fileSize;

    @Column(name = "content_type", nullable = false, length = 100)
    @Comment("컨텐츠 타입")
    private String contentType;

    @Column(name = "reference_type", nullable = false, length = 50)
    @Comment("참조 테이블명")
//    @Enumerated(EnumType.STRING)
    private String referenceType;

    @Column(name = "reference_id", nullable = false)
    @Comment("참조 테이블ID")
    private Long referenceId;

    @Column(name = "sort_order", nullable = false)
    @Comment("정렬 순서")
    @Builder.Default
    private Integer sortOrder = 0;

    @Column(name = "is_representative", nullable = false)
    @Comment("대표 여부")
    @Builder.Default
    private Boolean isRepresentative = false;

    @Column(name = "creator_id", nullable = false)
    @Comment("생성자 ID")
    private Long creatorId;

    @Column(name = "uploaded_at", nullable = false)
    @Comment("업로드 일시")
    @Builder.Default
    private LocalDateTime uploadedAt = LocalDateTime.now();

    @Column(name = "is_public", nullable = false)
    @Comment("공개 여부")
    @Builder.Default
    private Boolean isPublic = true;

    @Column(name = "is_deleted", nullable = false)
    @Comment("삭제 여부")
    @Builder.Default
    private Boolean isDeleted = false;
}
