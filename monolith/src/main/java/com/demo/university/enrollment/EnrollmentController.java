package com.demo.university.enrollment;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/enrollments")
public class EnrollmentController {

    private final EnrollmentService service;

    public EnrollmentController(EnrollmentService service) {
        this.service = service;
    }

    @PostMapping
    public Enrollment enroll(
            @RequestParam Long studentId,
            @RequestParam Long courseId) {

        return service.enroll(studentId, courseId);
    }

    @GetMapping
    public List<Enrollment> findByStudent(@RequestParam Long studentId) {
        return service.findByStudentId(studentId);
    }
}
