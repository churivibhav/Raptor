package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.User;

@Repository("userDAO")
public class UserDAO extends AbstractDao<User> {

	@Override
	public String getEntityName() {
		return "User";
	}

	@Override
	public Class getEntityClass() {
		return User.class;
	}

	public User getByName(String userName) {
		return (User) getSession().createQuery("from " + getEntityName() + " where userName = '" + userName + "'")
				.uniqueResult();
	}

}
