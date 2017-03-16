package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Bill;

@Repository("billDAO")
public class BillDao extends AbstractDao<Bill> {

	@Override
	public String getEntityName() {
		return "Bill";
	}

	@Override
	public Class getEntityClass() {
		return Bill.class;
	}

	public Bill getByTableNumber(String tableNumber) {
		return (Bill) getSession()
				.createQuery(
						"from " + getEntityName() + " where tableNumber = '" + tableNumber + "'" + " and isActive = 1")
				.uniqueResult();
	}
}
