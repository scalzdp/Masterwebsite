package com.bip.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bip.Service.RealActionService;
import com.bip.utils.JsonStrHandler;

@Controller
public class ActiveController {

	@Autowired
	private RealActionService actionService;
	
	@RequestMapping(value="Index",method=RequestMethod.GET)
	private String getDisplayPage(Model model){
		
		return "index";
	}
	
	@RequestMapping(value="getMessage",method=RequestMethod.POST)
	public String getMessage(Model model,HttpServletRequest request){
		int page=0,rows=4;
		page = Integer.parseInt(request.getParameter("pages"));
		rows = Integer.parseInt(request.getParameter("rows"));
		String city="�ɶ�";
		String jsonData =JsonStrHandler.convertObjectToJson(actionService.getActionVO(page, rows,city));
		request.setAttribute("jsonData", jsonData);
		return "json";
	}
}