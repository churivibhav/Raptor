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

import com.base.test.Services.ServiceInterface;
import com.base.test.Services.UsersService;
import com.base.test.model.Users;

@Controller
public class LogoutController {
	
	@Autowired
	private ServiceInterface<Users> userService;
	private static final Logger logger = LogManager.getLogger(LogoutController.class);
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String username = (String)session.getAttribute("username");
		String sessionID = (String)session.getAttribute("sessionID");
		Users user = userService.getByName(username);
		
		
		logger.info(user);
		
		if(user.getSessionID().equals(sessionID)){
			user.setSessionID(null);
			Long userId = user.getId();
			userService.update(userId, user);
		}
		
		ModelAndView model = new ModelAndView("login");
		return model;

	}
}
