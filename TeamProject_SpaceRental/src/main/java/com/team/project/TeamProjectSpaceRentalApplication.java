package com.team.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource("classpath:custom.properties")
public class TeamProjectSpaceRentalApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamProjectSpaceRentalApplication.class, args);
	}

}
