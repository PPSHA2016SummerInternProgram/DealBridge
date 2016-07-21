package com.paypal.dealbridge.storage.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.paypal.dealbridge.storage.domain.Share;

@Mapper
public interface ShareMapper {
	
	@Select("SELECT COUNT(share_id) FROM share WHERE discount_id = #{discountId}")
	int getSharedTimes(int discountId);
	
	@Insert("INSERT INTO share (share_time, user_id, discount_id) VALUES (#{shareTime}, #{userId}, #{discountId})")
	@Options(useGeneratedKeys = true, keyProperty = "shareId", keyColumn = "share_id")
	int insert(Share share);
}
