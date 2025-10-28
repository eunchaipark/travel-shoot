package com.quadrant.travelshoot.domains.payment.controller;

import com.quadrant.travelshoot.domains.payment.dto.request.PaymentRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/payment")
@RequiredArgsConstructor
public class PaymentController {

    @Value("${kakao.pay.secret-key}")
    private String secretKey;

    @Value("${kakao.pay.cid}")
    private String cid;

    @Value("${kakao.pay.redirect-base-url}")
    private String redirectBaseUrl;

    // 1. 결제 준비 (Admin Key 숨기기용)
    @PostMapping("/ready")
    public ResponseEntity<?> ready(@RequestBody PaymentRequest request) {
        log.info("orderId: {}", request.getOrderId());
        log.info("userId: {}", request.getUserId());
        log.info("itemName: {}", request.getItemName());
        log.info("totalAmount: {}", request.getTotalAmount());
        log.info("secretKey: {}", secretKey != null ? "설정됨" : "NULL");
        log.info("cid: {}", cid);

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "SECRET_KEY " + secretKey);
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, Object> params = new HashMap<>();
        params.put("cid", cid);
        params.put("partner_order_id", request.getOrderId());
        params.put("partner_user_id", request.getUserId());
        params.put("item_name", request.getItemName());
        params.put("quantity", request.getQuantity());
        params.put("total_amount", request.getTotalAmount());
        params.put("tax_free_amount", 0);
        //TODO : 로컬용
//        params.put("approval_url", "http://localhost:3000/payment/success");
//        params.put("cancel_url", "http://localhost:3000/payment/cancel");
//        params.put("fail_url", "http://localhost:3000/payment/fail");

        params.put("approval_url", redirectBaseUrl + "/payment/success");
        params.put("cancel_url", redirectBaseUrl + "/payment/cancel");
        params.put("fail_url", redirectBaseUrl + "/payment/fail");


        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(params, headers);

        log.info("카카오페이 API 호출 시작");
        log.info("URL: https://open-api.kakaopay.com/online/v1/payment/ready");
        log.info("params: {}", params);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(
                    "https://open-api.kakaopay.com/online/v1/payment/ready",
                    entity,
                    Map.class
            );

            log.info("카카오페이 API 응답 성공: {}", response.getBody());
            return response;
        } catch (Exception e) {
            log.error("카카오페이 API 호출 실패", e);
            throw e;
        }
    }

    // 2. 결제 승인
    @PostMapping("/approve")
    public ResponseEntity<?> approve(
            @RequestParam String pgToken,
            @RequestParam String tid,
            @RequestParam String orderId,
            @RequestParam String userId) {

        log.info("카카오페이 결제 승인 - orderId: {}, tid: {}", orderId, tid);

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "SECRET_KEY " + secretKey);
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, Object> params = new HashMap<>();
        params.put("cid", cid);
        params.put("tid", tid);
        params.put("partner_order_id", orderId);
        params.put("partner_user_id", userId);
        params.put("pg_token", pgToken);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(params, headers);

        ResponseEntity<Map> response = restTemplate.postForEntity(
                "https://open-api.kakaopay.com/online/v1/payment/approve",
                entity,
                Map.class
        );

        // 3. 결제 완료 정보 DB 저장 (여기서 처리)
        // TODO: Payment 상태를 결제완료로 업데이트
//         paymentService.updatePaymentStatus(tid, PaymentStatus.결제완료);

        return response;
    }
}