package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.CardsDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.model.Cards;

@Service("cardService")
public class CardService extends AbstractService<Cards>{

	@Autowired
	private CardsDAO cardDAO;
	
	@Override
	public DaoInterface<Cards> getEntityDAO() {
		// TODO Auto-generated method stub
		return cardDAO;
	}
	
	public Cards getByName(String userName) {
		return cardDAO.getByName(userName);
	}
}