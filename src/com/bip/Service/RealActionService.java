package com.bip.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.cachetool.CachedTool;
import com.bip.vo.RealActionVO;

@Service
public class RealActionService {

	@Autowired
	private CachedTool cached;
	
	public List<RealActionVO> getActionVO(int page,int rows,String city){
		return null;
	}
}
