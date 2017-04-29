package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Reports;

@Repository("reportsDAO")
public class ReportsDAO extends AbstractDao<Reports> {
	@Override
	public String getEntityName() {
		return "Reports";
	}

	@Override
	public Class getEntityClass() {
		return Reports.class;
	}
}