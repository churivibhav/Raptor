	package com.base.test.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
	public ModelAndView login() {
		Map<String, Integer> errorMsg = new HashMap<String, Integer>();
		errorMsg.put("loginError", 0);
		ModelAndView model = new ModelAndView("login", "errorMsg", errorMsg);
		return model;
	}
	
	@RequestMapping(value="/authorize")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String, Integer> errorMsg = new HashMap<String, Integer>();
		
		Users user = userService.getByName(username);
		
		if(username == null || password == null || username.equals("") || password.equals("") || user == null){
			errorMsg.put("loginError", 1);
			ModelAndView model = new ModelAndView("login", "errorMsg", errorMsg);
			return model;
		}
		if(password.equals(user.getPassword())){
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			String sessionID = UUID.randomUUID().toString().replaceAll("-", "") + timestamp.getTime();
			logger.info(sessionID + " " +username);
			user.setSessionID(sessionID);
			Long userId = user.getId();
			
			session.setAttribute("sessionID", sessionID);
			session.setAttribute("username", username);
			
			userService.update(userId, user);
			logger.info(username + " logged in");
			return new ModelAndView("redirect:/home");
		}else if(!(password.equals(user.getPassword()))){
			errorMsg.put("loginError", 1);
			ModelAndView model = new ModelAndView("login", "errorMsg", errorMsg);
			return model;
		}
		errorMsg.put("loginError", 1);
		ModelAndView model = new ModelAndView("login", "errorMsg", errorMsg);
		return model;
	}
}