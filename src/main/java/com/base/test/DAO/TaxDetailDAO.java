package com.base.test.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.base.test.model.Orders;
import com.base.test.model.TaxDetail;

@Repository("taxDetailDAO")
public class TaxDetailDAO extends AbstractDao<TaxDetail>{
	@Override
	public String getEntityName() {
		return "TaxDetail";
	}

	@Override
	public Class getEntityClass() {
		return Orders.class;
	}
	
	public TaxDetail getTaxDetail(String itemTpe, String taxType){
		String sql = "from " + getEntityName() + " where itemType= '" + itemTpe + "' and taxType = '"+ taxType + "'";
		return (TaxDetail)getSession().createQuery(sql).uniqueResult();
	}
	
	public List<TaxDetail> getTaxList(String itemTpe){
		String sql = "from " + getEntityName() + " where itemType= '" + itemTpe + "'";
		List<TaxDetail> taxList = getSession().createQuery(sql).list();
		return taxList;
	}
}
