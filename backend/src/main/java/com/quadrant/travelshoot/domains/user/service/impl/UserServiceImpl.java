package com.quadrant.travelshoot.domains.user.service.impl;

import com.quadrant.travelshoot.domains.user.entity.User;
import com.quadrant.travelshoot.domains.user.repository.UserRepository;
import com.quadrant.travelshoot.domains.user.service.UserService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public User getUserById(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new EntityNotFoundException("사용자를 찾을 수 없습니다"));
    }
}
