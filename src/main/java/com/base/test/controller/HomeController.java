package com.base.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.base.test.model.Payments;
import com.base.test.model.Tables;
import com.base.test.model.Users;
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

	@Autowired
	private ServiceInterface<Users> userService;

	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("allTables", tablesService.getAll());
		model.put("allWaiter", waiterService.getAll());
		model.put("allBarMenu", barMenuService.getAll());
		model.put("allFoodMenu", foodMenuService.getAll());
		model.put("role", session.getAttribute("role"));
		

		return new ModelAndView("homepage", "model", model);
	}

	@RequestMapping(value = "/getOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Bill getOrder(@RequestBody String tableNumber, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("---------GET ORDER----------");
		System.out.println(tableNumber);
		Bill bill = billService.getByTableNumber(tableNumber);
		clearForJsonParser(bill);
		return bill;
	}

	@RequestMapping(value = "/getBills", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody List<Bill> getBills(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---------GET BILLS----------");
		List<Bill> bills = billService.getActiveEntity();
		for (Bill bill : bills) {
			clearForJsonParser(bill);
		}
		return bills;
	}

	@RequestMapping(value = "/saveOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public Bill saveOrder(@RequestBody Bill bill, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---------SAVE ORDER----------");
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("username");
		bill.setUserID(userService.getByName(userName).getId());
		billService.create(bill);
		bill = billService.getByTableNumber(bill.getTableNumber());
		clearForJsonParser(bill);
		return bill;
	}

	@RequestMapping(value = "/editOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Bill editOrder(@RequestBody Bill bill, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("---------EDIT ORDER---------");
		bill = billService.update(bill.getId(), bill);
		clearForJsonParser(bill);
		return bill;
	}

	private void clearForJsonParser(Bill bill) {
		for (Orders order : bill.getOrders()) {
			order.setBill(null);
		}

		for (Payments payment : bill.getPayments()) {
			payment.setBill(null);
		}
	}
}