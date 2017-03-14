package com.base.test.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Card;
import com.base.test.model.Users;

@Controller
public class CardController {

	@Autowired
	private ServiceInterface<Card> cardService;
	private static final Logger logger = LogManager.getLogger(CardController.class);
	
	@RequestMapping("/cardEnter")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		String cardNumber = request.getParameter("cardNumber").replace(";", "").replace("?", "");
		Double balance =  Double.parseDouble(request.getParameter("balance"));
		logger.info(cardNumber + " " + balance);
		
		Card card = cardService.getByName(cardNumber);
		card.setBalance(balance);
		
		logger.info(card.getCardNumber() + " " + card.getId() + " " + card.getBalance());
		
		cardService.update(card.getId(), card);
		
		return new ModelAndView("cardEntry");
	}
}
