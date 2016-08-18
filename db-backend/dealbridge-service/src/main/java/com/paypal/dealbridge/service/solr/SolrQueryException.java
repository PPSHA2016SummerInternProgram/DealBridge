package com.paypal.dealbridge.service.solr;

public class SolrQueryException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SolrQueryException(String msg) {
		super(msg);
	}
	
	public SolrQueryException() {
		super();
	}
}
