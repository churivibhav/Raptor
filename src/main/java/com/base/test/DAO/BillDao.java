package com.base.test.DAO;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.base.test.enums.BillStatus;
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
		Criteria criteria = getSession().createCriteria(getEntityClass());
		criteria.add(Restrictions.eq("tableNumber", tableNumber));
		criteria.add(Restrictions.eq("status", BillStatus.UNPAID.getId()));
		return (Bill) criteria.uniqueResult();
	}

	public List<Bill> getActiveBills() {
		Criteria criteria = getSession().createCriteria(getEntityClass());
		criteria.add(Restrictions.eq("status", BillStatus.UNPAID.getId()));
		return criteria.list();
	}

	public List<Bill> getTodaysBills(Date businessDay) {
		Criteria criteria = getSession().createCriteria(getEntityClass());
		criteria.add(Restrictions.eq("businessDay", businessDay));
		return criteria.list();
	}
}
