package com.base.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.base.test.DTO.SearchDTO;
import com.base.test.controller.SearchController;

@Component
public class Test {

	public static void main(String[] args) throws Exception {
		SearchController s = new SearchController();

		SearchDTO searchCriteria = s.getSearchCriteria("Bill", null, null);
		System.out.println(searchCriteria);

	}

}
