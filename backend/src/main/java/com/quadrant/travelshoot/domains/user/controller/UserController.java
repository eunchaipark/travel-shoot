package com.quadrant.travelshoot.domains.user.controller;

import com.quadrant.travelshoot.domains.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class UserController {

    private final UserService userService;

    @PutMapping("/password")
    public ResponseEntity<Void> changePassword(
            @RequestParam String oldPassword,
            @RequestParam String newPassword,
            Authentication authentication) {
        Long userId = Long.valueOf(authentication.getName());
        log.info("비밀번호 변경 API: userId: {}, oldPassword: {}, newPassword: {}", userId, oldPassword,newPassword);
        userService.changePassword(userId, oldPassword, newPassword);
        return ResponseEntity.ok().build();
    }
}

