package com.paypal.dealbridge.service;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.service.recommend.RecommendQueryException;
import com.paypal.dealbridge.service.recommend.RecommendUtil;
import com.paypal.dealbridge.service.util.ServiceUtil;
import com.paypal.dealbridge.storage.domain.BriefDiscount;
import com.paypal.dealbridge.storage.domain.Discount;
import com.paypal.dealbridge.storage.mapper.RecommendMapper;

@Service
public class RecommendService {
	
	@Autowired
	private RecommendMapper recommendMapper;
	@Autowired
	private RecommendUtil recommendUtil;
	@Autowired
	private ServiceUtil serviceUtil;
	
	public List<Discount> getDiscountByUserId(int userId, Integer startIndex, Integer limitNumber){
		return recommendMapper.getDiscountByUserId(userId, startIndex, limitNumber);
	}
	
	public List<BriefDiscount> getCustomizedDiscounts(int userId, int start, int number, double latitude, double longitude, String area) throws JSONException, RecommendQueryException, ParseException {
		JSONArray jsonArray =  new JSONArray(recommendUtil.getCustomizedDiscounts(userId, start, number, latitude, longitude, area));
		List<BriefDiscount> result = new ArrayList<>();
		for (int i = 0; i < jsonArray.length(); i++) {
			BriefDiscount discount = new BriefDiscount();
			JSONObject item = (JSONObject) jsonArray.get(i);
			discount = serviceUtil.convertJsonToBriefDiscount(item);
			result.add(discount);
		}
		
		return result;
	}

	public List<BriefDiscount> getDiscountByType(int userId, double latitude, double longitude, int start, int number, String type, String area) throws JSONException, RecommendQueryException, ParseException, UnsupportedEncodingException {
		JSONArray jsonArray = new JSONArray(recommendUtil.getDiscountByType(userId, latitude, longitude, start, number, type, area));
		List<BriefDiscount> result = new ArrayList<>();
		for (int i = 0; i < jsonArray.length(); i++) {
			BriefDiscount discount = new BriefDiscount();
			JSONObject item = (JSONObject) jsonArray.get(i);
			discount = serviceUtil.convertJsonToBriefDiscount(item);
			result.add(discount);
		}
		return result;
	}
	
	public List<BriefDiscount> getNearbyDiscounts(double latitude, double longitude, int start, int number) throws JSONException, RecommendQueryException, ParseException {
		JSONArray jsonArray =  new JSONArray(recommendUtil.getNearbyDiscounts(latitude, longitude, start, number));
		List<BriefDiscount> result = new ArrayList<>();
		for (int i = 0; i < jsonArray.length(); i++) {
			BriefDiscount discount = new BriefDiscount();
			JSONObject item = (JSONObject) jsonArray.get(i);
			discount = serviceUtil.convertJsonToBriefDiscount(item);
			result.add(discount);
		}
		return result;
	}
	
	public List<BriefDiscount> getDiscountsByBank(double latitude, double longitude, String area, int start, int number, int userId, String bankName) 
			throws JSONException, RecommendQueryException, ParseException, UnsupportedEncodingException {
		JSONArray jsonArray =  new JSONArray(recommendUtil.getDiscountsByBank(latitude, longitude, area, start, number, userId, bankName));
		List<BriefDiscount> result = new ArrayList<>();
		for (int i = 0; i < jsonArray.length(); i++) {
			BriefDiscount discount = new BriefDiscount();
			JSONObject item = (JSONObject) jsonArray.get(i);
			discount = serviceUtil.convertJsonToBriefDiscount(item);
			result.add(discount);
		}
		System.out.println(result);
		return result;
	}
	
	
	public List<Discount> getHotDiscounts(String area, Integer start, Integer number){
		return recommendMapper.getHotDiscounts(area,start,number);
	}

}
