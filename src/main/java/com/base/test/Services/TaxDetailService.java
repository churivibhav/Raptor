package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.TaxDetailDAO;
import com.base.test.model.TaxDetail;

@Service("taxDetailService")
public class TaxDetailService extends AbstractService<TaxDetail> {
	@Autowired
	private TaxDetailDAO taxDetailDAO;

	@Override
	public DaoInterface<TaxDetail> getEntityDAO() {
		return taxDetailDAO;
	}
}