package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.base.test.DAO.DailyTransactionDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.model.DailyTransaction;

@Service("dailyTransactionService")
public class DailyTransactionService extends AbstractService<DailyTransaction>{
	@Autowired
	private DailyTransactionDAO dailyTransactionDAO;
	
	@Override
	public DaoInterface<DailyTransaction> getEntityDAO() {
		// TODO Auto-generated method stub
		return dailyTransactionDAO;
	}
}
