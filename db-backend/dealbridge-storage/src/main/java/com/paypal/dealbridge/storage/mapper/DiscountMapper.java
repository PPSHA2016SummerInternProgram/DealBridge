package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.paypal.dealbridge.storage.domain.Discount;

@Mapper
public interface DiscountMapper {

	@Results(value = { 
			@Result(property = "discountId", column = "discount_id"),
			@Result(property = "beginTime", column = "begin_time"),
			@Result(property = "endTime", column = "end_time"), 
			@Result(property = "discountUsage", column = "discount_usage"),
			@Result(property = "discountDetail", column = "discount_detail"),
			@Result(property = "merchantDescription", column = "merchant_description"),
			@Result(property = "merchantLocation", column = "merchant_location"),
			@Result(property = "merchantTel", column = "merchant_tel"),
			@Result(property = "endOfUrl", column = "end_of_url"),
			@Result(property = "bankName", column = "bank_name") })
	@Select("SELECT * FROM discount WHERE discount_id=#{id}")
	Discount selectByPrimaryKey(Integer id);
	
	@Results(value = { 
			@Result(property = "discountId", column = "discount_id"),
			@Result(property = "beginTime", column = "begin_time"),
			@Result(property = "endTime", column = "end_time"), 
			@Result(property = "discountUsage", column = "discount_usage"),
			@Result(property = "discountDetail", column = "discount_detail"),
			@Result(property = "merchantDescription", column = "merchant_description"),
			@Result(property = "merchantLocation", column = "merchant_location"),
			@Result(property = "merchantTel", column = "merchant_tel"),
			@Result(property = "endOfUrl", column = "end_of_url"),
			@Result(property = "bankName", column = "bank_name") })
	@Select("SELECT * FROM discount ORDER BY clickrate DESC LIMIT 3")
	List<Discount> selectByClickrate();
	
	@Results(value = { 
			@Result(property = "discountId", column = "discount_id"),
			@Result(property = "beginTime", column = "begin_time"),
			@Result(property = "endTime", column = "end_time"), 
			@Result(property = "discountUsage", column = "discount_usage"),
			@Result(property = "discountDetail", column = "discount_detail"),
			@Result(property = "merchantDescription", column = "merchant_description"),
			@Result(property = "merchantLocation", column = "merchant_location"),
			@Result(property = "merchantTel", column = "merchant_tel"),
			@Result(property = "endOfUrl", column = "end_of_url"),
			@Result(property = "bankName", column = "bank_name") })
	@Select("SELECT discount.* FROM discount JOIN recommend ON discount.discount_id=recommend.discount_id WHERE recommend.user_id=#{userId}")
	List<Discount> selectFromRecommend(int userId);

	
	@Update("UPDATE discount SET clickrate=clickrate+1 WHERE discount_id = #{discountId}")
	int clickRateRaise(int discountId);
}
