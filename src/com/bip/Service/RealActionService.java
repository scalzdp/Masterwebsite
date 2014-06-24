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
	
	public List<RealActionVO> getActionVO(int page,int rows,String city,int currentMaxID){
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
//		for(int i=0;i<5;i++){
//			RealActionVO vo = new RealActionVO();
//			vo.setActiontypename("�ܲ�");
//			vo.setDateTime("2014-06-20");
//			vo.setDescription("just like playing basketbool");
//			vo.setLatitude(30.684939);
//			vo.setLongitude(104.046489);
//			vo.setLocation("�ɶ��У��ɻ����Ĵ�ʡ����ҽԺ");
//			vo.setRealactivityID(i);
//			vo.setTelephone("15828316576");
//			vos.add(vo);
//		}
		
		vos = cached.searchFromCached(page, rows, city, currentMaxID);
		return vos;
	}
}
