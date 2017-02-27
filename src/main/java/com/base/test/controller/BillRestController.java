package com.base.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;
import com.base.test.model.Tables;

@RestController
@Configurable
@RequestMapping("/bill")
public class BillRestController extends AbstractRestController<Bill>{
	
	@Autowired
	private ServiceInterface<Bill> billService;

	@Override
	public ServiceInterface<Bill> getEntityService() {
		return billService;
	}
}

