package com.base.test.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.base.test.DAO.TablesDAO;
import com.base.test.model.Tables;

public class TablesService {

	@Autowired
	private TablesDAO tablesDAO;

	public List<Tables> getAll() {
		return tablesDAO.findAll();
	}

	public Tables findByID(Long id) {
		return tablesDAO.findByID(id);
	}

	public void create(Tables tables) {
		tablesDAO.persist(tables);
	}

	public Tables delete(Long id) {
		Tables table = findByID(id);
		if (table == null) {
			return null;
		}
		tablesDAO.delete(table);
		return table;
	}

	public Tables update(Long id, Tables tables) {
		tablesDAO.update(tables);
		return findByID(id);
	}

}
