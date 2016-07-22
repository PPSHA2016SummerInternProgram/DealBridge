package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.DiscountService;
import com.paypal.dealbridge.service.RecommendService;
import com.paypal.dealbridge.storage.domain.Discount;

@Controller
public class HomeController {
	
	@Autowired
	private DiscountService discountService;
	private RecommendService recommendService;
	
	@RequestMapping(path="/api/home/{userId}", method = RequestMethod.GET)
	@ResponseBody
//	public List<Discount> getTopDiscount(){
//		return discountService.getTopDiscount();
//	}
	public List<Discount> getRecommendByUserId(@PathVariable("userId") int userId){
		return discountService.getRecommendDiscount(userId);	
	}
	


	@RequestMapping(path="/home", method=RequestMethod.GET)
	public String showHomePage() {
		return "home";
	}
}
