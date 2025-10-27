package com.quadrant.travelshoot.common.service;

import com.quadrant.travelshoot.domains.common.dto.response.FileUploadResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class S3Service {

    private final S3Client s3Client;

    @Value("${s3.bucket}")
    private String bucket;

    @Value("${s3.region}")
    private String region;



    /**
     * 파일 업로드 + File 저장
     * uploadFile과 따로 만든 이유는 File 엔티티 저장하기 위함
     */
    @Transactional
    public FileUploadResponse saveFileUpload(MultipartFile file) {
        String s3Key = createFileName(file.getOriginalFilename());

        try {
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(bucket)
                    .key(s3Key)
                    .contentType(file.getContentType())
                    .build();

            s3Client.putObject(putObjectRequest,
                    RequestBody.fromInputStream(file.getInputStream(), file.getSize()));

            String s3Url = getFileUrl(s3Key);

            return FileUploadResponse.builder()
                    .originalFilename(file.getOriginalFilename())
                    .s3Key(s3Key)
                    .s3Url(s3Url)
                    .bucketName(bucket)
                    .fileSize(file.getSize())
                    .contentType(file.getContentType())
                    .build();

        } catch (IOException e) {
            log.error("S3 파일 업로드 실패", e);
            throw new RuntimeException("S3 파일 업로드 실패", e);
        }
    }



    // S3에 파일 업로드
    public String uploadFile(MultipartFile file) {
        String fileName = createFileName(file.getOriginalFilename());
        
        try {
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(bucket)
                    .key(fileName)
                    .contentType(file.getContentType())
                    .build();

            s3Client.putObject(putObjectRequest, 
                    RequestBody.fromInputStream(file.getInputStream(), file.getSize()));
            
            return getFileUrl(fileName);
            
        } catch (IOException e) {
            log.error("S3 파일 업로드 실패", e);
            throw new RuntimeException("S3 파일 업로드 실패", e);
        }
    }

    // S3에서 파일 삭제
    
    public void deleteFile(String fileUrl) {
        String fileName = extractFileNameFromUrl(fileUrl);
        
        DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
                .bucket(bucket)
                .key(fileName)
                .build();
        
        s3Client.deleteObject(deleteObjectRequest);
        log.info("S3 파일 삭제 완료: {}", fileName);
    }

    // 고유한 파일명 생성
    
    private String createFileName(String originalFileName) {
        return "images/" + UUID.randomUUID() + "_" + originalFileName;
    }

    // 파일 URL 생성
    
    private String getFileUrl(String fileName) {
        return String.format("https://%s.s3.%s.amazonaws.com/%s", bucket, region, fileName);
    }

    // URL에서 파일명 추출
     
    private String extractFileNameFromUrl(String fileUrl) {
        return fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
    }
}