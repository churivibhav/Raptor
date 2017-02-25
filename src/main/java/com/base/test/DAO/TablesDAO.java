package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Tables;

@Repository("tablesDAO")
public class TablesDAO extends AbstractDao<Tables> {

	@Override
	public String getEntityName() {
		return "Tables";
	}

}
