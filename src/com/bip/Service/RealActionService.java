package com.bip.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.cachetool.ICatch;
import com.bip.vo.RealActionVO;

@Service
public class RealActionService {

	@Autowired
	private ICatch cached;
	
	public List<RealActionVO> getActionVO(int page,int rows,String city){
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
		for(int i=0;i<4;i++){
			RealActionVO vo = new RealActionVO();
			vo.setActiontypename("跑步");
			vo.setDateTime("2014-06-20");
			vo.setDescription("just like playing basketbool");
			vo.setLatitude(30.684939);
			vo.setLongitude(104.046489);
			vo.setLocation("成都市，成华区，四川省草堂医院");
			vo.setRealactivityID(1);
			vo.setTelephone("15828316576");
			vos.add(vo);
		}
		return vos;
	}
}
