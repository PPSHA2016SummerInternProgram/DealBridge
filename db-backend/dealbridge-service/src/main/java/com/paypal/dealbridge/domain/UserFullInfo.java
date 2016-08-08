package com.paypal.dealbridge.domain;

import java.util.List;

import com.paypal.dealbridge.storage.domain.AccountBank;

public class UserFullInfo {
	private Integer userId;
	private String userName;
	private String email;
	
	private List<AccountBank> bankList;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<AccountBank> getBankList() {
		return bankList;
	}

	public void setBankList(List<AccountBank> bankList) {
		this.bankList = bankList;
	}

}
