package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.OrdersDao;
import com.base.test.model.Orders;

@Service("ordersService")
public class OrdersService extends AbstractService<Orders> {

	@Autowired
	private OrdersDao ordersDAO;

	@Override
	public DaoInterface<Orders> getEntityDAO() {
		// TODO Auto-generated method stub
		return ordersDAO;
	}

}