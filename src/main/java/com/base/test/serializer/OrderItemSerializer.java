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
public class OrderItemSerializer extends JsonSerializer<Long> {

	@Autowired
	ServiceInterface<BarMenu> barMenuService;

	@Autowired
	ServiceInterface<FoodMenu> foodMenuService;

	@Override
	public void serialize(Long orderItemID, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		FoodMenu foodMenu = foodMenuService.findByID(orderItemID);
		if (foodMenu != null) {
			gen.writeString(foodMenu.getItemName());
		} else {
			BarMenu barMenu = barMenuService.findByID(orderItemID);
			if (barMenu != null) {
				gen.writeString(barMenu.getItemName());
			} else
				gen.writeString("Other Order Item");
		}
	}
}
