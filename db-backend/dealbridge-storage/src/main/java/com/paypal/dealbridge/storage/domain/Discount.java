package com.paypal.dealbridge.storage.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Discount {
	private Integer discountId;
	private String bankName;
	private String summary;
	private String description;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
	private Date beginTime;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
	private Date endTime;
	private String area;
	private String discountDetail;
	private String discountUsage;
	private String type;
	private String characteristic;
	private String img;
	private String merchantDescription;
	private String merchantLocation;
	private String merchantTel;
	private String endOfUrl;
	private Integer clickrate;
	private Double latitude;
	private Double longitude;
	

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

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDiscountDetail() {
		return discountDetail;
	}

	public void setDiscountDetail(String discountDetail) {
		this.discountDetail = discountDetail;
	}

	public String getDiscountUsage() {
		return discountUsage;
	}

	public void setDiscountUsage(String discountUsage) {
		this.discountUsage = discountUsage;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCharacteristic() {
		return characteristic;
	}

	public void setCharacteristic(String characteristic) {
		this.characteristic = characteristic;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		if (img.startsWith("http")) {
			this.img = img;
		} else {
			this.img = "/img/discount-img/" + img;
		}
	}

	public String getMerchantDescription() {
		return merchantDescription;
	}

	public void setMerchantDescription(String merchantDescription) {
		this.merchantDescription = merchantDescription;
	}

	public String getMerchantLocation() {
		return merchantLocation;
	}

	public void setMerchantLocation(String merchantLocation) {
		this.merchantLocation = merchantLocation;
	}

	public String getMerchantTel() {
		return merchantTel;
	}

	public void setMerchantTel(String merchantTel) {
		this.merchantTel = merchantTel;
	}

	public String getEndOfUrl() {
		return endOfUrl;
	}

	public void setEndOfUrl(String endOfUrl) {
		this.endOfUrl = endOfUrl;
	}

	public Integer getClickRate() {
		return clickrate;
	}

	public void setClickRate(Integer clickrate) {
		this.clickrate = clickrate;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	
	

}
