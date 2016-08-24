package com.paypal.dealbridge.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.LocationRecordService;

@Controller
public class CityListController {
	@Autowired
	private LocationRecordService lrs;
	
	public static final int HOT_CITY_NUM = 3;
	
	@RequestMapping(path = "/api/citylist", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getHotCity(){
		return lrs.getHotLocation(HOT_CITY_NUM);
	}
	
	@RequestMapping(path = "/api/city", method = RequestMethod.POST)
	@ResponseBody
	public void chooseCity(@RequestParam("area") String area, HttpSession session) {
		session.setAttribute("area", area);
	}
	
	@RequestMapping(path = "/citylist", method = RequestMethod.GET)
	public String showCityList(Model model, HttpSession session){
		List<String> hotCity = lrs.getHotLocation(HOT_CITY_NUM);
		String city = (String) session.getAttribute("area");
		String locatedCity = (String) session.getAttribute("locatedCity");
		if(locatedCity == null) {
			locatedCity = city;
			session.setAttribute("locatedCity", locatedCity);
		}
		model.addAttribute("city", locatedCity);
		model.addAttribute("hotcity", hotCity);
		return "citylist";
	}
}
