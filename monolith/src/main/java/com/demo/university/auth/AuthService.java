package com.demo.university.auth;

import io.jsonwebtoken.Claims;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.Instant;

@Service
public class AuthService {

    private final UserRepository repo;
    private final RevokedTokenRepository revokedTokens;
    private final BCryptPasswordEncoder encoder;

    public AuthService(UserRepository repo,
                       RevokedTokenRepository revokedTokens,
                       BCryptPasswordEncoder encoder) {
        this.repo = repo;
        this.revokedTokens = revokedTokens;
        this.encoder = encoder;
    }

    public void register(String username, String password) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(encoder.encode(password));
        repo.save(user);
    }

    public String login(String username, String password) {
        User user = repo.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Invalid user"));

        if (!encoder.matches(password, user.getPassword())) {
            throw new RuntimeException("Invalid password");
        }

        return JwtUtil.generateToken(username);
    }

    public void logout(String token) {
        Claims claims = JwtUtil.validateToken(token);
        String tokenId = claims.getId();
        if (tokenId == null) {
            throw new IllegalArgumentException("Token cannot be revoked");
        }

        revokedTokens.deleteByExpiresAtBefore(Instant.now());
        revokedTokens.save(new RevokedToken(tokenId, claims.getExpiration().toInstant()));
    }
}
