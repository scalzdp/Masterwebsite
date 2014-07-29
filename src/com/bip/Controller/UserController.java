package com.bip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

	@RequestMapping(value="clogin",method=RequestMethod.GET)
	private String getLogin(Model model){
		return "customer/clogin";
	}
	
	@RequestMapping(value="clogin",method=RequestMethod.POST)
	private String postLogin(Model model){
		return "";
	}
	
	@RequestMapping(value="register",method=RequestMethod.GET)
	private String getRegister(Model model){
		return "customer/register";
	}
	
	@RequestMapping(value="register",method=RequestMethod.POST)
	private String postRegister(Model model){
		return "";
	}
}
