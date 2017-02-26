package com.base.test.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.base.test.Services.ServiceInterface;

public abstract class AbstractRestController<T> {

	public abstract ServiceInterface<T> getEntityService();

	public List<T> getEntity() {
		return getEntityService().getAll();
	}

	public ResponseEntity getEntityByID(Long id) {
		T table = getEntityService().findByID(id);
		if (table == null) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(table, HttpStatus.OK);
	}

	public ResponseEntity createEntity(T tables) {
		getEntityService().create(tables);
		return new ResponseEntity(tables, HttpStatus.OK);
	}

	public ResponseEntity deleteEntity(Long id) {
		if (null == getEntityService().delete(id)) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(id, HttpStatus.OK);
	}

	public ResponseEntity updateEntity(Long id, T tables) {
		tables = getEntityService().update(id, tables);
		if (null == tables) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(tables, HttpStatus.OK);
	}

}
