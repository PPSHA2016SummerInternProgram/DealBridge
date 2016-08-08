package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.dealbridge.service.DiscountService;
import com.paypal.dealbridge.storage.domain.Discount;

@Controller
public class HomeController {
	@Autowired
	private DiscountService discountService;
	
	public static final int TOP_DISCOUNT_NUM = 6;
	
	@RequestMapping(path="/home/{area}/{userId}", method=RequestMethod.GET)
	public String showHomePage(@PathVariable("area") String area, @PathVariable("userId")int userId, Model model) {
		List<Discount> hots = discountService.getTopDiscount(TOP_DISCOUNT_NUM);
		model.addAttribute("hots", hots);
		model.addAttribute("userId", userId);
		model.addAttribute("area", area);
		return "home";
	}
	
}
