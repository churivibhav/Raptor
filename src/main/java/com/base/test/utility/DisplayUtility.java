package com.base.test.utility;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class DisplayUtility {

	private static Map<String, String> displayNames = new HashMap<>();

	static {
		displayNames.put("id", "ID");
		displayNames.put("tableNumber", "Table Number");
		displayNames.put("amount", "Bill Amount");
		displayNames.put("taxAmount", "TAX Amount");
		displayNames.put("charges", "Charges Amount");
		displayNames.put("totalAmount", "Total Amount");
		displayNames.put("isActive", "Is Active");
		displayNames.put("waiterID", "Waiter ID");
		displayNames.put("creationDate", "Creation Date");
		displayNames.put("modificationDate", "Modification Date");
	}

	public static String getDisplayName(String name) {
		return Optional.ofNullable(displayNames.get(name)).orElse(name);
	}
}
