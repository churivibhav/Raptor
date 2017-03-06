	package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getData() {

		ModelAndView model = new ModelAndView("login");
	
		return model;

	}
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		
		if(!username.equals("") && username != null && username.equals("ameya") &&
		   !password.equals("") && password != null && password.equals("ameya")){
			String msg = "hey " + username; 
			return new ModelAndView("welcome", "message", msg);
		}else{
			String msg = "Sorry Wrong login"; 
			return new ModelAndView("error", "message", msg);
		}
	}

}