package com.base.test.controller;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

import com.base.test.DTO.ColumnInfoDTO;
import com.base.test.DTO.CriteriaDTO;
import com.base.test.DTO.SearchDTO;
import com.base.test.Services.SearchService;
import com.base.test.Services.ServiceInterface;
import com.base.test.model.BarMenu;
import com.base.test.model.Bill;
import com.base.test.model.FoodMenu;
import com.base.test.model.Orders;
import com.base.test.model.Payments;
import com.base.test.model.Tables;
import com.base.test.model.Waiter;
import com.base.test.utility.DisplayUtility;

@Controller
public class SearchController {

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
	SearchService searchService;

	@RequestMapping(value = "/getSearch", method = RequestMethod.GET)
	public ModelAndView getSearch(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("allTables", tablesService.getAll());
		model.put("allWaiter", waiterService.getAll());
		model.put("allBarMenu", barMenuService.getAll());
		model.put("allFoodMenu", foodMenuService.getAll());

		return new ModelAndView("Search", "model", model);
	}

	@RequestMapping(value = "/getSearchCriteria", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody SearchDTO getSearchCriteria(@RequestBody String className, HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException {
		SearchDTO result = null;
		Class searchClass = Class.forName("com.base.test.model." + className);

		Field[] fields = searchClass.getDeclaredFields();
		List<ColumnInfoDTO> columnMap = Arrays.stream(fields)
				.filter(b -> b.getType() != List.class)
				.map(b -> new ColumnInfoDTO(b.getName(), DisplayUtility.getDisplayName(b.getName()), b.getType().getName()))
				.collect(Collectors.toList());
		Map<String, String> operations = new HashMap<>();
		SearchService.addCriteriaOperations(operations);
		result = new SearchDTO(columnMap, operations);
		return result;
	}

	@RequestMapping(value = "/getByCriteria", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody List getByCriteria(@RequestBody CriteriaDTO criteria, HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException {
		Class searchClass = Class.forName("com.base.test.model." + criteria.getClassName());
		List list = searchService.getByCriteria(searchClass, criteria);

		/**
		 * TODO : create annotation to make it generic.
		 */
		if (criteria.getClassName().equals("Bill")) {
			for (Object bill : list) {
				Bill bill1 = (Bill) bill;
				for (Orders order : bill1.getOrders()) {
					order.setBill(null);
				}
				for (Payments payment : bill1.getPayments()) {
					payment.setBill(null);
				}
			}
		}
		if (criteria.getClassName().equals("Orders")) {
			for (Object order : list) {
				Orders order1 = (Orders) order;
				order1.setBill(null);
			}
		}
		if (criteria.getClassName().equals("Payments")) {
			for (Object payment : list) {
				Payments payment1 = (Payments) payment;
				payment1.setBill(null);
			}
		}
		return list;
	}
}
