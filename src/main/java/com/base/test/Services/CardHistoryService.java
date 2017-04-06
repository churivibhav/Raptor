package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.CardHistoryDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.model.CardHistory;

@Service("cardHistoryService")
public class CardHistoryService extends AbstractService<CardHistory>{
	@Autowired
	private CardHistoryDAO cardHistoryDAO;
	
	@Override
	public DaoInterface<CardHistory> getEntityDAO() {
		// TODO Auto-generated method stub
		return cardHistoryDAO;
	}
}
