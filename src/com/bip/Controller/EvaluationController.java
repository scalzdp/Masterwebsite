package com.bip.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bip.Service.EvaluationService;
import com.bip.cachetool.ICatch;
import com.bip.source.ResourceMessage;
import com.bip.vo.EvaluationVO;
import com.bip.vo.RatingScoreVO;
import com.bip.vo.RealActionVO;
import com.bip.vo.UserVO;


@Controller
public class EvaluationController {
	
	@Autowired
	private EvaluationService evaluationService;
	
	@RequestMapping(value="postComment",method=RequestMethod.POST)
	public String postComments(Model model,HttpServletRequest request,HttpSession session){
		EvaluationVO vo = new EvaluationVO();
		String comment = request.getParameter("comment");
		int RealActiveID = Integer.parseInt(request.getParameter("RealActiveID"));
		RealActionVO ravo = evaluationService.getRealActionVOByRealActionID(RealActiveID);
		vo.setMemo(comment);
		vo.setRealActivityId(ravo.getRealactivityID());
		if(session.getAttribute(ResourceMessage.CUSTOMERSESSION)!=null){
			UserVO uservo = (UserVO)session.getAttribute(ResourceMessage.CUSTOMERSESSION);
			vo.setUserId(uservo.getId());
		}else{
			vo.setUserId(0);//0 is traveller not a sign up user
		}
		evaluationService.saveEvaluationMemo(vo);
		return "";
	}
	
	public void RatingScore(Model model,HttpServletRequest request){
		RatingScoreVO vo = new RatingScoreVO();
		int score = Integer.parseInt(request.getParameter("score"));
		evaluationService.saveRatingScore(vo);
	}
}
