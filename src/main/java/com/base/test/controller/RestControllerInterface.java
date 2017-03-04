package com.base.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

public interface RestControllerInterface<T> {
	public ResponseEntity getEntity(HttpServletRequest request);

	public ResponseEntity getEntityByID(Long id, HttpServletRequest request);

	public ResponseEntity createEntity(T tables, HttpServletRequest request);

	public ResponseEntity deleteEntity(Long id, HttpServletRequest request);

	public ResponseEntity updateEntity(Long id, T tables, HttpServletRequest request);
}
