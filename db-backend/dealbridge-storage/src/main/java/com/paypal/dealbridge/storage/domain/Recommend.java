package com.paypal.dealbridge.storage.domain;

public class Recommend {
	private Integer recommendId;
	private Integer userId;
	private Integer discountId;

	public Integer getRecommendId() {
		return recommendId;
	}

	public void setRecommendId(Integer recommendId) {
		this.recommendId = recommendId;
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
