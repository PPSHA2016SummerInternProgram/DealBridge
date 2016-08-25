package com.paypal.dealbridge.service.recommend;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

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

	public String getCustomizedDiscounts(int userId, int start, int number, double latitude, double longitude, String area) throws RecommendQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = recommenderUrl + "customized/" + userId + "?start=" + start + "&number=" + number + "&lat=" + latitude + "&lng=" + longitude + "&area=" + area;
		logger.info(String.format("Ask for customized discounts from %s", url));
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}

	}

	public String getDiscountByType(int userId, double latitude, double longitude, int start, int number, String type, String area)
			throws RecommendQueryException, UnsupportedEncodingException {
		RestTemplate restTemplate = new RestTemplate();
		String city = URLEncoder.encode(area, "utf-8");
		String url = recommenderUrl + "type/" + userId + "?start=" + start + "&type=" + type + "&number=" + number + "&area=" + city + "&lat=" + latitude + "&lng=" + longitude;
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
	
	public String getDiscountsByBank(double latitude, double longitude, String area, int start, int number, int userId, String bankName)
			throws RecommendQueryException, UnsupportedEncodingException {
		RestTemplate restTemplate = new RestTemplate();
		String city = URLEncoder.encode(area, "utf-8");

		String url = recommenderUrl + "bank?lat=" + latitude + "&lng=" + longitude + "&area=" + city + "&start=" + start + "&number="
				+ number + "&userId=" + userId + "&bankName=" + bankName;
		logger.info(String.format("Discounts depend on bank from %s", url));
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}
	}

	//Yao add
	public String getHotDiscounts(String area, int start, int number)
			throws RecommendQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = recommenderUrl + "hot/area=" + area + "&start=" + start + "&number="
				+ number;
		logger.info(String.format("Ask for hot discounts from %s", url));
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new RecommendQueryException();
		}
	}

}
