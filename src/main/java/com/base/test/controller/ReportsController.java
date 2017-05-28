package com.base.test.controller;

import java.util.ArrayList;
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

import com.base.test.Services.ReportsService;
import com.base.test.Services.SearchService;
import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;
import com.base.test.model.Reports;

@Controller
public class ReportsController {

	private Logger logger = LogManager.getLogger(ReportsController.class);

	@Autowired
	ServiceInterface<Bill> billService;

	ReportsService reportsService = new ReportsService();

	@Autowired
	SearchService searchService;

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report() {
		List<Bill> billList = billService.getAll();
		// logger.info(billList);
		ModelAndView model = new ModelAndView("report", "bills", billList);
		return model;
	}

	@Deprecated
	@RequestMapping(value = "/dailySummary", method = RequestMethod.GET)
	public ModelAndView dailySummary() {
		ModelAndView model = new ModelAndView("dailySummary");
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

	@RequestMapping(value = "/fireReport", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody ModelAndView fireReport(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<List<List<String>>> results = new ArrayList<>();
		Reports report = reportsService.findByID(1L);
		String[] queries = report.getQuery().split(";");
		String[] columns = report.getColumnsName().split(";");
		for (int i = 0; i < queries.length; i++) {
			List<List<String>> fireReport = reportsService.fireReport(queries[i]);
			System.out.println(fireReport);
			results.add(fireReport);
		}
		return reportsService.processReport(report.getReportName(), results);
	}
}
