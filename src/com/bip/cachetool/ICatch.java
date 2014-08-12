package com.bip.cachetool;

import java.util.List;

import com.bip.bean.Evaluation;
import com.bip.vo.EvaluationVO;
import com.bip.vo.RealActionVO;

public interface ICatch {
	
	public List<RealActionVO> searchFromCached(int page,int rows,String city,int currentMaxID,int  slidingDirection);
	
	public List<RealActionVO> searchFromCached(String city,int currentMaxID,int slidingDirections,int activityType);
	
	public int getRealActivityMaxID();
	
	public String getRealActivityMaxKey();
	
	public RealActionVO searchFromCachedByRealActionID(int id);
	
	public List<EvaluationVO> getEvaluationFromCache(int id);
	
	public void saveCommentsToCached(Evaluation eva);
}
