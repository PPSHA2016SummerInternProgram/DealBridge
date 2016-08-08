package com.paypal.dealbridge.service.recommend;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RecommendUtil {
	private static final String RECOMMEND_URL = "http://10.225.225.14:5000/";
	
	
	public String getCustomizedDiscounts(int userId, int start, int number) throws RecommendQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = RECOMMEND_URL + "customized/" + userId + "?start=" + start + "&number=" + number;
		System.out.println(url);
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}
		
	}
	
	public String getNearbyDiscounts(double latitude, double longitude, int start, int number) throws RecommendQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = RECOMMEND_URL + "vicinity?lat=" + latitude + "&lng=" + longitude + "&start=" + start + "&number=" + number;
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}
	}
	
	
}
