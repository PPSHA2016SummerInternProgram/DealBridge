package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.SearchService;

@Controller
public class SearchController {
	// TODO check userId from session

	@Autowired
	private SearchService searchService;

	@RequestMapping(path = "/api/search_history/{userId}", method = RequestMethod.PUT)
	@ResponseBody
	public void insertHistoryRecord(@PathVariable("userId") int userId, @RequestParam("keyword") String keyword) {
		searchService.insertSearchHistory(userId, keyword);
	}

	@RequestMapping(path = "/api/search_history/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getUserSearchHistory(@PathVariable("userId") int userId,
			@RequestParam("limitNumber") int limitNumber) {
		return searchService.getUserHistory(userId, limitNumber);
	}

	@RequestMapping(path = "/api/search_history/{userId}", method = RequestMethod.POST)
	@ResponseBody
	public void clearSearchHistory(@PathVariable("userId") int userId) {
		searchService.setHistoryInvisible(userId);
	}
	
	@RequestMapping(path = "/search", method = RequestMethod.GET)
	public String showSearchPage(Model model) {
		List<String> hotKeywords = searchService.getHotKeywords(9);
		List<String> searchHistories = searchService.getUserHistory(3, 10);
		model.addAttribute("searchHistories", searchHistories);
		model.addAttribute("hotKeywords", hotKeywords);
		return "search";
	}
}
