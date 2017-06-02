package com.base.test.serializer;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Menu;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

@Component
public class OrderItemSerializer extends JsonSerializer<Long> {

	@Autowired
	ServiceInterface<Menu> menuService;

	@Override
	public void serialize(Long orderItemID, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		Menu menu = menuService.findByID(orderItemID);
		if (menu != null)
			gen.writeString(menu.getName());
		else
			gen.writeString("No Menu");
	}
}
