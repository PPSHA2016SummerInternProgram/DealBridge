package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.paypal.dealbridge.storage.domain.Discount;


@Mapper
public interface FavoriteMapper {
	
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
			@Result(property = "bankName", column = "bank_name")
	})
	@SelectProvider(type=FavoriteSqlBuilder.class, method = "buildGetFavoriteByUserId")
	List<Discount> getFavoriteByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex, 
			@Param("limitNum") Integer limitNum);
	
	class FavoriteSqlBuilder {
		public String buildGetFavoriteByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex, 
				@Param("limitNum") Integer limitNum) {
			String query = "SELECT discount.* FROM discount JOIN favorite ON discount.discount_id=favorite.discount_id WHERE favorite.user_id=#{userId}";
			if (startIndex == null && limitNum != null) {
				query += " LIMIT " +limitNum;
			} else if (startIndex != null && limitNum != null) {
				query += String.format(" LIMIT %d,%d", startIndex, limitNum);
			}
			return query;
		}
	}
	
	@Select("SELECT count(*) FROM favorite WHERE user_id=#{userId}")
	int numOfFavorite(int userId);
}
