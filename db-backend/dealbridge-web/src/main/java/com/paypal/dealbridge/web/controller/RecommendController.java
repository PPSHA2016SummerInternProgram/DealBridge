package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.RecommendService;
import com.paypal.dealbridge.storage.domain.Discount;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService recommendService;

	@RequestMapping(path = "/api/recommend/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Discount> getDiscountByUserId(@PathVariable("userId") int userId,
			@RequestParam(value = "startIndex", required = false) Integer startIndex,
			@RequestParam(value = "limitNumber", required = false) Integer limitNumber) {
		return recommendService.getDiscountByUserId(userId, startIndex, limitNumber);
	}

}
