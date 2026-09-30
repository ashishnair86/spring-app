package com.demo.university.auth;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthService service;

    public AuthController(AuthService service) {
        this.service = service;
    }

    @PostMapping("/register")
    public void register(@RequestParam String username,
                         @RequestParam String password) {
        service.register(username, password);
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password) {
        return service.login(username, password);
    }

    @PostMapping("/logout")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void logout(@RequestHeader("Authorization") String authorization) {
        if (!authorization.startsWith("Bearer ")) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        service.logout(authorization.substring(7));
    }
}
