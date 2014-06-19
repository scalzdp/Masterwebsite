package com.bip.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bip.Service.RealActionService;

@Controller
public class ActiveController {

	@Autowired
	private RealActionService actionService;
	
	@RequestMapping(value="Index",method=RequestMethod.GET)
	private String getDisplayPage(Model model){
		int page=0,rows=4;
		String city="³É¶¼";
		model.addAttribute("realActions",actionService.getActionVO(page, rows,city));
		return "index";
	}
}
