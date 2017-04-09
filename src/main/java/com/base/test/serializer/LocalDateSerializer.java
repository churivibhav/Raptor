package com.base.test.serializer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

@Component
public class LocalDateSerializer extends JsonSerializer<Date> {
	public static final SimpleDateFormat DISPLAY_DATE_FORMAT = new SimpleDateFormat("dd-MMM-yyyy");

	@Override
	public void serialize(Date date, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		String formattedDate = DISPLAY_DATE_FORMAT.format(date);
		gen.writeString(formattedDate);
	}
}
