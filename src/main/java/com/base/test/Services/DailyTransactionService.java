package com.base.test.Services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DailyTransactionDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.enums.TransactionType;
import com.base.test.model.Cards;
import com.base.test.model.DailyTransaction;

@Service("dailyTransactionService")
public class DailyTransactionService extends AbstractService<DailyTransaction> {
	@Autowired
	private DailyTransactionDAO dailyTransactionDAO;

	@Autowired
	ServiceInterface<Cards> cardService;

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public DaoInterface<DailyTransaction> getEntityDAO() {
		return dailyTransactionDAO;
	}

	@Override
	@Transactional
	public long create(DailyTransaction entity) {
		if (entity != null)
			return super.create(entity);
		else {
			DailyTransaction startDay = new DailyTransaction();
			startDay.setBusinessDay(new Date());
			startDay.setIsActive(true);
			return super.create(startDay);
		}
	}

	@Override
	public List<DailyTransaction> getActiveEntity() {
		List<DailyTransaction> list = new ArrayList<>();
		if (dailyTransactionDAO.getActiveDay() != null) {
			list.add(dailyTransactionDAO.getActiveDay());
		}
		return list;
	}

	@Override
	@Transactional
	public DailyTransaction update(Long id, DailyTransaction entity) {
		cleanCardBalance();
		if (entity != null)
			return super.update(id, entity);
		else {
			DailyTransaction endDay = getActiveEntity().get(0);
			endDay.setEndTime(new Date());
			endDay.setIsActive(false);
			calulateReport(endDay);
			super.update(endDay.getId(), endDay);
			return null;
		}
	}

	private void cleanCardBalance() {
		List<Cards> list = cardService.getActiveEntity();
		for (Cards card : list) {
			Double bal_old = card.getBalance();
			card.setBalance(0.0);
			card = cardService.update(card.getId(), card);
			/**
			 * Add to history.
			 */
			cardService.addToCardHistory(card, card.getBalance() - bal_old, card.getBalance(), TransactionType.CLEAN);
		}
	}

	private void calulateReport(DailyTransaction endDay) {
		/*
		 * calculate report by using getSession() and save report file in
		 * DailyTransaction.
		 */
	}
}
