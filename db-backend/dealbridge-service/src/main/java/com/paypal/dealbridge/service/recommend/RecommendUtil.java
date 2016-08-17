package com.paypal.dealbridge.service.recommend;

import java.io.UnsupportedEncodingException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RecommendUtil {

	@Value("${recommender.url}")
	private String recommenderUrl;

	private Logger logger = Logger.getLogger(this.getClass());

	public String getCustomizedDiscounts(int userId, int start, int number) throws RecommendQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = recommenderUrl + "customized/" + userId + "?start=" + start + "&number=" + number;
		logger.info(String.format("Ask for customized discounts from %s", url));
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}

	}

	public String getDiscountByType(int userId, int start, int number, String type)
			throws RecommendQueryException, UnsupportedEncodingException {
		RestTemplate restTemplate = new RestTemplate();
		String url = recommenderUrl + "type/" + userId + "?start=" + start + "&type=" + type + "&number=" + number;
		logger.info("Querying different types of discounts " + url);
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}
	}

	public String getNearbyDiscounts(double latitude, double longitude, int start, int number)
			throws RecommendQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = recommenderUrl + "vicinity?lat=" + latitude + "&lng=" + longitude + "&start=" + start + "&number="
				+ number;
		logger.info(String.format("Ask for nearby discounts from %s", url));
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}
	}

}
