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
	public RatingScoreVO saveRatingScore(RatingScoreVO vo){
		RatingScore ras= new RatingScore();
		List<RatingScore> rases = baseDAO.queryFactory(new RatingScore(), "t_ratingscore", " and realActivityId="+vo.getRealActivityId());
		ras.setActivityTypeId(vo.getActivityTypeId());
		ras.setClient(vo.getClient());
		ras.setRealActivityId(vo.getRealActivityId());
		ras.setUserId(vo.getUserId());
		ras.setScore(vo.getScore());
		ras.setScoreTime(new Date());
		if(rases.size()>0){
		
			ras.setScoreNum(rases.get(0).getScoreNum()+1);
			baseDAO.update(ras);
		}
		ras.setScoreNum(1);
		baseDAO.save(ras);
		return convertRatingScoreToRatingScoreVO(ras);
	}
	
	public RealActionVO getRealActionVOByRealActionID(int RealActiveID){
		return cache.searchFromCachedByRealActionID(RealActiveID);
	}
	
	public List<EvaluationVO> getEvaluationFromCache(int id){
		return cache.getEvaluationFromCache(id);
	}
	
	public RatingScoreVO getScore(int id){
		List<RatingScore> rases = baseDAO.queryFactory(new RatingScore(), "t_ratingscore", " and realActivityId="+id);
		if(rases.size()>0){
			return convertRatingScoreToRatingScoreVO(rases.get(0));
		}else{
			RatingScoreVO vo = new RatingScoreVO();
			vo.setRealActivityId(id);
			vo.setScore(0.0);
			vo.setScoreNum(0);
			return vo;
		}
	}
	
	private RatingScoreVO convertRatingScoreToRatingScoreVO(RatingScore ras){
		RatingScoreVO rsvo = new RatingScoreVO();
		rsvo.setActivityTypeId(ras.getActivityTypeId());
		rsvo.setClient(ras.getClient());
		rsvo.setId(ras.getId());
		rsvo.setRealActivityId(ras.getRealActivityId());
		rsvo.setScore(ras.getScore());
		rsvo.setScoreNum(ras.getScoreNum());
		return rsvo;
	}

}
