package com.base.test.DTO;

import java.util.List;

public class CriteriaDTO {

	private String className;
	private List<RestrictionsDTO> restrictions;

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public List<RestrictionsDTO> getRestrictions() {
		return restrictions;
	}

	public void setRestrictions(List<RestrictionsDTO> restrictions) {
		this.restrictions = restrictions;
	}
}
