package com.paypal.dealbridge.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.SearchHistory;
import com.paypal.dealbridge.storage.mapper.SearchHistoryMapper;

@Service
public class SearchService {
	@Autowired
	private SearchHistoryMapper searchHistoryMapper;
	
	public List<String> getUserHistory(int userId, int limitNumber) {
		return searchHistoryMapper.selectUserHistory(userId, limitNumber);
	}
	
	public int setHistoryInvisible(int userId) {
		return searchHistoryMapper.setInvisible(userId);
	}
	
	public int insertSearchHistory(int userId, String keyword) {
		SearchHistory searchHistory = new SearchHistory();
		searchHistory.setKeyword(keyword);
		searchHistory.setUserId(userId);
		searchHistory.setSearchTime(new Date());
		return searchHistoryMapper.insert(searchHistory);
	}
	
	public List<String> getHotKeywords(int number) {
		return searchHistoryMapper.selectHotKeywords(number);
	}
}
