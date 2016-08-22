 package com.paypal.dealbridge.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
	@ResponseBody
	public Object showLoginPage(HttpSession session) {
		return session.getAttribute("userId");
	}
	
	@RequestMapping(path="/api/login", method=RequestMethod.POST)
	@ResponseBody
	public void login(@RequestParam("userId") int userId, HttpSession session) {
		session.setAttribute("userId", userId);
	}
	
	@RequestMapping(path="/api/logout", method=RequestMethod.POST)
	@ResponseBody
	public void logout(HttpSession session) {
		session.setAttribute("userId", null);
	}
	
}
