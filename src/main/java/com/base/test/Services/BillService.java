package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.BillDao;
import com.base.test.DAO.DaoInterface;
import com.base.test.model.Bill;

@Service("billService")
public class BillService extends AbstractService<Bill> {

	@Autowired
	private BillDao billDAO;

	@Override
	public DaoInterface<Bill> getEntityDAO() {
		return billDAO;
	}

	public Bill getByTableNumber(String tableNumber) {
		return billDAO.getByTableNumber(tableNumber);
	}
}