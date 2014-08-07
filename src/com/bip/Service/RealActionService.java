package com.bip.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.cachetool.ICatch;
import com.bip.vo.EvaluationVO;
import com.bip.vo.RealActionVO;

@Service
public class RealActionService {

	@Autowired
	private ICatch cached;
	
	public List<RealActionVO> getActionVO(int page,int rows,String city,int currentMaxID,int slidingDirection){
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
		vos = cached.searchFromCached(city, currentMaxID, slidingDirection, 1);
		return vos;
	}
	
	public RealActionVO getActionVOByID(int id){
		return cached.searchFromCachedByRealActionID(id);
	}
	
	public List<EvaluationVO> getEvaluation(int id){
		return cached.getEvaluationFromCache(id);
	}
}
