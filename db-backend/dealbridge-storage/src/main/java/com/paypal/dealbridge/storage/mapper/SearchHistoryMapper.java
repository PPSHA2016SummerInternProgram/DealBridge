package com.paypal.dealbridge.storage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.transaction.annotation.Transactional;

import com.paypal.dealbridge.storage.domain.SearchHistory;

@Mapper
@Transactional
public interface SearchHistoryMapper {
	@Update("UPDATE search_history SET visible = 0 WHERE search_history_id = #{id}")
	int setInvisibleById(int id);
	
	@Insert("INSERT INTO search_history (keyword, search_time, user_id) VALUES (#{keyword}, #{searchTime}, #{userId})")
	@Options(useGeneratedKeys = true, keyProperty = "searchHistoryId", keyColumn = "search_history_id")
	int insert(SearchHistory searchHistory);
	
	@Results(value = { @Result(property = "searchHistoryId", column = "search_history_id"),
			@Result(property = "searchTime", column = "search_time"), 
			@Result(property = "userId", column = "user_id") })
	@Select("SELECT * FROM search_history WHERE user_id = #{userId} AND visible = 1")
	List<SearchHistory> selectUserHistory(int userId);
}
