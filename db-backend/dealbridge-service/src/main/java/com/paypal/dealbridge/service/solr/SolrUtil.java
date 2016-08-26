package com.paypal.dealbridge.service.solr;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class SolrUtil {
	@Value("${solr.url}")
	private String solrUrl;

	public String searchDiscount(String query) throws SolrQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = solrUrl + "select?q=" + query + "&wt=json";
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new SolrQueryException();
		}
	}
	
	public String searchDiscount(String query, String area, int start, int rows) throws SolrQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String q = "area:" + area + " OR area:全国  AND " + query;
		String url = solrUrl + "select?q=" + q + "&start=" + start + "&rows=" + rows + "&wt=json";
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new SolrQueryException();
		}
	}
}
