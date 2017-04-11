package com.base.test;

import org.springframework.stereotype.Component;

import com.base.test.DTO.SearchDTO;
import com.base.test.controller.SearchController;
import com.base.test.model.Bill;

@Component
public class Test {

	public static void main(String[] args) throws Exception {
		SearchController s = new SearchController();

		SearchDTO searchCriteria = s.getSearchCriteria("Bill", null, null);
		System.out.println(searchCriteria);

		Bill bill = new Bill();

		System.out.println(bill.getDiscount());

	}

}
