package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.CardDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.model.Card;

@Service("cardService")
public class CardService extends AbstractService<Card>{

	@Autowired
	private CardDAO cardDAO;
	
	@Override
	public DaoInterface<Card> getEntityDAO() {
		// TODO Auto-generated method stub
		return cardDAO;
	}
	
	public Card getByName(String userName) {
		return cardDAO.getByName(userName);
	}
}