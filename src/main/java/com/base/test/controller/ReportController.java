package com.base.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;

@Controller
public class ReportController {
Logger logger = LogManager.getLogger(ReportController.class);
	
	@Autowired
	private ServiceInterface<Bill> billService;
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report() {
		List<Bill> billList = billService.getAll();
		//logger.info(billList);
		ModelAndView model = new ModelAndView("report", "bills", billList);
		return model;
	}
	
	@RequestMapping(value = "/generate/excel.xls", method = RequestMethod.GET)
	ModelAndView generateExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 System.out.println("Calling generateExcel()...");
		 
		 List<Bill> billList = billService.getAll();
		 
		 ModelAndView modelAndView = new ModelAndView("reportView", "bills",billList);
		 System.out.println("third");
		 return modelAndView;
	}
}
