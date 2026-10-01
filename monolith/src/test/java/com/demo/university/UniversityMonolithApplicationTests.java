package com.demo.university;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
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

	@Test
	void contextLoads() {
	}

	@Test
	void prometheusEndpointIsPublic() throws Exception {
		mockMvc.perform(get("/actuator/prometheus"))
				.andExpect(status().isOk());
	}

}
