package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import com.paypal.dealbridge.storage.domain.Discount;

@Mapper
public interface RecommendMapper {

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
	@SelectProvider(type = RecommendSqlBuilder.class, method = "buildGetDiscountByUserId")
	List<Discount> getDiscountByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex,
			@Param("limitNumber") Integer limitNumber);

	
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
	@SelectProvider(type = RecommendSqlBuilder.class, method = "buildGetHotDiscounts")
	List<Discount> getHotDiscounts(@Param("area")String area, @Param("start")Integer start,@Param("number") Integer number);

	class RecommendSqlBuilder {	
		public String buildGetDiscountByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex,
				@Param("limitNumber") Integer limitNumber) {
			String query = "SELECT discount.* FROM discount JOIN recommend ON discount.discount_id=recommend.discount_id WHERE recommend.user_id="+ userId;
			if (startIndex == null && limitNumber != null) {
				query += " LIMIT " + limitNumber;
			} else if (startIndex != null && limitNumber != null) {
				query += String.format(" LIMIT %d,%d", startIndex, limitNumber);
			}
			return query;
		}
		
		public String buildGetHotDiscounts(@Param("area")String area, @Param("start")Integer start,@Param("number") Integer number){
			String query = "SELECT discount.* FROM discount  WHERE discount.area like '%"+ area +"%' ORDER BY clickrate DESC" ;
			if (start == null && number != null) {
				query += " LIMIT " + number;
			} else if (start != null && number != null) {
				query += String.format(" LIMIT %d,%d", start, number);
			}
			return query;
		}
	}


}
