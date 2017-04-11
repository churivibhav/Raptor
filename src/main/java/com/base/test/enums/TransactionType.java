package com.base.test.enums;

public enum TransactionType {
	DEBIT("DEBIT"), CREDIT("CREDIT"), REFUND("REFUND"), CLEAN("CLEAN");

	private String id;

	/**
	 * Constructeur
	 * 
	 * @param id
	 */
	private TransactionType(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
