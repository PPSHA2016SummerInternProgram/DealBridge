package com.paypal.dealbridge.storage.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
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
	@Select("SELECT bank_official,bank_img FROM account JOIN bank ON bank.bank_name=account.bank_name WHERE user_id=#{userId}")
	List<AccountBank> getBankByUserId (int userId);
	
	@Insert("INSERT INTO account (user_id, bank_name) VALUES (#{userId}, #{bankName})")
	int addUserBank (@Param("userId") int userId, @Param("bankName")String addBankName);
	
}
