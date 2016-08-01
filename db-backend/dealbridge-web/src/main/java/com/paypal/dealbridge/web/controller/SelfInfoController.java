package com.paypal.dealbridge.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SelfInfoController {

	@RequestMapping(path = "/userInfo/{userId}", method = RequestMethod.GET)
	public String userInfoPage(@PathVariable("userId")int userId, Model model){
		return "selfInfo";
	}
	
}
