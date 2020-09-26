package com.eval.coronakit.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		System.out.println("Authentication is "+auth.getName());
		
		if(!(auth instanceof AnonymousAuthenticationToken)&& auth.isAuthenticated())
			return "main-menu";
		
		else
		return "index";
	}
	
	@RequestMapping("/home")
	public String home() {
		return  "main-menu";
	}
	

	
}
