package com.bip.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.CommentsCacheKey;
import com.bip.bean.Evaluation;
import com.bip.bean.RatingScore;
import com.bip.cachetool.ICatch;
import com.bip.vo.EvaluationVO;
import com.bip.vo.RatingScoreVO;
import com.bip.vo.RealActionVO;

@Service
public class EvaluationService {

	@Autowired
	private IBaseDAO baseDAO;
	
	@Autowired
	private ICatch cache;
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
		cache.saveCommentsToCached(eva);
		CommentsCacheKey ck = new CommentsCacheKey();
		ck.setF1(vo.getRealActivityId());
		ck.setTypeID(eva.getId());
		baseDAO.save(ck);
		return true;
	}
	
	/**save the rating score message,if save the right then return true;
	 * */
	public boolean saveRatingScore(RatingScoreVO vo){
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
	
	public RealActionVO getRealActionVOByRealActionID(int RealActiveID){
		return cache.searchFromCachedByRealActionID(RealActiveID);
	}
	
	public List<EvaluationVO> getEvaluationFromCache(int id){
		return cache.getEvaluationFromCache(id);
	}

}
