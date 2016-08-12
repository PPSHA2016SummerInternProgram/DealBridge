package com.paypal.dealbridge.storage.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(TestStartApp.class)
@Transactional
public class DiscountMapperTest {

	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
