package com.base.test.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.base.test.model.Cards;
import com.base.test.model.FoodMenu;
import com.base.test.model.Orders;
import com.base.test.model.Payments;
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

	@Autowired
	private ServiceInterface<Cards> cardService;

	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("allTables", tablesService.getAll());
		model.put("allWaiter", waiterService.getAll());
		model.put("allBarMenu", barMenuService.getAll());
		model.put("allFoodMenu", foodMenuService.getAll());

		return new ModelAndView("homepage", "model", model);
	}

	@RequestMapping(value = "/getOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Bill getOrder(@RequestBody String tableNumber, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("---------GET ORDER----------");
		System.out.println(tableNumber);
		Bill bill = billService.getByTableNumber(tableNumber);
		for (Orders order : bill.getOrders()) {
			order.setBill(null);
		}
		for (Payments payment : bill.getPayments()) {
			payment.setBill(null);
		}
		return bill;
	}

	@RequestMapping(value = "/getBills", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody List<Bill> getBills(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---------GET BILLS----------");
		List<Bill> bills = billService.getActiveBills();
		for (Bill bill : bills) {
			for (Orders order : bill.getOrders()) {
				order.setBill(null);
			}
			for (Payments payment : bill.getPayments()) {
				payment.setBill(null);
			}
		}
		return bills;
	}

	@RequestMapping(value = "/saveOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public Bill saveOrder(@RequestBody Bill bill, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---------SAVE ORDER----------");
		bill.setModificationDate(new Date());
		for (Orders order : bill.getOrders()) {
			order.setModificationDate(new Date());
			order.setBill(bill);
		}
		billService.create(bill);
		Tables table = tablesService.getByTableNumber(bill.getTableNumber());
		table.setIsActive(true);
		tablesService.update(table.getId(), table);
		return bill;
	}

	@RequestMapping(value = "/editOrder", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Bill editOrder(@RequestBody Bill bill, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("---------EDIT ORDER---------");
		Bill bill_old = billService.findByID(bill.getId());
		bill_old.setModificationDate(new Date());
		bill_old.setIsActive(bill.getIsActive());
		bill_old.setWaiterID(bill.getWaiterID());

		if (bill.getIsActive() == true) {
			for (Orders order : bill.getOrders()) {
				if (!bill_old.getOrders().contains(order)) {
					order.setModificationDate(new Date());
					order.setBill(bill_old);
					bill_old.getOrders().add(order);
				}
			}
		}

		if (bill.getPayments() == null) {
			bill.setPayments(new ArrayList<>());
		}

		for (Payments payemnt : bill.getPayments()) {
			bill_old.getPayments().add(payemnt);
			payemnt.setModificationDate(new Date());
			payemnt.setBill(bill_old);
			if (payemnt.getCardNumber() != null) {
				payemnt.setCardNumber(payemnt.getCardNumber().substring(14, 19));
				Cards card = cardService.getByName(payemnt.getCardNumber());
				card.setBalance(card.getBalance() - payemnt.getCost());
				cardService.update(card.getId(), card);
			}
		}
		billService.update(bill_old.getId(), bill_old);

		if (bill.getIsActive() == false) {
			Tables table = tablesService.getByTableNumber(bill.getTableNumber());
			table.setIsActive(false);
			tablesService.update(table.getId(), table);
		}

		for (Orders order : bill.getOrders()) {
			order.setBill(null);
		}

		for (Payments payment : bill.getPayments()) {
			payment.setBill(null);
		}
		return bill;
	}
}