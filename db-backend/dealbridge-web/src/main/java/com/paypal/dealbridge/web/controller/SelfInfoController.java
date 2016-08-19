package com.paypal.dealbridge.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.domain.UserFullInfo;
import com.paypal.dealbridge.service.BankListService;
import com.paypal.dealbridge.service.UserInfoServiceNew;
import com.paypal.dealbridge.storage.domain.Bank;

@Controller
public class SelfInfoController {
	
	@Autowired
	private UserInfoServiceNew userInfoService;
	@Autowired
	private BankListService bankService;
	
	@RequestMapping(path = "/api/userInfo/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public UserFullInfo getInfo(@PathVariable("userId")int userId){
		return userInfoService.getUserInfo(userId);
	}
	
	@RequestMapping(path = "/api/userbankcard/{userId}", method = RequestMethod.PUT)
	@ResponseBody
	public void addBankCard(@PathVariable("userId")int userId,
			@RequestParam("bankName") String addBankName){
		userInfoService.addBankCard(userId, addBankName);	
	}
	
	@RequestMapping(path = "/userInfo", method = RequestMethod.GET)
	public String userInfoPage(HttpSession session, Model model) throws Exception{
		int userId = (int)session.getAttribute("userId");
		UserFullInfo ufi = userInfoService.getUserInfo(userId);
		List<Bank> bankList = bankService.getBankList();
		
		model.addAttribute("ufi", ufi);
		model.addAttribute("userId", userId);
		model.addAttribute("bankList", bankList);
		
		return "selfInfo";
	}
}
