package com.demo.university.auth;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.config.http.SessionCreationPolicy;

@Configuration
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    SecurityFilterChain securityFilterChain(
            HttpSecurity http) throws Exception {

        return http

            // disable csrf for REST/JWT
            .csrf(csrf -> csrf.disable())

            // JWT APIs should not create sessions
            .sessionManagement(session ->
                session.sessionCreationPolicy(
                    SessionCreationPolicy.STATELESS))

            // permit registration and login
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/auth/register",
                    "/auth/login"
                ).permitAll()

                .anyRequest()
                .authenticated()
            )

            // insert your JWT filter
            .addFilterBefore(
                new JwtFilter(),
                UsernamePasswordAuthenticationFilter.class
            )

            .build();
    }
}
