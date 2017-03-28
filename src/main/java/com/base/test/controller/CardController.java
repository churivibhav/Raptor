package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Cards;

@Controller
public class CardController {

	@Autowired
	private ServiceInterface<Cards> cardService;
	private static final Logger logger = LogManager.getLogger(CardController.class);

	@RequestMapping("/cardEnter")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		String cardNumber = request.getParameter("cardNumber").replace(";", "").replace("?", "");
		Double balance = Double.parseDouble(request.getParameter("balance"));
		logger.info(cardNumber + " " + balance);

		Cards card = cardService.getByName(cardNumber);
		card.setBalance(balance);

		logger.info(card.getCardNumber() + " " + card.getId() + " " + card.getBalance());

		cardService.update(card.getId(), card);

		return new ModelAndView("cardEntry");
	}

	@RequestMapping(value = "/getBalance", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Cards getBalance(@RequestBody String cardNumber, HttpServletRequest request,
			HttpServletResponse response) {
		//;3333203131003101936666?
		cardNumber = cardNumber.substring(14, 19);
		Cards card = cardService.getByName(cardNumber);
		logger.info(card.getCardNumber() + " " + card.getId() + " " + card.getBalance());
		return card;
	}

	@RequestMapping("/updateBalance")
	public ModelAndView updateBalance(HttpServletRequest request, HttpServletResponse response) {
		String cardNumber = request.getParameter("cardNumber").replace(";", "").replace("?", "");
		Double balance = Double.parseDouble(request.getParameter("balance"));
		logger.info(cardNumber + " " + balance);

		Cards card = cardService.getByName(cardNumber);
		card.setBalance(balance);

		logger.info(card.getCardNumber() + " " + card.getId() + " " + card.getBalance());

		cardService.update(card.getId(), card);

		return new ModelAndView("cardEntry");
	}
}
