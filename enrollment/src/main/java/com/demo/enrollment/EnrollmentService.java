package com.demo.enrollment;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EnrollmentService {

    private final EnrollmentRepository repo;

    public EnrollmentService(EnrollmentRepository repo) {
        this.repo = repo;
    }

    public Enrollment enroll(Long studentId, Long courseId) {
        Enrollment enrollment = new Enrollment();
        enrollment.setStudentId(studentId);
        enrollment.setCourseId(courseId);
        return repo.save(enrollment);
    }

    public List<Enrollment> getByStudent(Long studentId) {
        return repo.findByStudentId(studentId);
    }
}
