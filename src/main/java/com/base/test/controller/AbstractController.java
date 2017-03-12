package com.base.test.controller;

import com.base.test.Services.ServiceInterface;

public abstract class AbstractController<T> {
	public abstract ServiceInterface<T> getEntityService();
	
	
}
