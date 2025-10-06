package com.quadrant.travelshoot.domains.user.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    @Column(unique = true, nullable = false, length = 255)
    private String email;

    @Column(nullable = false, length = 255)
//    @Column(length = 255)
    private String password;

    @Column(name = "user_name", nullable = false, length = 100)
//    private String name;
    private String userName;

    @Builder.Default
    @Column(name = "email_verified", nullable = false)
    private Boolean emailVerified = false;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    //todo 1005 init.sql에 없음 꼭 필요한거는 아니라고 생각해서 user 엔티티에서 우선 제거합니다...?!?

//    @Column(name = "expired_at")
//    private LocalDateTime expiredAt;
//
//    @Column(name = "last_login_at")
//    private LocalDateTime lastLoginAt;
}