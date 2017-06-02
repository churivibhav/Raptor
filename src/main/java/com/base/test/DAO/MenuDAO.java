package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Menu;

@Repository("menuDAO")
public class MenuDAO extends AbstractDao<Menu> {

	@Override
	public String getEntityName() {
		return "Menu";
	}

	@Override
	public Class getEntityClass() {
		return Menu.class;
	}

}
