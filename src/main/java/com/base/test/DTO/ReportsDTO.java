package com.base.test.DTO;

import java.util.List;

@Deprecated
public class ReportsDTO {

	private List<ColumnInfoDTO> columns;
	private List<List<String>> data;

	public List<ColumnInfoDTO> getColumns() {
		return columns;
	}

	public void setColumns(List<ColumnInfoDTO> columns) {
		this.columns = columns;
	}

	/**
	 * @return the data
	 */
	public List<List<String>> getData() {
		return data;
	}

	/**
	 * @param data
	 *            the data to set
	 */
	public void setData(List<List<String>> data) {
		this.data = data;
	}
}
