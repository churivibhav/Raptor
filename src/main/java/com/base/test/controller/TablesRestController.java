package com.base.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Tables;

@RestController
@Configurable
@RequestMapping("/tables")
public class TablesRestController extends AbstractRestController<Tables> {

	@Autowired
	private ServiceInterface<Tables> tablesService;

	@Override
	public ServiceInterface<Tables> getEntityService() {
		return tablesService;
	}
}
