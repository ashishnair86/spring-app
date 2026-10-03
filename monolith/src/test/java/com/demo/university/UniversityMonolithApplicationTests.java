package com.demo.university;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import com.demo.university.course.Course;
import com.demo.university.course.CourseRepository;
import com.demo.university.enrollment.EnrollmentService;
import com.demo.university.student.Student;
import com.demo.university.student.StudentRepository;

import static org.hamcrest.Matchers.hasSize;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(properties = {
		"spring.datasource.url=jdbc:h2:mem:university;MODE=MariaDB;DB_CLOSE_DELAY=-1",
		"spring.datasource.username=sa",
		"spring.datasource.password=",
		"spring.datasource.driver-class-name=org.h2.Driver"
})
@AutoConfigureMockMvc
class UniversityMonolithApplicationTests {
	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private StudentRepository studentRepository;

	@Autowired
	private CourseRepository courseRepository;

	@Autowired
	private EnrollmentService enrollmentService;

	@Test
	void contextLoads() {
	}

	@Test
	void prometheusEndpointIsPublic() throws Exception {
		mockMvc.perform(get("/actuator/prometheus"))
				.andExpect(status().isOk());
	}

	@Test
	void healthEndpointIsPublic() throws Exception {
		mockMvc.perform(get("/actuator/health"))
				.andExpect(status().isOk());
	}

	@Test
	@WithMockUser
	void enrollmentQueryReturnsTheStudentCourse() throws Exception {
		Student student = new Student();
		student.setName("Test Student");
		student.setEmail("test.student@example.com");
		student = studentRepository.save(student);

		Course course = new Course();
		course.setCode("TEST101");
		course.setTitle("Test Course");
		course = courseRepository.save(course);

		enrollmentService.enroll(student.getId(), course.getId());

		mockMvc.perform(get("/enrollments").param("studentId", student.getId().toString()))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$", hasSize(1)))
				.andExpect(jsonPath("$[0].course.code").value("TEST101"))
				.andExpect(jsonPath("$[0].course.title").value("Test Course"));
	}

}
