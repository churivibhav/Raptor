package com.base.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Orders;

@RestController
@Configurable
@RequestMapping("/orders")
public class OrdersRestController extends AbstractRestController<Orders>{
	
	@Autowired
	private ServiceInterface<Orders> ordersService;

	@Override
	public ServiceInterface<Orders> getEntityService() {
		return ordersService;
	}
}
