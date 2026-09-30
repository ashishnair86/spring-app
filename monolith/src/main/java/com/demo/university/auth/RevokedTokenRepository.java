package com.demo.university.auth;

import java.time.Instant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RevokedTokenRepository extends JpaRepository<RevokedToken, String> {
    long deleteByExpiresAtBefore(Instant expiresAt);
}