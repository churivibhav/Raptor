package com.base.test.serializer;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.BarMenu;
import com.base.test.model.FoodMenu;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

@Component
public class OrderItemSerializer extends JsonSerializer<String> {

	@Autowired
	ServiceInterface<BarMenu> barMenuService;

	@Autowired
	ServiceInterface<FoodMenu> foodMenuService;

	@Override
	public void serialize(String orderItemID, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		String[] s = orderItemID.split("-");
		long id = Long.parseLong(s[1]);
		String itemName = "Other Order Item";
		if(s[0].equals("F")){
			FoodMenu foodMenu = foodMenuService.findByID(id);
			if (foodMenu != null) {
				itemName = foodMenu.getItemName();
			}
		}else{
			BarMenu barMenu = barMenuService.findByID(id);
			if (barMenu != null) {
				itemName =barMenu.getItemName();
			}
		}
		gen.writeString(itemName);
	}
}
