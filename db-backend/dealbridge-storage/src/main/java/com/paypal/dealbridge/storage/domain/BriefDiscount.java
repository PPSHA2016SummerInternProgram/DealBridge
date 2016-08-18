package com.paypal.dealbridge.storage.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BriefDiscount {
	private Integer favoriteId;

	private Integer userId;

	private Integer discountId;

	private String bankName;

	private String summary;

	private String description;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")

	private Date beginTime;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")

	private Date endTime;

	private String img;

	private Double distance;

	private Integer clickRate;

	public Integer getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getDiscountId() {
		return discountId;
	}

	public void setDiscountId(Integer discountId) {
		this.discountId = discountId;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getBeginTime() {
		if (beginTime == null)
			return null;
		else
			return (Date)beginTime.clone();
	}

	public void setBeginTime(Date beginTime) {
		if (beginTime == null)
			this.beginTime = null;
		else
			this.beginTime = (Date)beginTime.clone();
	}

	public Date getEndTime() {
		if (endTime == null)
			return null;
		else
			return (Date)endTime.clone();
	}

	public void setEndTime(Date endTime) {
		if (endTime == null)
			this.endTime = null;
		else
			this.endTime = (Date)endTime.clone();
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}

	public Integer getClickRate() { return clickRate;}

	public void setClickRate(Integer clickRate) { this.clickRate = clickRate;}
}
