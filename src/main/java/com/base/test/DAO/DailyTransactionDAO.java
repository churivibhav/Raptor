package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.DailyTransaction;

@Repository("DailyTransactionDAO")
public class DailyTransactionDAO extends AbstractDao<DailyTransaction> {
	@Override
	public String getEntityName() {
		return "DailyTransaction";
	}

	@Override
	public Class getEntityClass() {
		return DailyTransaction.class;
	}

	public DailyTransaction getActiveDay() {
		DailyTransaction activeDay = (DailyTransaction) getSession()
				.createQuery("from " + getEntityName() + " where isActive = 1").uniqueResult();
		return activeDay;
	}
}