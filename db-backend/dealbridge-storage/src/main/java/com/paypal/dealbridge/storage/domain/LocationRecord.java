package com.paypal.dealbridge.storage.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class LocationRecord {
	private int locationRecordId;
	private String are;
	private int userId;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date locationTime;
	
	public int getLocationRecordId() {
		return locationRecordId;
	}
	public void setLocationRecordId(int locationRecordId) {
		this.locationRecordId = locationRecordId;
	}
	public String getAre() {
		return are;
	}
	public void setAre(String are) {
		this.are = are;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getLocationTime() {
		return (Date)locationTime.clone();
	}
	public void setLocationTime(Date locationTime) {
		this.locationTime = new Date(locationTime.getTime());
	}

	
}
