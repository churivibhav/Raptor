package com.base.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Waiter;

@RestController
@RequestMapping("/waiter")
public class WaiterRestController extends AbstractRestController<Waiter> {

	@Autowired
	private ServiceInterface<Waiter> waiterService;

	@Override
	public ServiceInterface<Waiter> getEntityService() {
		return waiterService;
	}
}
