package com.paypal.dealbridge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.Bank;
import com.paypal.dealbridge.storage.mapper.BankMapper;

@Service
public class BankListService {
	@Autowired
	private BankMapper bankMapper;
	
	public List<Bank> getBankList(){
		return bankMapper.getBankList();
 	}
}
