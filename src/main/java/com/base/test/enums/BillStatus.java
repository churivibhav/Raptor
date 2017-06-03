package com.base.test.enums;

public enum BillStatus {
	UNPAID("UNPAID"), PAID("PAID"), CANCELED("CANCELED");

	private String id;

	/**
	 * Constructeur
	 * 
	 * @param id
	 */
	private BillStatus(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
