package com.paypal.dealbridge.storage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.paypal.dealbridge.storage.domain.Discount;

@Mapper
public interface DiscountMapper {

	@Results(id = "discountResult", value = { 
			@Result(property = "beginTime", column = "begin_time"),
			@Result(property = "endTime", column = "end_time"), 
			@Result(property = "discountUsage", column = "discount_usage"),
			@Result(property = "discountDetail", column = "discount_detail"),
			@Result(property = "merchantDescription", column = "merchant_description"),
			@Result(property = "merchantLocation", column = "merchant_location"),
			@Result(property = "merchantTel", column = "merchant_tel"),
			@Result(property = "bankName", column = "bank_name") })
	@Select("SELECT * FROM discount WHERE id=#{id}")
	Discount selectByPrimaryKey(Integer id);
}
