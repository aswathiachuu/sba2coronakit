package com.eval.coronakit.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Scope("session")
public class LoginController {

	
	@RequestMapping("/custom-login")
	public String login() {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		System.out.println("Authentication is "+auth.getName());
		
		if(!(auth instanceof AnonymousAuthenticationToken)&& auth.isAuthenticated())
			return "main-menu";
		
		else
		return "login-form";
	}
	
	@RequestMapping("/custom-error")
	public String error() {
		return "error-page";
	}
	
	
}
