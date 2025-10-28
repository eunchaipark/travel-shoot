package com.quadrant.travelshoot.domains.payment.dto.request;

import lombok.Data;

@Data
public class PaymentCompleteRequest {
    private String tid;
    private String orderId;
    private String userId;
    private String itemName;
    private Integer totalAmount;
    private String approvedAt;
}