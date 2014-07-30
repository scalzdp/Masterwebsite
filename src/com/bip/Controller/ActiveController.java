package com.bip.Controller;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bip.Service.RealActionService;
import com.bip.source.ResourceMessage;
import com.bip.utils.JsonStrHandler;
import com.bip.vo.UserVO;

@Controller
public class ActiveController {

	@Autowired
	private RealActionService actionService;
	
	@RequestMapping(value="Index",method=RequestMethod.GET)
	private String getDisplayPage(Model model,HttpSession session){
		Object obj =  session.getAttribute(ResourceMessage.CUSTOMERSESSION);
		if(obj!=null){
			UserVO vo =(UserVO) obj;
			model.addAttribute("costomer_session_key", vo);
		}
		return "index";
	}
	
	@RequestMapping(value="getMessage",method=RequestMethod.POST)
	public String getMessage(Model model,HttpServletRequest request){
		int page=0,rows=4,currentMaxID=0,slidingDirection=0;
		page = Integer.parseInt(request.getParameter("pages"));
		rows = Integer.parseInt(request.getParameter("rows"));
		currentMaxID = Integer.parseInt(request.getParameter("currentMax"));
		slidingDirection = Integer.parseInt(request.getParameter("SlidingDirection"));
		String city="³É¶¼";
		String jsonData =JsonStrHandler.convertObjectToJson(actionService.getActionVO(page, rows,city,currentMaxID,slidingDirection));
		request.setAttribute("jsonData", jsonData);
		return "json";
	}
	
	@RequestMapping(value="Details/{id}",method=RequestMethod.GET)
	private String getMessageDetails(Model model,@PathVariable Long id){
		System.out.println(id);
		//TODO:show message
		return "messageDetails";
	}
	
}
