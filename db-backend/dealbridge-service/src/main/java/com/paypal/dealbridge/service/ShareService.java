package com.paypal.dealbridge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.paypal.dealbridge.storage.domain.Share;
import com.paypal.dealbridge.storage.mapper.ShareMapper;

@Service
@Transactional
public class ShareService {
	
	@Autowired
	private ShareMapper shareMapper;
	
	public int countSharedTimes(int discountId) {
		return shareMapper.getSharedTimes(discountId);
	}
	
	public int insertRecord(Share share) {
		return shareMapper.insert(share);
	}
	
}
