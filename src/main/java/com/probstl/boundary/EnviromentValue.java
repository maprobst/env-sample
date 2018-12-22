package com.probstl.boundary;

import java.util.Properties;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/env")
public class EnviromentValue {

	@GET
	@Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
	public JsonArray allEnv() {

		JsonBuilderFactory factory = Json.createBuilderFactory(null);
		JsonArrayBuilder arrayBuilder = factory.createArrayBuilder();

		System.getenv().forEach((key, valueMap) -> arrayBuilder
				.add(factory.createObjectBuilder().add("Key", key).add("Value", valueMap)));
		Properties props = System.getProperties();
		props.forEach((key, valueMap) -> arrayBuilder
				.add(factory.createObjectBuilder().add("Key", String.valueOf(key)).add("Value", String.valueOf(valueMap))));

		return arrayBuilder.build();

	}

}
