package com.base.test.Services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.MenuDAO;
import com.base.test.DAO.MenuSubTypeDAO;
import com.base.test.DAO.TaxDetailDAO;
import com.base.test.model.Menu;
import com.base.test.model.MenuSubType;
import com.base.test.model.TaxDetail;

@Service("utilityService")
public class UtilityService {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private TaxDetailDAO taxDetailDAO;

	@Autowired
	private MenuSubTypeDAO menuSubTypeDAO;

	@Autowired
	private MenuDAO menuDAO;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public Map<String, Map<String, List<Menu>>> getDisplayMenu() {
		Map<String, Map<String, List<Menu>>> result = new HashMap<>();
		List<TaxDetail> taxType = taxDetailDAO.findAll();
		for (TaxDetail type : taxType) {
			List<MenuSubType> menuSubType = menuSubTypeDAO.findAll().stream()
					.filter(b -> b.getTaxType().equals(type.getId())).collect(Collectors.toList());
			Map<String, List<Menu>> subTypeMenu = new HashMap<>();
			for (MenuSubType subType : menuSubType) {
				List<Menu> menus = menuDAO.findAll().stream()
						.filter(b -> (b.getTaxType().equals(type.getId()) && b.getSubType().equals(subType.getId())))
						.collect(Collectors.toList());
				subTypeMenu.put(subType.getName(), menus);
			}
			result.put(type.getItemType(), subTypeMenu);
		}
		return result;
	}
}
