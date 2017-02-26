package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.WaiterDAO;
import com.base.test.model.Waiter;

@Service("waiterService")
public class WaiterService extends AbstractService<Waiter> {

	@Autowired
	private WaiterDAO waiterDAO;

	@Override
	public DaoInterface<Waiter> getEntityDAO() {
		// TODO Auto-generated method stub
		return waiterDAO;
	}

}
