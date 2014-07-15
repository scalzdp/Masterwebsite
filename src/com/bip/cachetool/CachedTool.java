package com.bip.cachetool;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.ActionType;
import com.bip.bean.CacheKey;
import com.bip.bean.Location;
import com.bip.bean.Picture;
import com.bip.bean.RealActivity;
import com.bip.utils.JsonStrHandler;
import com.bip.vo.PictureVO;
import com.bip.vo.RealActionVO;

@Service
public class CachedTool implements ICatch {
	
	@Autowired
	private IBaseDAO baseDAO;
	
	
	private MemcachedTools memcached = MemcachedTools.getInstance();

	/* search message from memcached,this key from construct 
	 * */
	public List<RealActionVO> searchFromCached(int page, int rows, String city,int currentMaxID,int slidingDirections) {
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
		while(vos.size()<rows){
			if(currentMaxID<=0){
				currentMaxID=getRealActivityMaxID();
			}
			String key = getRealActivityKey(currentMaxID);

			
			if(memcached.get(key)!=null){
				RealActionVO vo = JsonStrHandler.convertJSONTOObject((String)memcached.get(key));
				vos.add(vo);
				memcached.delete(key);
			}else{
				RealActivity ra = baseDAO.get(new RealActivity(), currentMaxID);
				RealActionVO vo = new RealActionVO();
				if(ra!=null){
					List<PictureVO> picturevos = new ArrayList<PictureVO>();
					for(Picture p:baseDAO.queryFactory(new Picture(), "t_picture", " and isMain=1 and realActivityId="+ra.getId())){
						PictureVO picturevo = new PictureVO();
						picturevo.setId(p.getId());
						picturevo.setIsMain(p.getIsMain());
						picturevo.setPicMaxPath(p.getPicMaxPath());
						picturevo.setRealActivityId(p.getRealActivityId());
						picturevos.add(picturevo);
					}
					Location location = baseDAO.get(new Location(), ra.getLocationId());
					ActionType actiontype = baseDAO.get(new ActionType(), ra.getActiontypeid());
					vo.setActiontypename(actiontype.getName());
					vo.setDateTime(ra.getDateTime().toString());
					vo.setDescription(ra.getDiscription());
					vo.setLatitude(location.getLatitude());
					vo.setLongitude(location.getLongitude());
					vo.setRealactivityID(ra.getId());
					vo.setTelephone(ra.getTelephone());
					vo.setPicturevos(picturevos);
					memcached.add(key, JsonStrHandler.convertObjectToJson(vo));
				}
				vos.add(vo);
				
			}
			if(slidingDirections==1){
				currentMaxID--;
			}
			if(slidingDirections==0){
				if(getRealActivityMaxID()<=currentMaxID){
					slidingDirections=1;
				}else{
					currentMaxID++;
				}
			}
			
		}
		return vos;
	}
	
	/**通过缓存取出所有缓存键，然后再缓存建中查找符合条件的数据。
	 * */
	public List<RealActionVO> searchFromCached(int page, int rows, String city,int currentMaxID,int slidingDirections,int activityType) {
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
		List<CacheKey> CacheKeyVOs = getCachedKeys();
		
		return vos;
	}

	
	private List<CacheKey> getCachedKeys() {
		List<CacheKey> vos;
		if(memcached.get(getCachedKeyKeys())!=null){
			vos = JsonStrHandler.convertJsonToCacheKeyObjects((String)memcached.get(getCachedKeyKeys()));
		}else{
			vos = baseDAO.getAllSelf(new CacheKey(), "t_cachedkey");
		}
		return vos;
	}

	public int getRealActivityMaxID() {
		// TODO Auto-generated method stub
		int result=0;
		if(memcached.get("MAX_ID")==null){
			result =  getMaxID();
		}else{
			result = Integer.parseInt( memcached.get("MAX_ID").toString());
		}
		return result ;
	}
	
	private String getCachedKeyKeys(){
		return "realactivity_cachedkeys";
	}
	
	public String getRealActivityMaxKey(){
		return "realactivity_Max";
	}
	
	private String getRealActivityKey(int id){
		return "realactivity_"+id;
	}
	
	private int getMaxID(){
		int maxid= baseDAO.getAllSelf(new RealActivity(), "t_realactivity").size();
		memcached.add("MaxID",maxid);
		
		return maxid;
	}
	
	private String getLocationKey(int id){
		return "location_"+id;
	}
}
