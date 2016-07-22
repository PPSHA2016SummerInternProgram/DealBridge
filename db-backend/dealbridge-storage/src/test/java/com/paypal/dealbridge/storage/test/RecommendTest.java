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
	public void getByUserIdTest() {
		List<Recommend> recommends;
		recommends = recommendMapper.getByUserId(1, null, null);
		assertEquals(2, recommends.size());
		
		recommends = recommendMapper.getByUserId(1, null, 1);
		assertEquals(1, recommends.size());
		
		recommends = recommendMapper.getByUserId(1, 1, 1);
		assertEquals(1, recommends.size());
		assertEquals(1001, recommends.get(0).getDiscountId().intValue());
		
	}

}
