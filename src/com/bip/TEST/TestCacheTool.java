package com.bip.TEST;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bip.cachetool.ICatch;
import com.bip.cachetool.MemcachedTools;
import com.bip.vo.RealActionVO;

public class TestCacheTool {
	
	@Autowired
	private ICatch cached;
	
	public void testsearchFromCached(){
		int page=0,rows=4,currentMaxID=0;
		String city="�ɶ�";
		List<RealActionVO> vos = cached.searchFromCached(page, rows, city, currentMaxID);
		
	}
	
	public void testputObjectValueToCached(){
		MemcachedTools cache =MemcachedTools.getInstance();
		cache.add("hello", 12345);
		System.out.print(cache.get("hello"));
	}
	
	public static void main(String[] args)
    {
		MemcachedTools cache = MemcachedTools.getInstance();
        cache.add("hello", 234);
        System.out.print("get value : " + cache.get("hello"));
    }
}
