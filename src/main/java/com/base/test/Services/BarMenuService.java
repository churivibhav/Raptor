package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.BarMenuDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.model.BarMenu;

@Service("barMenuService")
public class BarMenuService extends AbstractService<BarMenu> {

	@Autowired
	private BarMenuDAO barMenuDAO;

	@Override
	public DaoInterface<BarMenu> getEntityDAO() {
		// TODO Auto-generated method stub
		return barMenuDAO;
	}

}
