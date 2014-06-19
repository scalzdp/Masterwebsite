package com.bip.cachetool;

import java.util.List;

import com.bip.vo.RealActionVO;

public interface ICatch {
	
	public List<RealActionVO> searchFromCached(int page,int rows,String city);
	
	public List<RealActionVO> searchFromDB(int page,int rows,String city);
	
	public void putObjectValueToCached(RealActionVO vo);
}
