package com.base.test.DAO;

import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;

import com.base.test.model.TaxDetail;

@Repository("taxDetailDAO")
public class TaxDetailDAO extends AbstractDao<TaxDetail> {
	@Override
	public String getEntityName() {
		return "TaxDetail";
	}

	@Override
	public Class getEntityClass() {
		return TaxDetail.class;
	}

	public Map<Long, TaxDetail> taxList;

	private Map<Long, TaxDetail> getTaxList() {
		taxList = Optional.ofNullable(taxList).orElse(getAllTaxDetail());
		return taxList;
	}

	private Map<Long, TaxDetail> getAllTaxDetail() {
		return findAll().stream().collect(Collectors.toMap(b -> b.getId(), b -> b));
	}

	public TaxDetail getTaxDetail(Long id) {
		return getTaxList().get(id);
	}
}
