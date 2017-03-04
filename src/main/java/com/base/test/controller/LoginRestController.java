package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.User;

@RestController
@Configurable
public class LoginRestController {

	@Autowired
	private ServiceInterface<User> userService;

	@PostMapping(value = "/login")
	public ResponseEntity logIn(@RequestBody User person, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = userService.getByName(person.getUserName());
		if (user != null && user.getPassword().equals(person.getPassword())) {
			session.setAttribute("UserName", person.getUserName());
			person.setPassword("");
			return new ResponseEntity(person, HttpStatus.OK);
		}
		return new ResponseEntity("No User found for userName " + person.getUserName(), HttpStatus.NOT_FOUND);
	}

	@PostMapping(value = "/logout")
	public ResponseEntity logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("UserName", "");
		return new ResponseEntity(HttpStatus.OK);
	}
}
