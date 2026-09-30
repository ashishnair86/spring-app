package com.demo.university.auth;

import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Claims;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;

public class JwtFilter extends OncePerRequestFilter {
    private final RevokedTokenRepository revokedTokens;

    public JwtFilter(RevokedTokenRepository revokedTokens) {
        this.revokedTokens = revokedTokens;
    }

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain)
            throws ServletException, IOException {

        String authHeader = request.getHeader("Authorization");

        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);

            try {
                Claims claims = JwtUtil.validateToken(token);
                String tokenId = claims.getId();
                if (tokenId != null && !revokedTokens.existsById(tokenId)) {
                    UsernamePasswordAuthenticationToken authentication =
                        new UsernamePasswordAuthenticationToken(
                            claims.getSubject(),
                            null,
                            Collections.emptyList()
                        );

                    authentication.setDetails(
                        new WebAuthenticationDetailsSource()
                            .buildDetails(request)
                    );

                    SecurityContextHolder.getContext()
                        .setAuthentication(authentication);
                }
            } catch (JwtException | IllegalArgumentException exception) {
                SecurityContextHolder.clearContext();
            }
        }

        filterChain.doFilter(request, response);
    }
}
