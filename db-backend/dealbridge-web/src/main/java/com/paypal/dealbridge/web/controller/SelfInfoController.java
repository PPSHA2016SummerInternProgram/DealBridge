package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.domain.UserFullInfo;
import com.paypal.dealbridge.service.UserInfoService;
import com.paypal.dealbridge.service.UserInfoServiceNew;
import com.paypal.dealbridge.storage.domain.UserInfo;

@Controller
public class SelfInfoController {
	
	@Autowired
	private UserInfoServiceNew userInfoService;
	
	@RequestMapping(path = "/api/userInfo/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public UserFullInfo getInfo(@PathVariable("userId")int userId){
		return userInfoService.getUserInfo(userId);
	}

	@RequestMapping(path = "/userInfo/{userId}", method = RequestMethod.GET)
	public String userInfoPage(@PathVariable("userId")int userId, Model model){
		UserFullInfo ufi = userInfoService.getUserInfo(userId);
		model.addAttribute("ufi", ufi);
		model.addAttribute("userId", userId);
		return "selfInfo";
	}
}
