package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paypal.dealbridge.service.DiscountService;
import com.paypal.dealbridge.storage.domain.Discount;

@Controller
public class HomeController {
	@Autowired
	private DiscountService discountService;

	@RequestMapping(path="/home", method=RequestMethod.GET)
	public String showHomePage(Model model) {
		List<Discount> hots = discountService.getTopDiscount(3);
		model.addAttribute("hots", hots);
		return "home";
	}
}
