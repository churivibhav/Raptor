	package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.DAO.UsersDAO;
import com.base.test.Services.ServiceInterface;
import com.base.test.model.Users;

@Controller
public class LoginController {

	Logger logger = LogManager.getLogger(LoginController.class);
	
	@Autowired
	private ServiceInterface<Users> userService;  
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getData() {

		ModelAndView model = new ModelAndView("login");
	
		return model;

	}
	
	@RequestMapping(value="/authorize")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		logger.info(username + " " + password);
		Users user = userService.getByName(username);
		
		
		
		if(password.equals(user.getPassword())){
			return new ModelAndView("redirect:/home");
		}else if(username == null || username.equals("") || user == null || 
				password == null || password.equals("") || !(password.equals(user.getPassword()))){
			return new ModelAndView("login");
		}
		return new ModelAndView("login");
		/*if(!username.equals("") && username != null && username.equals("ameya") &&
		   !password.equals("") && password != null && password.equals("ameya")){
			return new ModelAndView("homepage");
		}else{ 
			return new ModelAndView("login");
		}*/
		
		//return new ModelAndView("login");
	}
	
	/*public boolean checkInputFields(String username, String password, Users user){
		if(username == null || username.equals("") || user == null || 
				password == null || password.equals("") || !(password.equals(user.getPassword()))){
			return false;
		}else
			
	}*/
	
	/*@RequestMapping(value = "/homepage")
	public ModelAndView getHomePage() {

		ModelAndView model = new ModelAndView("homepage");
	
		return model;

	}*/

}