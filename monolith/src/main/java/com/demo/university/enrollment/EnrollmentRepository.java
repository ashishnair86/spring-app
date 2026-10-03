package com.demo.university.enrollment;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {
	List<Enrollment> findByStudent_Id(Long studentId);
}
