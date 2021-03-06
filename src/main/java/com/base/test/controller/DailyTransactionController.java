package com.base.test.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.test.DTO.ReturnMessageDTO;
import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;
import com.base.test.model.Cards;
import com.base.test.model.DailyTransaction;
import com.base.test.model.Tables;

@Controller
public class DailyTransactionController {

	@Autowired
	ServiceInterface<DailyTransaction> dailyTransactionService;

	@Autowired
	ServiceInterface<Tables> tablesService;

	@Autowired
	ServiceInterface<Bill> billService;

	@Autowired
	ServiceInterface<Cards> cardService;

	@RequestMapping(value = "/startBusinessDay", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody ReturnMessageDTO startBusinessDay(HttpServletRequest request, HttpServletResponse response) {
		ReturnMessageDTO result = new ReturnMessageDTO();
		result.setStatus("Success");
		result.setMessage("Business Day Started..");
		try {
			checkActiveEntities(true);
			dailyTransactionService.create(null);
		} catch (Exception e) {
			result.setStatus("Failure");
			result.setMessage(e.getMessage());
		}
		return result;
	}

	@RequestMapping(value = "/endBusinessDay", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody ReturnMessageDTO endBusinessDay(HttpServletRequest request, HttpServletResponse response) {
		ReturnMessageDTO result = new ReturnMessageDTO();
		result.setStatus("Success");
		result.setMessage("Business Day Closed..");
		try {
			checkActiveEntities(false);
			dailyTransactionService.update(null, null);
		} catch (Exception e) {
			result.setStatus("Failure");
			result.setMessage(e.getMessage());
		}
		return result;
	}

	private void checkActiveEntities(boolean isBOD) {
		if (isBOD) {
			List<DailyTransaction> activeDay = dailyTransactionService.getActiveEntity();
			if (activeDay != null && !activeDay.isEmpty()) {
				throw new RuntimeException("Day is already Active....");
			}
		}
		List<Tables> activeTables = tablesService.getAll().stream().filter(b -> b.getIsActive())
				.collect(Collectors.toList());
		List<Bill> activeBills = billService.getActiveEntity();

		if (activeBills != null && !activeBills.isEmpty()) {
			throw new RuntimeException("Bills are Active....");
		}
		if (activeTables != null && !activeTables.isEmpty()) {
			throw new RuntimeException("Tables are Active....");
		}
	}
}
