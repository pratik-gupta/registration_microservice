package com.pratik.ms.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.pratik.ms.model.Employee;

@RestController
@RequestMapping(value="/registration")
public class RegistrationController {

	@RequestMapping(value="/test")
	public String Test() 
	{
		return "Test";
	}
	
	@RequestMapping(value="/register-employee", method = RequestMethod.POST, consumes="application/json", produces="application/json")
	public @ResponseBody String register(@RequestBody Employee employee) {
		
		System.out.println("Employee: " + employee);
		return "registration success, please login";
	}
}
