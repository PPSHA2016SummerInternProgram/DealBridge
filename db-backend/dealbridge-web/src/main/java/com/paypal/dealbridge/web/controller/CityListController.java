package com.paypal.dealbridge.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.paypal.dealbridge.service.LocationRecordService;

@Controller
public class CityListController {
	@Autowired
	private LocationRecordService lrs;
	
	@RequestMapping(path = "/citylist", method = RequestMethod.GET)
	public 
}
