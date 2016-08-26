package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.paypal.dealbridge.storage.domain.UserInfo;

import org.apache.ibatis.annotations.Result;

@Mapper
public interface UserInfoMapper {

	
	@Results(value = {@Result(property = "userId", column = "user_id"),
//			@Result(property = "accountId", column = "account_id"),
//			@Result(property = "bankName", column = "bank_name"),
			@Result(property = "bankOfficial", column = "bank_official"),
			@Result(property = "bankImg", column = "bank_img"),
			@Result(property = "userName", column = "user_name")
	})
	@Select("SELECT user.user_id,user_name,email,bank_official,bank_img from user join account on user.user_id=#{userId} join bank on account.bank_name=bank.bank_name and account.user_id=#{userId}")
	List<UserInfo> selectUserBankInfo(int userId);
}
