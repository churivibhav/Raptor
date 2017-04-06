package com.base.test.Services;

import java.lang.reflect.Method;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.DaoInterface;
import com.base.test.DTO.CriteriaDTO;
import com.base.test.DTO.RestrictionsDTO;

@Service("searchService")
public class SearchService extends AbstractService<CriteriaDTO> {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public DaoInterface<CriteriaDTO> getEntityDAO() {
		return null;
	}

	@Transactional
	@Override
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
		case "EQUAL":
			criteria.add(Restrictions.eq(restriction.getColumn(), restriction.getData1()));
			break;
		case "BETWEEN":
			criteria.add(
					Restrictions.between(restriction.getColumn(), restriction.getData1(), restriction.getData2()));
			break;

		default:
			break;
		}
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

}