package com.paypal.dealbridge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.UserInfo;
import com.paypal.dealbridge.storage.mapper.UserInfoMapper;

@Service
public class UserInfoService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	public List<UserInfo> getUserInfo(int userId){
		return userInfoMapper.selectUserBankInfo(userId);
	}
}
