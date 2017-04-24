package com.base.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.DTO.ReportsDTO;
import com.base.test.Services.SearchService;
import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;

@Controller
public class ReportsController {

	private Logger logger = LogManager.getLogger(ReportsController.class);

	@Autowired
	ServiceInterface<Bill> billService;

	@Autowired
	SearchService searchService;

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report() {
		List<Bill> billList = billService.getAll();
		// logger.info(billList);
		ModelAndView model = new ModelAndView("report", "bills", billList);
		return model;
	}

	@RequestMapping(value = "/generate/excel.xls", method = RequestMethod.GET)
	ModelAndView generateExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Calling generateExcel()...");

		List<Bill> billList = billService.getAll();

		ModelAndView modelAndView = new ModelAndView("reportView", "bills", billList);
		System.out.println("third");
		return modelAndView;
	}

	@RequestMapping(value = "/fireReport", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody ReportsDTO fireReport(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ReportsDTO result = null;
		result = searchService.fireReport("select * from Bill", "id,long;TableNumber,long");
		return result;
	}
}
