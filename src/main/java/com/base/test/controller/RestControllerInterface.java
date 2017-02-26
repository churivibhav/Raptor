package com.base.test.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;

public interface RestControllerInterface<T> {
	public List<T> getEntity();

	public ResponseEntity getEntityByID(Long id);

	public ResponseEntity createEntity(T tables);

	public ResponseEntity deleteEntity(Long id);

	public ResponseEntity updateEntity(Long id, T tables);
}
