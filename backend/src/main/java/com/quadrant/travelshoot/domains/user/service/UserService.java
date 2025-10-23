package com.quadrant.travelshoot.domains.user.service;

public interface UserService {
    void changePassword(Long userId, String oldPassword, String newPassword);
}
