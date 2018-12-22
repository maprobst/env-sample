package com.probstl.boundary;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/startup")
public class StartUp {
	
	@Path("/ping")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public JsonObject ping() {
		JsonObjectBuilder factory = Json.createObjectBuilder();
		return factory.add("Value", "ping").build();
	}

}
