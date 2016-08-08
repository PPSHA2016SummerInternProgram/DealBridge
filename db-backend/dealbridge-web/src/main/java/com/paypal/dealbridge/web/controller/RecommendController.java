package com.paypal.dealbridge.web.controller;

import java.text.ParseException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.RecommendService;
import com.paypal.dealbridge.service.recommend.RecommendQueryException;
import com.paypal.dealbridge.storage.domain.BriefDiscount;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService recommendService;

	@RequestMapping(path = "/api/recommend/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public List<BriefDiscount> getCustomizedDiscounts(@PathVariable("userId") int userId,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "number", required = false) Integer number)
			throws JSONException, RecommendQueryException, ParseException {

		return recommendService.getCustomizedDiscounts(userId, start, number);
	}
	
	@RequestMapping(path = "/api/nearby", method = RequestMethod.GET)
	@ResponseBody
	public List<BriefDiscount> getNearbyDiscounts(
			@RequestParam(value = "latitude") double latitude,
			@RequestParam(value = "longitude") double longitude,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "number", required = false) Integer number) throws JSONException, RecommendQueryException, ParseException{
		return recommendService.getNearbyDiscounts(latitude, longitude, start, number);
	}

	@RequestMapping(path = "/recommend/{userId}/{type}", method = RequestMethod.GET)
	public String showRecommend(@PathVariable("userId") String userId, @PathVariable("type") String type, Model model) {
		model.addAttribute("userId", userId);
		return "recommend";
	}

}
