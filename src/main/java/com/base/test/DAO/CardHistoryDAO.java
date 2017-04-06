package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.CardHistory;


@Repository("CardHistoryDAO")
public class CardHistoryDAO extends AbstractDao<CardHistory>{
	@Override
	public String getEntityName() {
		return "CardHistory";
	}
	
	@Override
	public Class getEntityClass() {
		return CardHistory.class;
	}
}
