package com.base.test.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractDao<T> {

	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public long persist(T entity) {
		return (long) getSession().save(entity);
	}

	public void update(T entity) {
		getSession().update(entity);
	}

	public T findByID(Long id) {
		@SuppressWarnings("unchecked")
		T T = (T) getSession().get(getEntityClass(), id);
		return T;
	}

	abstract public String getEntityName();
	abstract public Class getEntityClass();

	public void delete(T entity) {
		getSession().delete(entity);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		List<T> Ts = (List<T>) getSession().createQuery("from " + getEntityName()).list();
		return Ts;
	}

	public void deleteAll() {
		List<T> entityList = findAll();
		for (T entity : entityList) {
			delete(entity);
		}
	}


}