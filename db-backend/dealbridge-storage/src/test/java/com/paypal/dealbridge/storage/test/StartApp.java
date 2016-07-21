package com.paypal.dealbridge.storage.test;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.paypal.dealbridge.storage.domain.Share;
import com.paypal.dealbridge.storage.mapper.ShareMapper;


@SpringBootApplication
@ComponentScan("com.paypal.dealbridge.storage")
public class StartApp implements CommandLineRunner {
	@Autowired
	private ShareMapper shareMapper;
	
	
	public static void main(String[] args) {
		SpringApplication.run(StartApp.class, args);
	}

	@Override
	public void run(String... args) {
		Share share = new Share();
		share.setUserId(0);
		share.setDiscountId(8640);
		share.setShareTime(new Date());
		shareMapper.insert(share);
	}

}
