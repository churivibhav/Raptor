package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Waiter;

@Repository("waiterDAO")
public class WaiterDAO extends AbstractDao<Waiter> {

	@Override
	public String getEntityName() {
		return "Waiter";
	}

	@Override
	public Class getEntityClass() {
		return Waiter.class;
	}

}
