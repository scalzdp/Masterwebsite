package com.bip.cachetool;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.ActionType;
import com.bip.bean.Location;
import com.bip.bean.RealActivity;
import com.bip.vo.RealActionVO;

@Service
public class CachedTool implements ICatch {
	
	@Autowired
	private IBaseDAO baseDAO;
	
	
	private MemcachedTools memcached = MemcachedTools.getInstance();

	public List<RealActionVO> searchFromCached(int page, int rows, String city,int currentMaxID) {
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
		while(vos.size()<rows){
			if(memcached.get(getRealActivityKey(currentMaxID))!=null){
				RealActionVO vo = (RealActionVO)memcached.get(getRealActivityKey(currentMaxID));
				vos.add(vo);
			}else{
				RealActivity ra = baseDAO.get(new RealActivity(), currentMaxID);
				RealActionVO vo = new RealActionVO();
				if(ra!=null){
					Location location = baseDAO.get(new Location(), ra.getLocationId());
					ActionType actiontype = baseDAO.get(new ActionType(), ra.getActiontypeid());
					vo.setActiontypename(actiontype.getName());
					vo.setDateTime(ra.getDateTime().toString());
					vo.setDescription(ra.getDiscription());
					vo.setLatitude(location.getLatitude());
					vo.setLongitude(location.getLongitude());
					vo.setRealactivityID(ra.getId());
					vo.setTelephone(ra.getTelephone());
					memcached.add(getRealActivityKey(currentMaxID), vo);
				}
				vos.add(vo);
				
			}
			currentMaxID--;
		}
		return vos;
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
