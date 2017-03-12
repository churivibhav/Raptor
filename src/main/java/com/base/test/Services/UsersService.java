package com.base.test.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.UsersDAO;
import com.base.test.model.Users;

@Service("userService")
public class UsersService extends AbstractService<Users> {

	@Autowired
	private UsersDAO userDAO;

	@Override
	public DaoInterface<Users> getEntityDAO() {
		// TODO Auto-generated method stub
		return userDAO;
	}
	
	public Users getByName(String userName){
		return userDAO.getByName(userName);
	}

}
