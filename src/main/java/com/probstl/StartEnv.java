package com.probstl;

import java.util.Properties;

public class StartEnv {

	public static void main(String[] args) {
		StringBuilder builder = new StringBuilder();
		
		
		System.getenv().forEach((key, valueMap) -> builder.append("Key: ").append(key).append(" Value: ").append(valueMap).append("\n"));
		Properties props = System.getProperties();
		props.forEach((key, valueMap) -> builder.append("Key: ").append(String.valueOf(key)).append(" Value: ").append(String.valueOf(valueMap)).append("\n"));
		System.out.println(builder.toString());
	}

}
