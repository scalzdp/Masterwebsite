package com.bip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	@RequestMapping(value="testMagnifier",method=RequestMethod.GET)
	private String getMagnifier(Model model){
		return "testMagnifier";
	}
	
	@RequestMapping(value="testCitySelect",method=RequestMethod.GET)
	private String getCitySelect(Model model){
		return "testCitySelect";
	}
}
