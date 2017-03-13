package com.base.test.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CardController {

	@RequestMapping("/cardEnter")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		String cardNumber = request.getParameter("userName");
		

		return new ModelAndView("cardEntry");
	}
}
