package com.base.test.DAO;

import org.springframework.stereotype.Repository;
import com.base.test.model.Orders;

@Repository("ordersDAO")
public class OrdersDao  extends AbstractDao<Orders>{
	@Override
	public String getEntityName() {
		return "Orders";
	}

	@Override
	public Class getEntityClass() {
		return Orders.class;
	}
}