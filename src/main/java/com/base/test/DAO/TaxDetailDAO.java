package com.base.test.DAO;

import java.util.Map;
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

	public Map<String, TaxDetail> taxList;

	public Map<String, TaxDetail> getTaxList() {
		taxList = Optional.ofNullable(taxList).orElse(getAllTaxDetail());
		return taxList;
	}

	/*
	 * public List<TaxDetail> getTaxList(String itemTpe) { taxList =
	 * Optional.ofNullable(taxList).orElse(getAllTaxDetail()); return
	 * taxList.stream().filter(b ->
	 * b.getItemType().equals(itemTpe)).collect(Collectors.toList()); }
	 * 
	 * public List<TaxDetail> getTaxDetail(String itemTpe, String taxType) {
	 * return taxList.stream().filter(b -> (b.getItemType().equals(itemTpe)) &&
	 * b.getTaxType().equals(taxType)) .collect(Collectors.toList()); }
	 */

	public Map<String, TaxDetail> getAllTaxDetail() {
		return findAll().stream()
				.collect(Collectors.toMap(b -> b.getItemType() + "_" + b.getTaxType().replace(' ', '_'), b -> b));
	}
}
