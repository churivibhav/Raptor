package com.base.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.TablesService;
import com.base.test.model.Tables;

@RestController
public class TablesRestController {

	@Autowired
	private TablesService tablesService;

	@GetMapping("/tablesAll")
	public List getTables() {
		return tablesService.getAll();
	}

	@GetMapping("/tables/{id}")
	public ResponseEntity getTablesByID(@PathVariable("id") Long id) {
		Tables table = tablesService.findByID(id);
		if (table == null) {
			return new ResponseEntity("No Tables found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(table, HttpStatus.OK);
	}

	@PostMapping(value = "/tables")
	public ResponseEntity createTables(@RequestBody Tables tables) {
		tablesService.create(tables);
		return new ResponseEntity(tables, HttpStatus.OK);
	}

	@DeleteMapping("/tables/{id}")
	public ResponseEntity deleteTables(@PathVariable Long id) {
		if (null == tablesService.delete(id)) {
			return new ResponseEntity("No Tables found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(id, HttpStatus.OK);
	}

	@PutMapping("/tables/{id}")
	public ResponseEntity updateTables(@PathVariable Long id, @RequestBody Tables tables) {
		tables = tablesService.update(id, tables);
		if (null == tables) {
			return new ResponseEntity("No Tables found for ID " + id, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(tables, HttpStatus.OK);
	}
}
