package com.paypal.dealbridge.storage.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Share {
	private Integer shareId;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date shareTime;
	private Integer userId;
	private Integer discountId;

	public Integer getShareId() {
		return shareId;
	}

	public void setShareId(Integer shareId) {
		this.shareId = shareId;
	}

	public Date getShareTime() {
		return (Date)shareTime.clone();
	}

	public void setShareTime(Date shareTime) {
		this.shareTime = shareTime;
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

}
