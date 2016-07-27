package com.paypal.dealbridge.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.SearchService;
import com.paypal.dealbridge.storage.domain.SearchHistory;

@Controller
public class SearchController {
	// TODO check userId from session
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping(path="/api/search_history/{userId}", method=RequestMethod.PUT)
	@ResponseBody
	public void insertHistoryRecord(@PathVariable("userId") int userId, @RequestParam("keyword") String keyword) {
		searchService.insertSearchHistory(userId, keyword);
	}
	
	@RequestMapping(path="/api/search_history/{userId}", method=RequestMethod.GET)
	@ResponseBody
	public List<SearchHistory> getUserSearchHistory(@PathVariable("userId") int userId) {
		return searchService.getUserHistory(userId);
	}
	
	@RequestMapping(path="/api/search_history/{userId}", method=RequestMethod.POST)
	@ResponseBody
	public void clearSearchHistory(@PathVariable("userId") int userId, @RequestParam("search_history_ids") int[] searchHistoryIds) {
		searchService.setHistoriesInvisible(userId, searchHistoryIds);
	}
}
