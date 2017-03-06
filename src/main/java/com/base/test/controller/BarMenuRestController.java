package com.base.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.BarMenu;

@RestController
@RequestMapping("/BarMenu")
public class BarMenuRestController extends AbstractRestController<BarMenu> {

	@Autowired
	private ServiceInterface<BarMenu> barMenuService;

	@Override
	public ServiceInterface<BarMenu> getEntityService() {
		return barMenuService;
	}
}
