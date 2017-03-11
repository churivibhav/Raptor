package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Users;

@Repository("usersDAO")
public class UsersDAO extends AbstractDao<Users> {

	@Override
	public String getEntityName() {
		return "Users";
	}

	@Override
	public Class getEntityClass() {
		return Users.class;
	}

	public Users getByName(String userName) {
		return (Users) getSession().createQuery("from " + getEntityName() + " where userName = '" + userName + "'")
				.uniqueResult();
	}

}
