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

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;

//	@RequestMapping(path="/api/favorite/{userId}", method=RequestMethod.GET)
//	@ResponseBody
//	public List<Discount> getFavoriteDiscount(@PathVariable("userId") int userId,
//			@RequestParam(value = "startIndex", required = false) Integer startIndex,
//			@RequestParam(value = "limitNum", required = false) Integer limitNum){
//		System.out.print(userId);
//		return favoriteService.getFavoriteByUserId(userId, startIndex, limitNum);
//	}
	
	@RequestMapping(path="/api/favorite", method=RequestMethod.GET)
	@ResponseBody
	public List<Discount> getFavoriteDiscount(@RequestParam(value = "userId", required = false) int userId,
			@RequestParam(value = "startIndex", required = false) Integer startIndex,
			@RequestParam(value = "limitNum", required = false) Integer limitNum){
		return favoriteService.getFavoriteByUserId(userId, startIndex, limitNum);
	}
	
	@RequestMapping(path="/favorite/{userId}", method=RequestMethod.GET)
	public String showFavoritePage(@PathVariable("userId") int userId, Model model) {
		int count = favoriteService.numOfFavorite(userId);
		List<Discount> favorites = favoriteService.getFavoriteByUserId(userId, 0, 10);
		model.addAttribute("count", count);
		model.addAttribute("favorites", favorites);
		return "favorite2";
	}
	
	@RequestMapping(path="/favorite2/{userId}", method=RequestMethod.GET)
	public String showFavoritePage2(@PathVariable("userId") int userId, Model model) {
		int count = favoriteService.numOfFavorite(userId);
		model.addAttribute("count", count);
		return "favorite3";
	}
}
