package com.paypal.dealbridge.storage.domain;

import java.util.Date;

public class User {
	private Integer userId;
	private String userName;
	private String gpsDistrict;
	private Integer gender;
	private Date birthday;
	private String email;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGpsDistrict() {
		return gpsDistrict;
	}
	public void setGpsDistrict(String gpsDistrict) {
		this.gpsDistrict = gpsDistrict;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		if (birthday == null)
			return null;
		else
			return (Date)birthday.clone();
	}
	public void setBirthday(Date birthday) {
		if (birthday == null)
			this.birthday = null;
		else
			this.birthday = (Date)birthday.clone();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
