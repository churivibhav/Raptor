package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.UserDAO;
import com.base.test.model.User;

@Service("userService")
public class UserService extends AbstractService<User> {

	@Autowired
	private UserDAO userDAO;

	@Override
	public DaoInterface<User> getEntityDAO() {
		// TODO Auto-generated method stub
		return userDAO;
	}
	
	public User getByName(String userName){
		return userDAO.getByName(userName);
	}

}
