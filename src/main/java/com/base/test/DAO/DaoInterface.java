package com.base.test.DAO;

import java.util.List;

import org.hibernate.Session;

public interface DaoInterface<T> {
	public Session getSession();

	public long persist(T entity);

	public void update(T entity);

	public T findByID(Long id);

	public void delete(T entity);

	public List<T> findAll();

	public void deleteAll();
}
