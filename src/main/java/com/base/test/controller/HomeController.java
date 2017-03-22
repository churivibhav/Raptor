package com.base.test.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.BarMenu;
import com.base.test.model.Bill;
import com.base.test.model.FoodMenu;
import com.base.test.model.Orders;
import com.base.test.model.Tables;
import com.base.test.model.Waiter;

@Controller
public class HomeController {

	@Autowired
	ServiceInterface<Tables> tablesService;

	@Autowired
	ServiceInterface<Waiter> waiterService;

	@Autowired
	ServiceInterface<BarMenu> barMenuService;

	@Autowired
	ServiceInterface<FoodMenu> foodMenuService;

	@Autowired
	ServiceInterface<Bill> billService;

	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("userName");
		String password = request.getParameter("password");

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("allTables", tablesService.getAll());
		model.put("allWaiter", waiterService.getAll());
		model.put("allBarMenu", barMenuService.getAll());
		model.put("allFoodMenu", foodMenuService.getAll());

		return new ModelAndView("homepage", "model", model);
	}

	@RequestMapping(value = "/getOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Bill saveOrder(@RequestBody String tableNumber, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("---------GET ORDER----------");
		System.out.println(tableNumber);
		Bill bill = billService.getByTableNumber(tableNumber);
		for (Orders order : bill.getOrders()) {
			order.setBill(null);
		}
		return bill;
	}

	@RequestMapping(value = "/saveOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public Bill saveOrder(@RequestBody Bill bill, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---------SAVE ORDER----------");
		for (Orders order : bill.getOrders()) {
			order.setBill(bill);
		}
		billService.create(bill);
		return bill;
	}

	@RequestMapping(value = "/editOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public Bill editOrder(@RequestBody Bill bill, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---------EDIT ORDER---------");
		for (Orders order : bill.getOrders()) {
			order.setBill(bill);
		}
		billService.update(bill.getId(), bill);
		return bill;
	}
}