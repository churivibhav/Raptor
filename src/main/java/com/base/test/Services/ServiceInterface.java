package com.base.test.Services;

import java.util.List;

public interface ServiceInterface<T> {

	public List<T> getAll();

	public T findByID(Long id);

	public void create(T entity);

	public T delete(Long id);

	public T update(Long id, T entity);

	public default T getByName(String userName) {
		return null;
	}

	public default T getByTableNumber(String tableNumber) {
		return null;
	}

}
