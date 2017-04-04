package com.base.test.DAO;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;

import com.base.test.model.Orders;
import com.base.test.model.TaxDetail;

@Repository("taxDetailDAO")
public class TaxDetailDAO extends AbstractDao<TaxDetail> {
	@Override
	public String getEntityName() {
		return "TaxDetail";
	}

	@Override
	public Class getEntityClass() {
		return Orders.class;
	}

	public List<TaxDetail> taxList;

	public List<TaxDetail> getTaxList(String itemTpe) {
		taxList = Optional.ofNullable(taxList).orElse(getAllTaxDetail());
		return taxList.stream().filter(b -> b.getItemType().equals(itemTpe)).collect(Collectors.toList());
	}

	public List<TaxDetail> getTaxDetail(String itemTpe, String taxType) {
		return taxList.stream().filter(b -> (b.getItemType().equals(itemTpe)) && b.getTaxType().equals(taxType))
				.collect(Collectors.toList());
	}

	public List<TaxDetail> getAllTaxDetail() {
		return findAll();
	}

	/*
	 * public TaxDetail getTaxDetail(String itemTpe, String taxType){ String sql
	 * = "from " + getEntityName() + " where itemType= '" + itemTpe +
	 * "' and taxType = '"+ taxType + "'"; return
	 * (TaxDetail)getSession().createQuery(sql).uniqueResult(); }
	 * 
	 * public List<TaxDetail> getTaxList(String itemTpe){ String sql = "from " +
	 * getEntityName() + " where itemType= '" + itemTpe + "'"; List<TaxDetail>
	 * taxList = getSession().createQuery(sql).list(); return taxList; }
	 */
}
