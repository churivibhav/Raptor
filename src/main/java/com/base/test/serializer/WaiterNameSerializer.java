package com.base.test.serializer;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Waiter;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

@Component
public class WaiterNameSerializer extends JsonSerializer<Long> {

	@Autowired
	ServiceInterface<Waiter> waiterService;

	@Override
	public void serialize(Long waiterID, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		Waiter waiter = waiterService.findByID(waiterID);
		if (waiter != null)
			gen.writeString(waiter.getFirstName());
		else
			gen.writeString("No Waiter");
	}
}
