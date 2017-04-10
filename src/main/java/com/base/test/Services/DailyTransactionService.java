package com.base.test.Services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.CardsDAO;
import com.base.test.DAO.DailyTransactionDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.model.Cards;
import com.base.test.model.DailyTransaction;

@Service("dailyTransactionService")
public class DailyTransactionService extends AbstractService<DailyTransaction> {
	@Autowired
	private DailyTransactionDAO dailyTransactionDAO;

	@Autowired
	private CardsDAO cardsDAO;

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
	public void create(DailyTransaction entity) {
		if (entity != null)
			super.create(entity);
		else {
			DailyTransaction startDay = new DailyTransaction();
			startDay.setBusinessDay(new Date());
			startDay.setIsActive(true);
			super.create(startDay);
		}
	}

	@Override
	public List<DailyTransaction> getActiveEntity() {
		List<DailyTransaction> list = new ArrayList<>();
		list.add(dailyTransactionDAO.getActiveDay());
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
		List<Cards> list = cardsDAO.findAll().stream().filter(b -> b.getBalance() > 0).collect(Collectors.toList());
		for (Cards cards : list) {
			cards.setBalance(0);
			cardsDAO.update(cards);
			// add cardsHistory.create() with type clean.
		}

	}

	private void calulateReport(DailyTransaction endDay) {

	}
}
