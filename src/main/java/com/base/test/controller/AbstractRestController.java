package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.User;

public abstract class AbstractRestController<T> implements RestControllerInterface<T> {

	@Autowired
	private ServiceInterface<User> userService;

	public abstract ServiceInterface<T> getEntityService();

	@Override
	@GetMapping("/getAll")
	public ResponseEntity getEntity(HttpServletRequest request) {
		String userName = checkUser(request);
		if (userName == null) {
			return new ResponseEntity("User is not loged in ", HttpStatus.UNAUTHORIZED);
		}
		return new ResponseEntity(getEntityService().getAll(), HttpStatus.OK);
	}

	@Override
	@GetMapping("/get/{id}")
	public ResponseEntity getEntityByID(@PathVariable("id") Long id, HttpServletRequest request) {
		String userName = checkUser(request);
		if (userName == null) {
			return new ResponseEntity("User is not loged in ", HttpStatus.UNAUTHORIZED);
		}
		T table = getEntityService().findByID(id);
		if (table == null) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(table, HttpStatus.OK);
	}

	@Override
	@PostMapping(value = "/create")
	public ResponseEntity createEntity(@RequestBody T tables, HttpServletRequest request) {
		String userName = checkUser(request);
		if (userName == null) {
			return new ResponseEntity("User is not loged in ", HttpStatus.UNAUTHORIZED);
		}
		getEntityService().create(tables);
		return new ResponseEntity(tables, HttpStatus.OK);
	}

	@Override
	@DeleteMapping("/delete/{id}")
	public ResponseEntity deleteEntity(@PathVariable Long id, HttpServletRequest request) {
		String userName = checkUser(request);
		if (userName == null) {
			return new ResponseEntity("User is not loged in ", HttpStatus.UNAUTHORIZED);
		}
		if (null == getEntityService().delete(id)) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(id, HttpStatus.OK);
	}

	@Override
	@PutMapping("/update/{id}")
	public ResponseEntity updateEntity(@PathVariable Long id, @RequestBody T tables, HttpServletRequest request) {
		String userName = checkUser(request);
		if (userName == null) {
			return new ResponseEntity("User is not loged in ", HttpStatus.UNAUTHORIZED);
		}
		tables = getEntityService().update(id, tables);
		if (null == tables) {
			return new ResponseEntity("No Entity found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(tables, HttpStatus.OK);
	}

	public String checkUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("UserName");
		if (userName == null)
			return null;
		User user = userService.getByName(userName);
		return user != null ? user.getUserName() : null;
	}
}
