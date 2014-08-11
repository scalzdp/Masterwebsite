package com.bip.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.Evaluation;
import com.bip.bean.RatingScore;
import com.bip.vo.EvaluationVO;

@Service
public class EvaluationService {

	@Autowired
	private IBaseDAO baseDAO;
	
	/** save the evaluation memo,if save the evaluation memo right then will return true;
	 * */
	public boolean saveEvaluationMemo(EvaluationVO vo){
		Evaluation eva = new Evaluation();
		eva.setActivityTypeId(vo.getActivityTypeId());
		eva.setClient(vo.getClient());
		eva.setMemo(vo.getMemo());
		eva.setRealActivityId(vo.getRealActivityId());
		eva.setUserId(vo.getUserId());
		eva.setTime(new Date());
		baseDAO.save(eva);
		return true;
	}
	
	/**save the rating score message,if save the right then return true;
	 * */
	public boolean saveRatingScore(EvaluationVO vo){
		RatingScore ras= new RatingScore();
		ras.setActivityTypeId(vo.getActivityTypeId());
		ras.setClient(vo.getClient());
		ras.setRealActivityId(vo.getRealActivityId());
		ras.setUserId(vo.getUserId());
		ras.setScore(vo.getScore());
		ras.setScoreTime(new Date());
		baseDAO.save(ras);
		return true;
	}

}
