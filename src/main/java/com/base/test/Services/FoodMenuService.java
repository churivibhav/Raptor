package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.FoodMenuDAO;
import com.base.test.model.FoodMenu;

@Service("foodMenuService")
public class FoodMenuService extends AbstractService<FoodMenu> {

	@Autowired
	private FoodMenuDAO foodMenuDAO;

	@Override
	public DaoInterface<FoodMenu> getEntityDAO() {
		// TODO Auto-generated method stub
		return foodMenuDAO;
	}

}
