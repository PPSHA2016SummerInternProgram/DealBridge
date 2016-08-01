package com.paypal.dealbridge.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.service.solr.SolrQueryException;
import com.paypal.dealbridge.service.solr.SolrUtil;
import com.paypal.dealbridge.storage.domain.BriefDiscount;
import com.paypal.dealbridge.storage.domain.SearchHistory;
import com.paypal.dealbridge.storage.mapper.SearchHistoryMapper;

@Service
public class SearchService {
	@Autowired
	private SearchHistoryMapper searchHistoryMapper;
	@Autowired
	private SolrUtil solrUtil;
	
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
	
	public List<BriefDiscount> convertToBriefDiscounts(JSONArray docs) throws JSONException, ParseException {
		List<BriefDiscount> discounts = new ArrayList<BriefDiscount>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < docs.length(); i++) {
			BriefDiscount discount = new BriefDiscount();
			JSONObject doc = docs.getJSONObject(i);
			discount.setBankName(doc.getString("bank_name"));
			discount.setSummary(doc.getString("discount_summary"));
			discount.setDiscountId(doc.getInt("id"));
			discount.setDescription((String)doc.getJSONArray("discount_description").get(0));
			if (!doc.isNull("discount_begin_time")) {
				discount.setBeginTime(dateFormat.parse(doc.getString("discount_begin_time")));
			}
			if (!doc.isNull("discount_end_time")) {
				discount.setEndTime(dateFormat.parse(doc.getString("discount_end_time")));
			}
			discount.setImg(doc.getString("discount_img"));
			
			discounts.add(discount);
		}
		
		return discounts;
	}
	
	public List<BriefDiscount> searchDiscount(String query) throws SolrQueryException, JSONException, ParseException {
		JSONObject resultData = new JSONObject(solrUtil.searchDiscount(query));
		JSONArray docs = resultData.getJSONObject("response").getJSONArray("docs");
		return convertToBriefDiscounts(docs);
	}
	
	public List<BriefDiscount> searchDiscount(String query, int start, int rows) throws SolrQueryException, JSONException, ParseException {
		JSONObject resultData = new JSONObject(solrUtil.searchDiscount(query, start, rows));
		JSONArray docs = resultData.getJSONObject("response").getJSONArray("docs");
		return convertToBriefDiscounts(docs);
	}
}
