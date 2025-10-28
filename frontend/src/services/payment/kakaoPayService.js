export const kakaoPayService = {
    async ready(orderData) {
        const response = await fetch(`${window.API_BASE_URL}/api/payment/ready`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(orderData),
        });
        return response.json();
    },

    async approve(pgToken, tid, orderId, userId) {
        const params = new URLSearchParams({ pgToken, tid, orderId, userId });
        const response = await fetch(`${window.API_BASE_URL}/api/payment/approve?${params}`, {
            method: 'POST',
        });
        return response.json();
    },
};