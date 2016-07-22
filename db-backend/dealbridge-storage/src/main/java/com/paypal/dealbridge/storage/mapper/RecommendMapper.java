package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.jdbc.SQL;

import com.paypal.dealbridge.storage.domain.Recommend;

@Mapper
public interface RecommendMapper {

	
	@Results(value = { 
			@Result(property = "discountId", column = "discount_id"),
			@Result(property = "recommendId", column = "recommend_id"),
			@Result(property = "userId", column = "user_id") })
	@SelectProvider(type = RecommendSqlBuilder.class, method = "buildGetByUserId")
	List<Recommend> getByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex,
			@Param("limitNumber") Integer limitNumber);

	class RecommendSqlBuilder {
		public String buildGetByUserId(@Param("userId") int userId, @Param("startIndex") Integer startIndex,
				@Param("limitNumber") Integer limitNumber) {
			String query = new SQL() {
				{
					SELECT("*");
					FROM("recommend");
					WHERE("user_id = #{userId}");
					ORDER_BY("recommend_id");
				}
			}.toString();

			if (startIndex == null && limitNumber != null) {
				query += " LIMIT " + limitNumber;
			} else if (startIndex != null && limitNumber != null) {
				query += String.format(" LIMIT %d,%d", startIndex, limitNumber);
			}

			return query;
		}
	}


}
