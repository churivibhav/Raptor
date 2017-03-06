package com.base.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Tables;

@Controller
public class HomeController {

	@Autowired
	ServiceInterface<Tables> tablesService;

	@RequestMapping("/home")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("userName");
		String password = request.getParameter("password");

		List<Tables> allTables = tablesService.getAll();
		return new ModelAndView("homepage", "allTables", allTables);
	}

}