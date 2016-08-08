package com.paypal.dealbridge.service;

import org.springframework.stereotype.Service;

import com.paypal.dealbridge.storage.mapper.LocationRecordMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


@Service
public class LocationRecordService {
	@Autowired
	private LocationRecordMapper locationRecordMapper;
	
	public List<String> getUserLocaionRecords(int userId){
		return locationRecordMapper.getUserHistroyLocation(userId);
	}
	
	public List<String> getHotLocation(int limitNumber){
		return locationRecordMapper.getHotArea(limitNumber);
	}
}
