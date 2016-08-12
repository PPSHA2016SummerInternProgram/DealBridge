package com.paypal.dealbridge.storage.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.paypal.dealbridge.storage.domain.SearchHistory;
import com.paypal.dealbridge.storage.mapper.SearchHistoryMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(TestStartApp.class)
@Transactional
public class SearchHistoryTest {
	@Autowired
	private SearchHistoryMapper searchHistoryMapper;
	
	private int userId = 1024;
	private String keyword = "test keyword";
	
	@Test
	public void testInsert() {
		List<String> histories;
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(0, histories.size());
		
		SearchHistory record = new SearchHistory();
		record.setUserId(userId);
		record.setKeyword(keyword);
		record.setSearchTime(new Date());
		searchHistoryMapper.insert(record);
		
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(1, histories.size());
		assertEquals(keyword, histories.get(0));
	}
	
	@Test
	public void testUpdate() {
		List<String> histories;
		SearchHistory record = new SearchHistory();
		record.setUserId(userId);
		record.setKeyword(keyword);
		record.setSearchTime(new Date());
		searchHistoryMapper.insert(record);
		
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(1, histories.size());
		searchHistoryMapper.setInvisible(userId);
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(0, histories.size());
	}
	
	
	

}
