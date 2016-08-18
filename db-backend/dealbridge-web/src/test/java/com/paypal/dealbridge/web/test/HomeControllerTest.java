package com.paypal.dealbridge.web.test;

import org.junit.Test;

import com.paypal.dealbridge.web.controller.HomeController;

public class HomeControllerTest {

	@Test
	public void test() {
		HomeController homeController = new HomeController();
		try{
			homeController.showHomePage("shanghai", null, null);
		}
		catch(Exception e){
			
		}
	}

}
