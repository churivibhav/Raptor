package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.TablesDAO;
import com.base.test.model.Tables;

@Service("tablesService")
public class TablesService extends AbstractService<Tables> {

	@Autowired
	private TablesDAO tablesDAO;

	@Override
	public DaoInterface<Tables> getEntityDAO() {
		// TODO Auto-generated method stub
		return tablesDAO;
	}

}
