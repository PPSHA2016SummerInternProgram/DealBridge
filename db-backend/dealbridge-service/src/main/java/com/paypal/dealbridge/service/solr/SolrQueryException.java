package com.paypal.dealbridge.service.solr;

public class SolrQueryException extends Exception {
	public SolrQueryException(String msg) {
		super(msg);
	}
	
	public SolrQueryException() {
		super();
	}
}
