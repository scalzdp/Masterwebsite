package com.bip.cachetool;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.vo.RealActionVO;

@Service
public class CachedTool implements ICatch {
	
	@Autowired
	private IBaseDAO baseDAO;
	
	@Autowired
	private MemcachedTools memcached;

	public List<RealActionVO> searchFromCached(int page, int rows, String city) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<RealActionVO> searchFromDB(int page, int rows, String city) {
		// TODO Auto-generated method stub
		return null;
	}

	public void putObjectValueToCached(RealActionVO vo) {
		// TODO Auto-generated method stub
		
	}
}
