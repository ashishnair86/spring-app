package com.demo.enrollment;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

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
        @RequestParam Long courseId
    ) {
        return service.enroll(studentId, courseId);
    }

    @GetMapping("/student/{studentId}")
    public List<Enrollment> studentEnrollments(@PathVariable Long studentId) {
        return service.getByStudent(studentId);
    }
}
