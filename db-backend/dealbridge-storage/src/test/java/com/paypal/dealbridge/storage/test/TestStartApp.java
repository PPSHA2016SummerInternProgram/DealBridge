package com.paypal.dealbridge.storage.test;


import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;



@SpringBootApplication
@ComponentScan("com.paypal.dealbridge.storage")
public class TestStartApp implements CommandLineRunner {
	public static void main(String[] args) {
		SpringApplication.run(TestStartApp.class, args);
	}

	
	@Override
	public void run(String... args) {
	}

}
