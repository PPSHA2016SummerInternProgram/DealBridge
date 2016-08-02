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
	
	public List<SearchHistory> getUserHistory(int userId) {
		return searchHistoryMapper.selectUserHistory(userId);
	}
	
	public int setHistoryInvisible(int userId, int searchHistoryId) {
		// TODO check whether this searchHistory belongs to this user
		return searchHistoryMapper.setInvisibleById(searchHistoryId);
	}
	
	public void setHistoriesInvisible(int userId, int[] ids) {
		for (int id : ids) {
			setHistoryInvisible(userId, id);
		}
	}
	
	public int insertSearchHistory(int userId, String keyword) {
		SearchHistory searchHistory = new SearchHistory();
		searchHistory.setKeyword(keyword);
		searchHistory.setUserId(userId);
		searchHistory.setSearchTime(new Date());
		return searchHistoryMapper.insert(searchHistory);
	}
}
