package com.base.test.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractDao<T> implements DaoInterface<T> {

	@Autowired
	private SessionFactory sessionFactory;

	abstract public String getEntityName();

	abstract public Class getEntityClass();

	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public long persist(T entity) {
		return (long) getSession().save(entity);
	}

	@Override
	public void update(T entity) {
		getSession().update(entity);
	}

	@Override
	@SuppressWarnings("unchecked")
	public T findByID(Long id) {
		T T = (T) getSession().get(getEntityClass(), id);
		return T;
	}

	@Override
	public void delete(T entity) {
		getSession().delete(entity);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		List<T> Ts = (List<T>) getSession().createQuery("from " + getEntityName()).list();
		return Ts;
	}

	@Override
	public void deleteAll() {
		List<T> entityList = findAll();
		for (T entity : entityList) {
			delete(entity);
		}
	}

}