package com.paypal.dealbridge.web.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.ShareService;
import com.paypal.dealbridge.storage.domain.Share;

@Controller
public class ShareController {
	
	@Autowired
	private ShareService shareService;
	
	@RequestMapping(path="/api/share/shared_times/{discountId}", method=RequestMethod.GET)
	@ResponseBody
	public int getSharedTimes(@PathVariable("discountId") int discountId) {
		return shareService.countSharedTimes(discountId);
	}
	
	@RequestMapping(path="/api/share", method=RequestMethod.POST)
	@ResponseBody
	public int insertShareRecord(@RequestParam("user_id") int userId, @RequestParam("discount_id") int discountId) {
		Share share = new Share();
		share.setShareTime(new Date());
		share.setUserId(userId);
		share.setDiscountId(discountId);
		return shareService.insertRecord(share);
	}
	
}
