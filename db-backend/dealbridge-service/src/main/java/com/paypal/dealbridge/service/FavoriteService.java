package com.paypal.dealbridge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.domain.Discount;
import com.paypal.dealbridge.storage.domain.BriefDiscount;
import com.paypal.dealbridge.storage.mapper.FavoriteMapper;
import com.paypal.dealbridge.storage.mapper.FavoriteMapperNew;


@Service
public class FavoriteService {
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	@Autowired
	private FavoriteMapperNew favoriteMapperNew;
	
//	public List<Discount> getFavoriteByUserId(int userId, Integer startIndex, Integer limitNum){
//		return favoriteMapper.getFavoriteByUserId(userId, startIndex, limitNum);
//	}
	public List<BriefDiscount> getFavoriteByUserId(int userId, Integer startIndex, Integer limitNum){
		return favoriteMapperNew.getFavoriteByUserId(userId, startIndex, limitNum);
	}
	
	public int numOfFavorite(int userId){
		return favoriteMapper.numOfFavorite(userId);
	}
	
	public int deleteFavorite(List<Integer> favoriteIdList){
		int i = 0;
		for(Integer id:favoriteIdList){
			i = favoriteMapperNew.deleteFavorite(id);
		}
		return i;
		
	}
}
