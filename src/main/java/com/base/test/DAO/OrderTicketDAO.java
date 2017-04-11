package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.OrderTicket;

@Repository("orderTicketDAO")
public class OrderTicketDAO extends AbstractDao<OrderTicket> {
	@Override
	public String getEntityName() {
		return "OrderTicket";
	}

	@Override
	public Class getEntityClass() {
		return OrderTicket.class;
	}
}
