package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.ReportsDAO;
import com.base.test.model.Reports;

@Service("reportsService")
public class ReportsService extends AbstractService<Reports> {

	@Autowired
	private ReportsDAO reportsDAO;

	@Override
	public DaoInterface<Reports> getEntityDAO() {
		// TODO Auto-generated method stub
		return reportsDAO;
	}

}