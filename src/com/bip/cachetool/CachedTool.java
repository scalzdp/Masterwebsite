package com.bip.cachetool;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bip.DAO.IBaseDAO;
import com.bip.vo.RealActionVO;

public class CachedTool {
	
	@Autowired
	private IBaseDAO baseDAO;
	
	@Autowired
	private MemcachedTools memcached;
	
	public List<RealActionVO> searchFromCached(int page,int rows,String city){
		return null;
	}
	
	private List<RealActionVO> searchFromDB(int page,int rows,String city){
		return null;
	}
	
	private void putObjectValueToCached(RealActionVO vo){
		
	}
	

	
}
