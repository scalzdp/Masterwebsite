package com.bip.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bip.Service.EvaluationService;
import com.bip.vo.EvaluationVO;


@Controller
public class EvaluationController {
	
	@Autowired
	private EvaluationService evaluationService;
	
	@RequestMapping(value="postComment",method=RequestMethod.POST)
	public String postComments(Model model,HttpServletRequest request){
		EvaluationVO vo = new EvaluationVO();
		
		String comment = request.getParameter("comment");
		evaluationService.saveEvaluationMemo(vo);
		return "";
	}
	
	public void RatingScore(Model model,HttpServletRequest request){
		EvaluationVO vo = new EvaluationVO();
		int score = Integer.parseInt(request.getParameter("score"));
		evaluationService.saveRatingScore(vo);
	}
}
