package com.base.test.DTO;

import java.util.List;
import java.util.Map;

public class SearchDTO {

	private List<ColumnInfoDTO> columns;
	private Map<String, String> operations;

	public SearchDTO(List<ColumnInfoDTO> columns, Map<String, String> operations) {
		super();
		this.columns = columns;
		this.operations = operations;
	}

	public List<ColumnInfoDTO> getColumns() {
		return columns;
	}

	public void setColumns(List<ColumnInfoDTO> columns) {
		this.columns = columns;
	}

	public Map<String, String> getOperations() {
		return operations;
	}

	public void setOperations(Map<String, String> operations) {
		this.operations = operations;
	}

	@Override
	public String toString() {
		return "Columns: " + columns + " \n Operations: " + operations;
	}

}
