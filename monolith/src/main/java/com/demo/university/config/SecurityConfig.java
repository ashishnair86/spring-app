package com.demo.university.config;

import com.demo.university.auth.JwtFilter;
import com.demo.university.auth.RevokedTokenRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig {

    @Bean
    public JwtFilter jwtFilter(RevokedTokenRepository revokedTokens) {
        return new JwtFilter(revokedTokens);
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, JwtFilter jwtFilter)
            throws Exception {

        http
            .csrf(csrf -> csrf.disable())
            .httpBasic(basic -> basic.disable())
            .formLogin(form -> form.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/auth/register", "/auth/login").permitAll()
                .requestMatchers("/", "/index.html", "/app.js", "/style.css").permitAll()
                .anyRequest().authenticated()
            )
            // ✅ THIS IS THE KEY LINE
            .addFilterBefore(
                jwtFilter,
                UsernamePasswordAuthenticationFilter.class
            );

        return http.build();
    }
}
