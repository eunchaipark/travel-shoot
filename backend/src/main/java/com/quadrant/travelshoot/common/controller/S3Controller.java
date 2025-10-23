package com.quadrant.travelshoot.common.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.quadrant.travelshoot.common.service.S3Service;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/images")
@RequiredArgsConstructor
public class S3Controller {

    private final S3Service s3Service;

    /**
     * 이미지 업로드
     */
    @PostMapping("/upload")
    public ResponseEntity<Map<String, String>> uploadImage(
            @RequestParam("file") MultipartFile file) {
        
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }

        String imageUrl = s3Service.uploadFile(file);
        
        Map<String, String> response = new HashMap<>();
        response.put("url", imageUrl);
        response.put("message", "업로드 성공");
        
        return ResponseEntity.ok(response);
    }

    /**
     * 이미지 삭제
     */
    @DeleteMapping("/delete")
    public ResponseEntity<String> deleteImage(@RequestParam("url") String fileUrl) {
        s3Service.deleteFile(fileUrl);
        return ResponseEntity.ok("삭제 성공");
    }
}