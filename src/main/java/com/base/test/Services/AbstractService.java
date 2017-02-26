package com.base.test.Services;

import java.util.List;

import javax.transaction.Transactional;

import com.base.test.DAO.DaoInterface;

@Transactional
public abstract class AbstractService<T> implements ServiceInterface<T> {

	public abstract DaoInterface<T> getEntityDAO();

	@Override
	public List<T> getAll() {
		return getEntityDAO().findAll();
	}

	@Override
	public T findByID(Long id) {
		return (T) getEntityDAO().findByID(id);
	}

	@Override
	public void create(T entity) {
		getEntityDAO().persist(entity);
	}

	@Override
	public T delete(Long id) {
		T table = findByID(id);
		if (table == null) {
			return null;
		}
		getEntityDAO().delete(table);
		return table;
	}

	@Override
	public T update(Long id, T entity) {
		getEntityDAO().update(entity);
		return findByID(id);
	}

}
