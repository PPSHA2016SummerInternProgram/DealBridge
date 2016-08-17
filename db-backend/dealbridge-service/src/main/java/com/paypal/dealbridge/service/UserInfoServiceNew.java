package com.paypal.dealbridge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.domain.UserFullInfo;
import com.paypal.dealbridge.storage.domain.AccountBank;
import com.paypal.dealbridge.storage.domain.User;
import com.paypal.dealbridge.storage.mapper.AccountBankMapper;
import com.paypal.dealbridge.storage.mapper.UserMapper;


@Service
public class UserInfoServiceNew {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private AccountBankMapper accountBankMapper;
	@Autowired
	private BankListService bls;
	
	public UserFullInfo getUserInfo(int userId){
		User user = userMapper.selectUser(userId);
		List<AccountBank> ab = accountBankMapper.getBankByUserId(userId);
		
		
		UserFullInfo ufi = new UserFullInfo();
		ufi.setUserId(user.getUserId());
		ufi.setUserName(user.getUserName());
		ufi.setEmail(user.getEmail());
		ufi.setBankList(ab);
		
		return ufi;
	}
	
	public int addBankCard(int userId, String bankOfficial){
		String bankName = bls.getBankName(bankOfficial);
		int i = accountBankMapper.addUserBank(userId, bankName);
		System.out.println(i);
		return i;
	}

}
