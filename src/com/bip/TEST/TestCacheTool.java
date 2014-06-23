package com.bip.TEST;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bip.cachetool.ICatch;
import com.bip.vo.RealActionVO;

public class TestCacheTool {
	
	@Autowired
	private ICatch cached;
	
	public void testsearchFromCached(){
		int page=0,rows=4,currentMaxID=0;
		String city="³É¶¼";
		List<RealActionVO> vos = cached.searchFromCached(page, rows, city, currentMaxID);
		
	}
	
	public void testputObjectValueToCached(){
		
	}
}
