package com.quadrant.travelshoot.domains.stay.controller;

import com.quadrant.travelshoot.domains.stay.dto.response.*;
import com.quadrant.travelshoot.domains.stay.service.BudgetFriendlyService;
import com.quadrant.travelshoot.domains.stay.service.StayImageService;
import com.quadrant.travelshoot.domains.stay.service.StayService;
import com.quadrant.travelshoot.domains.stay.service.impl.StayServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;
import java.util.List;

/**
 * 숙소 컨트롤러
 */
@Slf4j
@RestController
@RequestMapping("/api/stays")
@RequiredArgsConstructor
public class StayBudgetController {

    private final StayService stayService;
    private final StayImageService stayImageService;

    /**
     * 숙소 상세 조회
     */
    @GetMapping("/{stayId}")
    public ResponseEntity<?> getStayDetail(@PathVariable Long stayId,
     @RequestParam(required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkIn,
            @RequestParam(required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkOut
    ){

        StayDetailResponse response = stayService.getStayDetail(stayId, checkIn, checkOut);
        return ResponseEntity.ok(response);
    }

    /**
     * 숙소 내 객실 조회
     */
    @GetMapping("/{stayId}/rooms")
    public ResponseEntity<List<RoomFilterDto>> getRoomFilters(@PathVariable Long stayId){
        List<RoomFilterDto> rooms = stayService.getRoomFilters(stayId);
        return ResponseEntity.ok(rooms);
    }

    /**
     * 숙소 전체 이미지 조회 - 모달용
     */
    @GetMapping("/{stayId}/images")
    public ResponseEntity<List<StayImageDto>> getAllStayImages(@PathVariable Long stayId) {
        List<StayImageDto> images = stayImageService.getAllStayImages(stayId);
        return ResponseEntity.ok(images);
    }


    /**
     * 리뷰 집계한 숙소 평점평균 조회
     */
    @GetMapping("/{stayId}/average-rating")
    public ResponseEntity<StayRatingResponse> getStayRating(@PathVariable Long stayId) {
        StayRatingResponse stayRatingResponse = stayService.getStayRating(stayId);
        return ResponseEntity.ok(stayRatingResponse);
    }

}
