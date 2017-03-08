	package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	Logger logger = LogManager.getLogger(LoginController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getData() {

		ModelAndView model = new ModelAndView("login");
	
		return model;

	}
	
	@RequestMapping(value="/authorize")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		if(!username.equals("") && username != null && username.equals("ameya") &&
		   !password.equals("") && password != null && password.equals("ameya")){
			return new ModelAndView("homepage");
		}else{ 
			return new ModelAndView("login");
		}
		
		//return new ModelAndView("login");
	}
	
	/*@RequestMapping(value = "/homepage")
	public ModelAndView getHomePage() {

		ModelAndView model = new ModelAndView("homepage");
	
		return model;

	}*/

}