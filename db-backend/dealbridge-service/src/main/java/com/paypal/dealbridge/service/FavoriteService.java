package com.paypal.dealbridge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.BriefDiscount;
import com.paypal.dealbridge.storage.mapper.FavoriteMapper;


@Service
public class FavoriteService {

	@Autowired
	private FavoriteMapper favoriteMapper;
	
	public List<BriefDiscount> getFavoriteByUserId(int userId, Integer startIndex, Integer limitNum){
		return favoriteMapper.getFavoriteByUserId(userId, startIndex, limitNum);
	}
	
	public int numOfFavorite(int userId){
		return favoriteMapper.numOfFavorite(userId);
	}
	
	public int deleteFavorite(List<Integer> favoriteIdList){
		int i = 0;
		for(Integer id:favoriteIdList){
			i = favoriteMapper.deleteFavorite(id);
		}
		return i;
		
	}
	
	public int deleteFavoriteById(int userId, int discountId){
		int i = 0;
			i = favoriteMapper.deleteFavoriteById(userId, discountId);
		return i;
		
	}
	
	public int addFavorite(int userId, int discountId){
		int i = 0;
		i = favoriteMapper.addFavorite(userId, discountId);
		return i;
	}
	
	//exist or not
	public Integer existFavorite(int userId, int discountId){
		return favoriteMapper.existFavorite(userId, discountId);
	}
}
