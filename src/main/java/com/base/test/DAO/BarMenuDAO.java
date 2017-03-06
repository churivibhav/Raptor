package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.BarMenu;

@Repository("barMenuDAO")
public class BarMenuDAO extends AbstractDao<BarMenu> {

	@Override
	public String getEntityName() {
		return "BarMenu";
	}

	@Override
	public Class getEntityClass() {
		return BarMenu.class;
	}

}
