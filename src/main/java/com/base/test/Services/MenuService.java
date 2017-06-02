package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.MenuDAO;
import com.base.test.model.Menu;

@Service("menuService")
public class MenuService extends AbstractService<Menu> {

	@Autowired
	private MenuDAO menuDAO;

	@Override
	public DaoInterface<Menu> getEntityDAO() {
		return menuDAO;
	}

}
