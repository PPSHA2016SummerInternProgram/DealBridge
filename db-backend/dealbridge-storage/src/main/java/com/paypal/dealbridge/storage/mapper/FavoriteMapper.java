package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.paypal.dealbridge.storage.domain.BriefDiscount;


@Mapper
public interface FavoriteMapper {
	
	@Results(value = {
			@Result(property = "favoriteId", column = "favorite_id"),
			@Result(property = "userId", column = "user_id"),
			@Result(property = "discountId", column = "discount_id"),
			@Result(property = "bankName", column = "bank_name"),
			@Result(property = "beginTime", column = "begin_time"),
			@Result(property = "endTime", column = "end_time")
	})
	@SelectProvider(type=FavoriteSqlBuilder.class, method = "buildGetFavoriteByUserId")
	List<BriefDiscount> getFavoriteByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex, 
			@Param("limitNum") Integer limitNum);
	
	class FavoriteSqlBuilder {
		public String buildGetFavoriteByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex, 
				@Param("limitNum") Integer limitNum) {
			String query = "SELECT favorite_id,user_id,discount.discount_id,bank_name,summary,description,begin_time,end_time,img FROM discount JOIN favorite ON discount.discount_id=favorite.discount_id WHERE favorite.user_id=#{userId} ORDER BY favorite_id DESC";
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
	
	@Delete("DELETE FROM favorite WHERE favorite_id=#{favoriteId}")
	int deleteFavorite(int favoriteId);
	
	@Insert("INSERT INTO favorite (user_id, discount_id) values (#{userId}, #{discountId})")
	int addFavorite(@Param("userId")int userId, @Param("discountId")int discountId);
}
