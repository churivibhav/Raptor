package com.base.test.Services;

import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DTO.ColumnInfoDTO;
import com.base.test.DTO.CriteriaDTO;
import com.base.test.DTO.ReportsDTO;
import com.base.test.DTO.RestrictionsDTO;
import com.base.test.serializer.LocalDateSerializer;

@Service("searchService")
public class SearchService {

	public static final String IS_NOT_NULL = "Is Not Null";
	public static final String IS_NULL = "Is Null";
	public static final String LESS_THAN = "Less Than";
	public static final String LESS_THAN_EQUAL = "Less Than Equal";
	public static final String GREATER_THAN = "Greater Than";
	public static final String GREATER_THAN_EQUAL = "Greater Than Equal";
	public static final String IS_NOT_EMPTY = "Is Not Empty";
	public static final String IS_EMPTY = "Is Empty";
	public static final String LIKE = "Like";
	public static final String BETWEEN = "Between";
	public static final String EQUAL = "EQUAL";

	public static void addCriteriaOperations(Map<String, String> operations) {
		operations.put(SearchService.BETWEEN, SearchService.BETWEEN);
		operations.put(SearchService.EQUAL, SearchService.EQUAL);
		operations.put(SearchService.GREATER_THAN, SearchService.GREATER_THAN);
		operations.put(SearchService.GREATER_THAN_EQUAL, SearchService.GREATER_THAN_EQUAL);
		operations.put(SearchService.LESS_THAN, SearchService.LESS_THAN);
		operations.put(SearchService.LESS_THAN_EQUAL, SearchService.LESS_THAN_EQUAL);
		operations.put(SearchService.IS_EMPTY, SearchService.IS_EMPTY);
		operations.put(SearchService.IS_NOT_EMPTY, SearchService.IS_NOT_EMPTY);
		operations.put(SearchService.LIKE, SearchService.LIKE);
		operations.put(SearchService.IS_NULL, SearchService.IS_NULL);
		operations.put(SearchService.IS_NOT_NULL, SearchService.IS_NOT_NULL);
	}

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public List getByCriteria(Class searchClass, CriteriaDTO criteriaDTO) {
		Criteria criteria = getSession().createCriteria(searchClass);
		for (RestrictionsDTO restriction : criteriaDTO.getRestrictions()) {
			addRestriction(criteria, restriction);
		}
		List list = criteria.list();
		for (Object bill : list) {
			lazyLoadToEgar(bill);
		}
		return list;
	}

	private void addRestriction(Criteria criteria, RestrictionsDTO restriction) {
		switch (restriction.getOperation()) {
		case EQUAL:
			criteria.add(Restrictions.eq(restriction.getColumn(),
					getDataObject(restriction.getData1(), restriction.getColumnDataType())));
			break;
		case BETWEEN:
			criteria.add(Restrictions.between(restriction.getColumn(),
					getDataObject(restriction.getData1(), restriction.getColumnDataType()),
					getDataObject(restriction.getData2(), restriction.getColumnDataType())));
			break;
		case LIKE:
			criteria.add(Restrictions.like(restriction.getColumn(),
					getDataObject(restriction.getData1(), restriction.getColumnDataType())));
			break;
		case IS_EMPTY:
			criteria.add(Restrictions.isEmpty(restriction.getColumn()));
			break;
		case IS_NOT_EMPTY:
			criteria.add(Restrictions.isNotEmpty(restriction.getColumn()));
			break;
		case GREATER_THAN_EQUAL:
			criteria.add(Restrictions.ge(restriction.getColumn(),
					getDataObject(restriction.getData1(), restriction.getColumnDataType())));
			break;
		case GREATER_THAN:
			criteria.add(Restrictions.gt(restriction.getColumn(),
					getDataObject(restriction.getData1(), restriction.getColumnDataType())));
			break;
		case LESS_THAN_EQUAL:
			criteria.add(Restrictions.le(restriction.getColumn(),
					getDataObject(restriction.getData1(), restriction.getColumnDataType())));
			break;
		case LESS_THAN:
			criteria.add(Restrictions.lt(restriction.getColumn(),
					getDataObject(restriction.getData1(), restriction.getColumnDataType())));
			break;
		case IS_NULL:
			criteria.add(Restrictions.isNull(restriction.getColumn()));
			break;
		case IS_NOT_NULL:
			criteria.add(Restrictions.isNotNull(restriction.getColumn()));
			break;

		default:
			break;
		}
	}

	private Object getDataObject(String data, String dataType) {
		try {
			switch (dataType) {
			case "long":
				return Long.parseLong(data);
			case "java.lang.String":
				return data;
			case "double":
				return Double.parseDouble(data);
			case "int":
				return Integer.parseInt(data);
			case "java.util.Date":
				return LocalDateSerializer.DATE_PICKER_DATE_FORMAT.parse(data);
			default:
				break;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return data;
	}

	private void lazyLoadToEgar(Object obj) {
		Method[] methods = obj.getClass().getMethods();
		for (Method m : methods) {
			if (m.getName().startsWith("get")) {
				try {
					Object data = m.invoke(obj);
					if (data instanceof List) {
						((List) data).size();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Transactional
	public ReportsDTO fireReport(String query, String columns) {
		ReportsDTO result = new ReportsDTO();
		result.setColumns(getColumnListFromString(columns));

		SQLQuery sqlQuery = getSession().createSQLQuery(query);
		List<Object[]> rows = sqlQuery.list();
		List<List<String>> data = new ArrayList<>();
		for (Object[] row : rows) {
			List<String> rowData = new ArrayList<>();
			for (int i = 0; i < row.length; i++) {
				rowData.add(row[i].toString());
			}
			data.add(rowData);
		}
		result.setData(data);
		return result;
	}

	private List<ColumnInfoDTO> getColumnListFromString(String columns) {
		ArrayList<ColumnInfoDTO> res = new ArrayList<>();
		String[] data1 = columns.split(";");
		for (int i = 0; i < data1.length; i++) {
			String[] data2 = data1[i].split(",");
			ColumnInfoDTO cid = new ColumnInfoDTO(null, data2[0], data2[1]);
			res.add(cid);
		}
		return res;
	}
}