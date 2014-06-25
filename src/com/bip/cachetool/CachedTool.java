package com.bip.cachetool;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.ActionType;
import com.bip.bean.Location;
import com.bip.bean.RealActivity;
import com.bip.utils.JsonStrHandler;
import com.bip.vo.RealActionVO;

@Service
public class CachedTool implements ICatch {
	
	@Autowired
	private IBaseDAO baseDAO;
	
	
	private MemcachedTools memcached = MemcachedTools.getInstance();

	/* search message from memcached,this key from construct 
	 * */
	public List<RealActionVO> searchFromCached(int page, int rows, String city,int currentMaxID) {
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
		while(vos.size()<rows){
			String key = getRealActivityKey(currentMaxID);

			
			if(memcached.get(key)!=null){
				RealActionVO vo = JsonStrHandler.convertJSONTOObject((String)memcached.get(key));
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
					memcached.add(key, JsonStrHandler.convertObjectToJson(vo));
				}
				vos.add(vo);
				
			}
			currentMaxID--;
			if(currentMaxID==0){
				currentMaxID=getMaxID();
			}
		}
		return vos;
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
	
	private int getMaxID(){
		memcached.add("MaxID",2);
		Object maxID = memcached.get("MaxID");
		return Integer.parseInt(maxID.toString());
	}
	
	private String getLocationKey(int id){
		return "location_"+id;
	}
	


	
}
