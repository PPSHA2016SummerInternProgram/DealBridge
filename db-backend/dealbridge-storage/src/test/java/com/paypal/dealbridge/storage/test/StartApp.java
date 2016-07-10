package com.paypal.dealbridge.storage.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.paypal.dealbridge.storage.mapper.CityMapper;

@SpringBootApplication
@ComponentScan("com.paypal.dealbridge.storage")
public class StartApp implements CommandLineRunner {
    @Autowired
    private CityMapper cityMapper;
    
    public static void main(String[] args) {
        SpringApplication.run(StartApp.class, args);
    }
    
    @Override
    public void run(String... args) {
        System.out.println(cityMapper.getById(3).getName());
    }
}
