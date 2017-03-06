package com.base.test.controller;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;
import com.base.test.model.Orders;

@RestController
@Configurable
@RequestMapping("/bill")
public class BillRestController extends AbstractRestController<Bill> {

	@Autowired
	private ServiceInterface<Bill> billService;

	@Override
	public ServiceInterface<Bill> getEntityService() {
		return billService;
	}

	@Override
	@PostMapping(value = "/create")
	public ResponseEntity createEntity(@RequestBody Bill bill, HttpServletRequest request) {
		String userName = checkUser(request);
		if (userName == null) {
			return new ResponseEntity("User is not loged in ", HttpStatus.UNAUTHORIZED);
		}
		Set<Orders> orders = bill.getOrders();
		for (Orders order : orders) {
			order.setBill(bill);
		}
		getEntityService().create(bill);
		return new ResponseEntity(bill, HttpStatus.OK);
	}
}
