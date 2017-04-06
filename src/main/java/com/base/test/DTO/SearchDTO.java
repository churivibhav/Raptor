package com.base.test.DTO;

import java.util.List;

public class SearchDTO {

	private List<String> columns;
	private List<String> operations;

	public SearchDTO(List<String> columns, List<String> operations) {
		super();
		this.columns = columns;
		this.operations = operations;
	}

	public List<String> getColumns() {
		return columns;
	}

	public void setColumns(List<String> columns) {
		this.columns = columns;
	}

	public List<String> getOperations() {
		return operations;
	}

	public void setOperations(List<String> operations) {
		this.operations = operations;
	}

	@Override
	public String toString() {
		return "Columns: " + columns + " \n Operations: " + operations;
	}

}
