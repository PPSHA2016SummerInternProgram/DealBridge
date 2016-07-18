package com.paypal.dealbridge.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.DiscountService;
import com.paypal.dealbridge.storage.domain.Discount;

@Controller
public class DiscountController {
	
	@Autowired
	private DiscountService discountService;
	
	
	@RequestMapping(path="/api/discount/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Discount getDiscount(@PathVariable("id") int id) {
		return discountService.getDiscountById(id);
	}
	
	@RequestMapping(path="/discount/{id}", method=RequestMethod.GET)
	public String showDiscount(@PathVariable("id") int id, Model model) {
		Discount discount = discountService.getDiscountById(id);
		model.addAttribute("discount", discount);
		return "discount";
	}
}
