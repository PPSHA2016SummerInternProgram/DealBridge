package com.paypal.dealbridge.storage.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.paypal.dealbridge.storage.domain.Recommend;
import com.paypal.dealbridge.storage.mapper.RecommendMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(TestStartApp.class)
public class RecommendTest {
	@Autowired
	private RecommendMapper recommendMapper;
	
	
	@Test
	public void getDiscountByUserIdTest() {
		
	}

}
