package com.paypal.dealbridge.storage.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SearchHistory {
	private int searchHistoryId;
	private String keyword;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date searchTime;
	private int userId;
	private int visible;

	public int getSearchHistoryId() {
		return searchHistoryId;
	}

	public void setSearchHistoryId(int searchHistoryId) {
		this.searchHistoryId = searchHistoryId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Date getSearchTime() {
		return searchTime;
	}

	public void setSearchTime(Date searchTime) {
		this.searchTime = searchTime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

}
