package com.base.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Waiter;

@RestController
public class WaiterRestController extends AbstractRestController<Waiter> {

	@Autowired
	private ServiceInterface<Waiter> waiterService;

	@Override
	public ServiceInterface<Waiter> getEntityService() {
		return waiterService;
	}

	@Override
	@GetMapping("/waiterAll")
	public List<Waiter> getEntity() {
		return super.getEntity();
	}

	@Override
	@GetMapping("/waiter/{id}")
	public ResponseEntity getEntityByID(@PathVariable("id") Long id) {
		return super.getEntityByID(id);
	}

	@Override
	@PostMapping(value = "/waiter")
	public ResponseEntity createEntity(@RequestBody Waiter waiter) {
		return super.createEntity(waiter);
	}

	@Override
	@DeleteMapping("/waiter/{id}")
	public ResponseEntity deleteEntity(@PathVariable Long id) {
		return super.deleteEntity(id);
	}

	@Override
	@PutMapping("/waiter/{id}")
	public ResponseEntity updateEntity(@PathVariable Long id, @RequestBody Waiter waiter) {
		return super.updateEntity(id, waiter);
	}
}
