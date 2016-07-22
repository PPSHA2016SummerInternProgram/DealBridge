package com.paypal.dealbridge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.Recommend;
import com.paypal.dealbridge.storage.mapper.RecommendMapper;

@Service
public class RecommendService {
	
	@Autowired
	private RecommendMapper recommendMapper;
	
	public List<Recommend> getRecommendByUserId(int userId, Integer startIndex, Integer limitNumber) {
		return recommendMapper.getByUserId(userId, startIndex, limitNumber);
	}
	

}
