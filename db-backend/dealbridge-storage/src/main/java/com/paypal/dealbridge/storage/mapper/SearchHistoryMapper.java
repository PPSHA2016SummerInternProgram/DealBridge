package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.transaction.annotation.Transactional;

import com.paypal.dealbridge.storage.domain.SearchHistory;

@Mapper
@Transactional
public interface SearchHistoryMapper {
	@Update("UPDATE search_history SET visible = 0 WHERE user_id = #{userId} AND visible = 1")
	int setInvisible(int userId);
	
	@Insert("INSERT INTO search_history (keyword, search_time, user_id) VALUES (#{keyword}, #{searchTime}, #{userId})")
	@Options(useGeneratedKeys = true, keyProperty = "searchHistoryId", keyColumn = "search_history_id")
	int insert(SearchHistory searchHistory);
	

	@Select("SELECT DISTINCT keyword FROM search_history WHERE user_id = #{userId} AND visible = 1 ORDER BY search_time DESC LIMIT #{limitNumber}")
	List<String> selectUserHistory(@Param("userId") int userId, @Param("limitNumber") int limitNumber);
	
	@Select("SELECT keyword FROM search_history GROUP BY keyword ORDER BY COUNT(*) DESC LIMIT #{limitNumber}")
	List<String> selectHotKeywords(@Param("limitNumber") int limitNumber);
}
