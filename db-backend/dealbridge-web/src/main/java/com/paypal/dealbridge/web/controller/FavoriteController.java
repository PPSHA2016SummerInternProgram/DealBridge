package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.FavoriteService;
import com.paypal.dealbridge.storage.domain.Discount;
import com.paypal.dealbridge.storage.domain.BriefDiscount;

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;
	
	@RequestMapping(path="/api/favorite", method=RequestMethod.GET)
	@ResponseBody
	public List<BriefDiscount> getFavoriteDiscount(@RequestParam(value = "userId", required = false) int userId,
			@RequestParam(value = "startIndex", required = false) Integer startIndex,
			@RequestParam(value = "limitNum", required = false) Integer limitNum){
		return favoriteService.getFavoriteByUserId(userId, startIndex, limitNum);
	}
	
	@RequestMapping(path="/api/favorite", method=RequestMethod.POST)
	@ResponseBody
	public void deleteFavorite(@RequestParam(value = "favIds") List<Integer> favoriteIdList){
		favoriteService.deleteFavorite(favoriteIdList);
	}
	
	@RequestMapping(path="/api/favorite/{userId}/count", method=RequestMethod.GET)
	@ResponseBody
	public int getFavoriteCount(@PathVariable("userId") int userId) {
		return favoriteService.numOfFavorite(userId);
	}
	
	@RequestMapping(path = "/api/addFavorite", method = RequestMethod.POST)
	@ResponseBody
	public void addFavorite(@RequestParam("userId") int userId, @RequestParam("discountId") int discountId) {
		favoriteService.addFavorite(userId, discountId);
	}
	
//	@RequestMapping(path="/favorite/{area}/{userId}", method=RequestMethod.GET)
//	public String showFavoritePage(@PathVariable("area") int area, @PathVariable("userId") int userId, Model model) {
//		int count = favoriteService.numOfFavorite(userId);
//		model.addAttribute("count", count);
//		model.addAttribute("userId", userId);
//		model.addAttribute("area", area);
//		return "favorite";
//	}
//	
	@RequestMapping(path="/favorite/{userId}", method=RequestMethod.GET)
	public String showFavoritePage(@PathVariable("userId") int userId, Model model) {
		int count = favoriteService.numOfFavorite(userId);
		model.addAttribute("count", count);
		model.addAttribute("userId", userId);
		return "favorite";
	}
	
}
