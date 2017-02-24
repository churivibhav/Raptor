package com.base.test.DAO;

import com.base.test.model.Tables;

public class TablesDAO extends AbstractDao<Tables> {

	@Override
	public Class getEntityName() {
		return Tables.class;
	}

}
