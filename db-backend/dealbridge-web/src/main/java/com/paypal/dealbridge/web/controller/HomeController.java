package com.paypal.dealbridge.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.paypal.dealbridge.web.util.GPSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paypal.dealbridge.service.DiscountService;
import com.paypal.dealbridge.service.SearchService;
import com.paypal.dealbridge.storage.domain.Discount;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	@Autowired
	private DiscountService discountService;
	@Autowired
	private SearchService searchService;
	
	public static final int TOP_DISCOUNT_NUM = 6;
	
	@RequestMapping(path="/home1", method=RequestMethod.GET)
	public String showDefaultHomePage(
			@RequestParam(value = "lng", required = false) Double longitude,
			@RequestParam(value = "lat", required = false) Double latitude
	) throws UnsupportedEncodingException {
		System.out.println(" " + latitude + " " + longitude);
		String city = GPSUtil.geoDecoder(latitude, longitude);
		System.out.println(city);
		String url = "redirect:/home/" + city +"?lat=" + latitude + "&lng=" + longitude ;
		url = new String(url.getBytes(), "iso-8859-1");
		return url;
	}

	@RequestMapping(path = "/welcome", method = RequestMethod.GET)
	public String welcome() {
		return "index.html";
	}

	@RequestMapping(path="/home/{area}", method=RequestMethod.GET)
	public String showHomePage(
			@PathVariable("area") String area, HttpSession session, Model model,
			@RequestParam(value="lat", required=false) Double latitude,
			@RequestParam(value="lng", required=false) Double longitude
	) {
		int userId = (int)session.getAttribute("userId");
		List<Discount> hots = discountService.getTopDiscount(TOP_DISCOUNT_NUM);
		List<String> hotKeywords = searchService.getHotKeywords(9);
		List<String> searchHistories = searchService.getUserHistory(3, 10);
		model.addAttribute("searchHistories", searchHistories);
		model.addAttribute("hotKeywords", hotKeywords);
		model.addAttribute("hots", hots);
		model.addAttribute("userId", userId);
		model.addAttribute("area", area);
		System.out.println(" " + latitude + " " + longitude);
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);  // default gps lat=31.2099&lng=121.569
		return "home";
	}
	
}
