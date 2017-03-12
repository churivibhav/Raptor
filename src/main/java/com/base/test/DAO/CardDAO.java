package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Card;

@Repository("cardDAO")
public class CardDAO extends AbstractDao<Card> {
	@Override
	public String getEntityName() {
		return "Card";
	}
	
	@Override
	public Class getEntityClass() {
		return Card.class;
	}
	
	public Card getByName(String cardNumber) {
		return (Card) getSession().createQuery("from " + getEntityName() + " where cardNumber = '" + cardNumber + "'")
				.uniqueResult();
	}
}