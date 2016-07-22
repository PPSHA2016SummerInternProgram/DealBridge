package com.paypal.dealbridge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.Discount;
import com.paypal.dealbridge.storage.mapper.DiscountMapper;

@Service
public class DiscountService {
	@Autowired
	private DiscountMapper discountMapper;
	
	public Discount getDiscountById(int id) {
		return discountMapper.selectByPrimaryKey(id);
	}
	
	public List<Discount> getTopDiscount(){
		return discountMapper.selectByClickrate();
	}
	
	public int updateClickRate(int id){
		return discountMapper.clickRateRaise(id);
	}
	
	public List<Discount> getRecommendDiscount(int userId){
		return discountMapper.selectFromRecommend(userId);
	}
}
