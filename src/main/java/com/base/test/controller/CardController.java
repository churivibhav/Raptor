package com.base.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.base.test.enums.TransactionType;
import com.base.test.model.Bill;
import com.base.test.model.Cards;
import com.base.test.model.Payments;
import com.base.test.model.Users;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CardController {

	@Autowired
	ServiceInterface<Cards> cardService;

	@Autowired
	ServiceInterface<Bill> billService;
	
	@Autowired
	ServiceInterface<Users> userService;

	private static final Logger logger = LogManager.getLogger(CardController.class);

	@RequestMapping(value = "/getBalance", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Cards getBalance(@RequestBody String cardNumber, HttpServletRequest request,
			HttpServletResponse response) {
		// ;3333203131003101936666?
		// ;3333203131003101946666?
		cardNumber = cardNumber.substring(14, 19);
		Cards card = cardService.getByName(cardNumber);
		return card;
	}

	@RequestMapping(value = "/getAllCardsBalances", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody List<Cards> getAllCardsBalances(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---------GET All Cards Balances----------");
		List<Cards> cards = cardService.getActiveEntity();
		return cards;
	}

	@RequestMapping(value = "/refundBalance", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Cards refundBalance(@RequestBody Cards card, HttpServletRequest request,
			HttpServletResponse response) {
		// card.setCardNumber(card.getCardNumber().substring(14, 19));
		card.setCardNumber(card.getCardNumber());
		Cards card_old = cardService.getByName(card.getCardNumber());
		Double bal_old = card_old.getBalance();
		// card_old.setBalance(0.0);
		card_old.setBalance(card.getBalance());
		card = cardService.update(card_old.getId(), card_old);
		/**
		 * Add to history.
		 */
		cardService.addToCardHistory(card_old, card_old.getBalance() - bal_old, card_old.getBalance(),
				TransactionType.REFUND);
		return card;
	}

	@RequestMapping(value = "/cleanBalance", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Cards cleanBalance(@RequestBody Cards card, HttpServletRequest request,
			HttpServletResponse response) {
		card.setCardNumber(card.getCardNumber().substring(14, 19));
		Cards card_old = cardService.getByName(card.getCardNumber());
		Double bal_old = card_old.getBalance();
		card_old.setBalance(0.0);
		card = cardService.update(card_old.getId(), card_old);
		/**
		 * Add to history.
		 */
		cardService.addToCardHistory(card_old, card_old.getBalance() - bal_old, card_old.getBalance(),
				TransactionType.CLEAN);
		return card;
	}

	@RequestMapping(value = "/addBalance", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Cards addBalance(@RequestBody String str, HttpServletRequest request,
			HttpServletResponse response) throws JsonProcessingException, IOException {
		/* Getting card data */
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(str);
		Cards card = (Cards) mapper.convertValue(node.get("cardData"), Cards.class);

		/* Getting Bill data */
		Bill bill = (Bill) mapper.convertValue(node.get("billData"), Bill.class);
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("username");
		bill.setUserID(userService.getByName(userName).getId());
		
		bill.setOrders(new ArrayList<>());

		Payments payment = (Payments) mapper.convertValue(node.get("paymentData"), Payments.class);

		Cards card_old = cardService.getByName(card.getCardNumber().substring(14, 19));

		Double bal_old = card_old.getBalance();
		card_old.setBalance(card.getBalance());
		card = cardService.update(card_old.getId(), card_old);
		/**
		 * Add to history.
		 */
		long cardHistoryID = cardService.addToCardHistory(card_old, card_old.getBalance() - bal_old, card_old.getBalance(),
				TransactionType.CREDIT);

		Long id = billService.create(bill);
		bill.setPayments(new ArrayList<>());
		bill.getPayments().add(payment);
		payment.setBill(bill);
		payment.setTransactionID(cardHistoryID);
		System.out.println("bill id " + bill.getId() + " " + payment.getBill());
		billService.update(id, bill);

		return card;
	}
}
