package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.MenuSubType;

@Repository("menuSubTypeDAO")
public class MenuSubTypeDAO extends AbstractDao<MenuSubType> {
	@Override
	public String getEntityName() {
		return "MenuSubType";
	}

	@Override
	public Class getEntityClass() {
		return MenuSubType.class;
	}
}
