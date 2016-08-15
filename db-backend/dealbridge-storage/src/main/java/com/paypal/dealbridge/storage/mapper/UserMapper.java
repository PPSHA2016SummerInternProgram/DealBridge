package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.paypal.dealbridge.storage.domain.User;
import com.paypal.dealbridge.storage.domain.UserInfo;

import org.apache.ibatis.annotations.Result;

@Mapper
public interface UserMapper {

	
	@Results(value = {@Result(property = "userId", column = "user_id"),
			@Result(property = "userName", column = "user_name"),
			@Result(property = "gpsDistrict", column = "bank_name")
	})
	@Select("SELECT * from user where user_id=#{userId}")
	User selectUser(int userId);
}
