package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.paypal.dealbridge.storage.domain.Discount;
//import com.paypal.dealbridge.storage.domain.Recommend;

@Mapper
public interface RecommendMapper {

	@Results(id = "recommendResult", value = {
			@Result(property = "userId", column = "user_id"),
			@Result(property = "recommendId", column = "recommend_id"),
			@Result(property = "discountId", column = "discount_id")})

	@Select("SELECT discount.* FROM discount JOIN recommend ON discount.discount_id=recommend.discount_id WHERE recommend.user_id=#{userId}")
	List<Discount> selectFromRecommend(int userId);

}
