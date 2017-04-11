package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;
import com.base.test.model.Orders;
import com.base.test.model.Payments;
import com.base.test.utility.Printer;

@Controller
public class PrintController {

	@Autowired
	Printer printService;

	@Autowired
	ServiceInterface<Bill> billService;

	@RequestMapping(value = "/printBill")
	public void printBill(@RequestBody String tableNumber, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Print Bill");
		System.out.println(tableNumber);
		Bill bill = billService.getByTableNumber(tableNumber);
		for (Orders order : bill.getOrders()) {
			order.setBill(null);
		}
		for (Payments payment : bill.getPayments()) {
			payment.setBill(null);
		}
		printService.printBill(bill);
	}
}
