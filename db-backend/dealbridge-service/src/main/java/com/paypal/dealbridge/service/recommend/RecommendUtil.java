package com.paypal.dealbridge.service.recommend;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RecommendUtil {
	private static final String RECOMMEND_URL = "http://10.225.224.17:5000/";
	private Logger logger = Logger.getLogger(this.getClass());
	
	public String getCustomizedDiscounts(int userId, int start, int number) throws RecommendQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = RECOMMEND_URL + "customized/" + userId + "?start=" + start + "&number=" + number;
		logger.info(String.format("Ask for customized discounts from %s", url));
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
		logger.info(String.format("Ask for nearby discounts from %s", url));
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}
	}
	
	
}
