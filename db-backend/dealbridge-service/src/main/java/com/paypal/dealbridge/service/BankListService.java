package com.paypal.dealbridge.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.Bank;
import com.paypal.dealbridge.storage.mapper.BankMapper;

@Service
public class BankListService {
	@Autowired
	private BankMapper bankMapper;
	
	public HashMap<String,String> bankNO = new HashMap<String,String>();
	
	public List<Bank> bankList; 
	
	public void bankListCache(){
		bankList = bankMapper.getBankList();
		for(Bank i : bankList){
			bankNO.put(i.getBankOfficial(), i.getBankName());
//			bankNI.put(i.getBankName(), i.getBankImg());
		}
	}
	
	public List<Bank> getBankList(){
		if(bankNO.isEmpty()){
			bankListCache();
		}
		return bankList;
 	}
	
	public String getBankName(String bankOfficial){
		return bankNO.get(bankOfficial);
	}
}
