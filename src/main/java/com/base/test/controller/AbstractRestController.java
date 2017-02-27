package com.base.test.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.base.test.Services.ServiceInterface;

public abstract class AbstractRestController<T> implements RestControllerInterface<T> {

	public abstract ServiceInterface<T> getEntityService();

	@GetMapping("/getAll")
	public List<T> getEntity() {
		return getEntityService().getAll();
	}

	@GetMapping("/get/{id}")
	public ResponseEntity getEntityByID(@PathVariable("id") Long id) {
		T table = getEntityService().findByID(id);
		if (table == null) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(table, HttpStatus.OK);
	}

	@PostMapping(value = "/create")
	public ResponseEntity createEntity(@RequestBody T tables) {
		getEntityService().create(tables);
		return new ResponseEntity(tables, HttpStatus.OK);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity deleteEntity(@PathVariable Long id) {
		if (null == getEntityService().delete(id)) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(id, HttpStatus.OK);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity updateEntity(@PathVariable Long id, @RequestBody T tables) {
		tables = getEntityService().update(id, tables);
		if (null == tables) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(tables, HttpStatus.OK);
	}

}
