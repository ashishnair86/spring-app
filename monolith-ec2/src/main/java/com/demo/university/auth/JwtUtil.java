package com.demo.university.auth;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

import javax.crypto.SecretKey;
import java.util.Date;

public class JwtUtil {

    // MUST be at least 256 bits for HS256
    private static final String SECRET =
            "verysecretkeyverysecretkeyverysecretkey123";

    private static final long EXPIRATION = 1000 * 60 * 60; // 1 hour

    // IMPORTANT: use SecretKey, not Key
    private static final SecretKey key =
            Keys.hmacShaKeyFor(SECRET.getBytes());

    public static String generateToken(String username) {
        return Jwts.builder()
                .subject(username)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + EXPIRATION))
                .signWith(key)   // ✅ FIXED
                .compact();
    }

    public static String validateToken(String token) {
        return Jwts.parser()
                .verifyWith(key)   // ✅ FIXED
                .build()
                .parseSignedClaims(token)
                .getPayload()
                .getSubject();
    }
}
