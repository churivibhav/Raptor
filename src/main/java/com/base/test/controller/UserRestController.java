package com.base.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.User;

@RestController
@RequestMapping("/User")
public class UserRestController extends AbstractRestController<User> {

	@Autowired
	private ServiceInterface<User> userService;

	@Override
	public ServiceInterface<User> getEntityService() {
		return userService;
	}
}
