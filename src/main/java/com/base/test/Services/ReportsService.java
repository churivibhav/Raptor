package com.base.test.Services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.ReportsDAO;
import com.base.test.DTO.ColumnInfoDTO;
import com.base.test.model.Reports;

@Service("reportsService")
public class ReportsService extends AbstractService<Reports> {

	@Autowired
	private ReportsDAO reportsDAO;

	@Override
	public DaoInterface<Reports> getEntityDAO() {
		return reportsDAO;
	}
}