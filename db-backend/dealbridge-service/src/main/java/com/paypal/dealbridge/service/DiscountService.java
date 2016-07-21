package com.paypal.dealbridge.service;

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
}
