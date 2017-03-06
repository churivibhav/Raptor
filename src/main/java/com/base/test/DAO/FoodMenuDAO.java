package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.FoodMenu;

@Repository("foodMenuDAO")
public class FoodMenuDAO extends AbstractDao<FoodMenu> {

	@Override
	public String getEntityName() {
		return "FoodMenu";
	}

	@Override
	public Class getEntityClass() {
		return FoodMenu.class;
	}

}
