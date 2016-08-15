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
	private String keyword1 = "test keyword";
	private String keyword2 = "test keywords";
	private int limitNum = 10;
	
	@Test
	public void testInsert() {
		List<String> histories;
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(0, histories.size());
		
		SearchHistory record = new SearchHistory();
		record.setUserId(userId);
		record.setKeyword(keyword1);
		record.setSearchTime(new Date());
		searchHistoryMapper.insert(record);
		
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(1, histories.size());
		assertEquals(keyword1, histories.get(0));
	}
	
	@Test
	public void testUpdate() {
		List<String> histories;
		SearchHistory record = new SearchHistory();
		record.setUserId(userId);
		record.setKeyword(keyword1);
		record.setSearchTime(new Date());
		searchHistoryMapper.insert(record);
		
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(1, histories.size());
		searchHistoryMapper.setInvisible(userId);
		histories = searchHistoryMapper.selectUserHistory(userId, 10);
		assertEquals(0, histories.size());
	}
	
	@Test
	public void testSelectHot() {
		List<String> hotKeyWords;
		hotKeyWords = searchHistoryMapper.selectHotKeywords(limitNum);
		assertEquals(limitNum, hotKeyWords.size());
	}
	
	@Test
	public void testSelectHistory() {
		List<String> histories;
		SearchHistory record1 = new SearchHistory();
		SearchHistory record2 = new SearchHistory();
		record1.setUserId(userId);
		record1.setKeyword(keyword1);
		record1.setSearchTime(new Date());
		searchHistoryMapper.insert(record1);
		
		record2.setUserId(userId);
		record2.setKeyword(keyword2);
		record2.setSearchTime(new Date());
		searchHistoryMapper.insert(record2);
		
		histories = searchHistoryMapper.selectUserHistory(userId, limitNum);
		assertEquals(2, histories.size());
		
		SearchHistory record3 = new SearchHistory();
		record3.setUserId(userId);
		record3.setKeyword(keyword1);
		record3.setSearchTime(new Date());
		searchHistoryMapper.insert(record3);
		
		histories = searchHistoryMapper.selectUserHistory(userId, limitNum);
		assertEquals(2, histories.size());
		
	}
	

}
