package com.base.test.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.base.test.model.Cards;

@Repository("cardsDAO")
public class CardsDAO extends AbstractDao<Cards> {
	@Override
	public String getEntityName() {
		return "Cards";
	}

	@Override
	public Class getEntityClass() {
		return Cards.class;
	}

	public Cards getByName(String cardNumber) {
		return (Cards) getSession().createQuery("from " + getEntityName() + " where cardNumber = '" + cardNumber + "'")
				.uniqueResult();
	}

	public List<Cards> getActiveEntity() {
		return getSession().createQuery("from " + getEntityName() + " where balance > 0").list();
	}
}