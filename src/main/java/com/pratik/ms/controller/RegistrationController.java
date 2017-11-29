package com.pratik.ms.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pratik.ms.model.Employee;

@RestController
@RequestMapping(value="/register")
public class RegistrationController {

	@RequestMapping(value="/test")
	public String Test() 
	{
		return "Test";
	}
	
	public String register(@RequestBody Employee employee) {
		
		return "registration success";
	}
}
