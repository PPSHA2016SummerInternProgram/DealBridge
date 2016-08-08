package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LocationRecordMapper {
	@Select("SELECT DISTINCT area FROM location_record WHERE user_id=#{userId} ORDER BY loction_time DESC")
	List<String> getUserHistroyLocation(@Param("userId") int userId);
	
	@Select("SELECT area FROM location_record GROUP BY area ORDER BY COUNT(*) DESC LIMIT #{limitNumber}")
	List<String> getHotArea(@Param("userId") int userId, @Param("limitNumber") int limitNumber);
}
