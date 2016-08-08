package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;

import com.paypal.dealbridge.storage.domain.Bank;

@Mapper
public interface BankMapper {
	@Results (value = {
			@Result (property = "bankName", column = "bank_name"),
			@Result (property = "bankOfficial", column = "bank_official"),
			@Result (property = "bankImg", column = "bank_img")
	})
	@Select("SELECT * FROM bank")
	List<Bank> getBankList();
}
