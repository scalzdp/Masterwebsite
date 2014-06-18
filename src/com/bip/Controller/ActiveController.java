package com.bip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ActiveController {

	@RequestMapping(value="Index",method=RequestMethod.GET)
	private String getDisplayPage(Model model){
		return "index";
	}
}
