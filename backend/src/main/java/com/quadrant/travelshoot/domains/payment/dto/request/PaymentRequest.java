package com.quadrant.travelshoot.domains.payment.dto.request;

import lombok.Data;

@Data
public class PaymentRequest {
    private String orderId;
    private String userId;
    private String itemName;
    private Integer quantity;
    private Integer totalAmount;
}