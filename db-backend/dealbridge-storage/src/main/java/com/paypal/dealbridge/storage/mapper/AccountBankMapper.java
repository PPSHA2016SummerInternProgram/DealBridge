package com.paypal.dealbridge.storage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.paypal.dealbridge.storage.domain.AccountBank;

import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;

import java.util.List;

@Mapper
public interface AccountBankMapper {
	
	@Results(value = {
//			@Result(property = "userId", column = "user_id"),
//			@Result(property = "accountId", column = "account_id"),
//			@Result(property = "bankName", column = "bank_name"),
			@Result(property = "bankOfficial", column = "bank_official"),
			@Result(property = "bankImg", column = "bank_img")
	})
	@Select("SELECT bank_official,bank_img from account join bank on bank.bank_name=account.bank_name where user_id=#{userId}")
	List<AccountBank> getBankByUserId (int userId);
}
