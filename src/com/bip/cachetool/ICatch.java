package com.bip.cachetool;

import java.util.List;

import com.bip.vo.RealActionVO;

public interface ICatch {
	
	public List<RealActionVO> searchFromCached(int page,int rows,String city,int currentMaxID,int  slidingDirection);
	
	public int getRealActivityMaxID();
	
	public String getRealActivityMaxKey();
}
