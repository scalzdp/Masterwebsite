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

	public List<RealActionVO> searchFromCached(int page, int rows, String city,int currentMaxID) {
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
	
	public int getRealActivityMaxID() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public String getRealActivityMaxKey(){
		return "realactivity_Max";
	}
	
	private String getRealActivityKey(int id){
		return "realactivity_"+id;
	}
	
	private String getLocationKey(int id){
		return "location_"+id;
	}
	


	
}
