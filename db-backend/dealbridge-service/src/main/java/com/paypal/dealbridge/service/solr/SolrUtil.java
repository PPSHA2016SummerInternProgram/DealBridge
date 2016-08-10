package com.paypal.dealbridge.service.solr;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class SolrUtil {
	private static final String SOLR_URL = "http://10.24.96.170:8983/solr/dealbridge/";

	public String searchDiscount(String query) throws SolrQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = SOLR_URL + "select?q=" + query + "&wt=json";
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new SolrQueryException();
		}
	}
	
	public String searchDiscount(String query, int start, int rows) throws SolrQueryException {
		RestTemplate restTemplate = new RestTemplate();
		String url = SOLR_URL + "select?q=" + query + "&start=" + start + "&rows=" + rows + "&wt=json";
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		if (response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
		} else {
			throw new SolrQueryException();
		}
	}
}
