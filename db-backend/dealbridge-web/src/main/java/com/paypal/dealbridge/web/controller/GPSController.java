package com.paypal.dealbridge.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GPSController {

	@RequestMapping(path = "/api/gps", method = RequestMethod.POST)
	@ResponseBody
	public void setGPS(@RequestParam("latitude") double latitude, @RequestParam("longitude") double longitude,
			HttpSession session) {
		session.setAttribute("latitude", latitude);
		session.setAttribute("longitude", longitude);
	}

}
