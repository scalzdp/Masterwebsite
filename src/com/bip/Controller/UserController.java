package com.bip.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bip.Service.CustomerService;
import com.bip.source.ResourceMessage;
import com.bip.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="clogin",method=RequestMethod.GET)
	private String getLogin(Model model){
		return "customer/clogin";
	}
	
	@RequestMapping(value="clogin",method=RequestMethod.POST)
	private String postLogin(Model model ,HttpSession session,@ModelAttribute("form") UserVO loginVO){
		UserVO vo = customerService.getLoginUser(loginVO);
		if( vo !=null){
			session.setAttribute(ResourceMessage.CUSTOMERSESSION, vo);
			return "redirect:Index";
		}else{
			return "";
		}
	}
	
	@RequestMapping(value="register",method=RequestMethod.GET)
	private String getRegister(Model model){
		return "customer/register";
	}
	
	@RequestMapping(value="register",method=RequestMethod.POST)
	private String postRegister(Model model,@ModelAttribute("form") UserVO loginVO){
		if(customerService.queryEmailRepeatTimes(loginVO)){
			customerService.registerUser(loginVO);
			return "redirect:Index";
		}else{
			return "";
		}
	}
}
