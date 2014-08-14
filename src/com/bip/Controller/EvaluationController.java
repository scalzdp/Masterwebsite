package com.bip.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public @ResponseBody String postComments(Model model,HttpServletRequest request,HttpSession session){
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
		return "json";
	}
	
	@RequestMapping(value="scoring/{id}/{score}",method=RequestMethod.GET)
	public @ResponseBody String RatingScore(Model model,HttpServletRequest request,@PathVariable int id,@PathVariable Double score){
		RatingScoreVO vo = new RatingScoreVO();
		vo.setRealActivityId(id);
		vo.setScore(score);
		vo = evaluationService.saveRatingScore(vo);
		request.setAttribute("jsonData", "");
		return vo.getScore()+","+vo.getScoreNum();
	}
	
	@RequestMapping(value="scoring/{id}",method=RequestMethod.GET)
	public @ResponseBody String getScore(Model model,HttpServletRequest request,@PathVariable int id){
		RatingScoreVO vo = evaluationService.getScore(id);
		return vo.getScore()+","+vo.getScoreNum();
	}
}
