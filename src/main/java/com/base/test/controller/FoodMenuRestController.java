package com.base.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.FoodMenu;

@RestController
@RequestMapping("/FoodMenu")
public class FoodMenuRestController extends AbstractRestController<FoodMenu> {

	@Autowired
	private ServiceInterface<FoodMenu> foodMenuService;

	@Override
	public ServiceInterface<FoodMenu> getEntityService() {
		return foodMenuService;
	}
}
