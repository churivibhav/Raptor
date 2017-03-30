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

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Cards;

@Controller
public class CardController {

	@Autowired
	private ServiceInterface<Cards> cardService;
	private static final Logger logger = LogManager.getLogger(CardController.class);

	@RequestMapping(value = "/getBalance", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Cards getBalance(@RequestBody String cardNumber, HttpServletRequest request,
			HttpServletResponse response) {
		// ;3333203131003101936666?
		cardNumber = cardNumber.substring(14, 19);
		Cards card = cardService.getByName(cardNumber);
		return card;
	}

	@RequestMapping(value = "/updateBalance", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Cards updateBalance(@RequestBody Cards card, HttpServletRequest request,
			HttpServletResponse response) {
		Double bal = card.getBalance();
		card = cardService.getByName(card.getCardNumber().substring(14, 19));
		card.setBalance(bal);
		card = cardService.update(card.getId(), card);
		return card;
	}
}
