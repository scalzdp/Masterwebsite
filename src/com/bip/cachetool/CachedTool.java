package com.bip.cachetool;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.ActionType;
import com.bip.bean.CacheKey;
import com.bip.bean.CommentsCacheKey;
import com.bip.bean.Evaluation;
import com.bip.bean.Location;
import com.bip.bean.Picture;
import com.bip.bean.RealActivity;
import com.bip.source.ResourceMessage;
import com.bip.utils.JsonStrHandler;
import com.bip.vo.EvaluationVO;
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
	
	/**通search the result by get the cache key
	 * */
	public List<RealActionVO> searchFromCached(String city,int currentMaxID,int slidingDirections,int activityType) {
		List<RealActionVO> vos = new ArrayList<RealActionVO>();
		List<CacheKey> searchKeys = getTheSearchKeys(city,activityType,currentMaxID,slidingDirections);
		for(CacheKey key :searchKeys){
			Object obj = memcached.get(getRealActivityKey(key));
			RealActionVO vo = new RealActionVO();
			if(obj!=null){
				vo =JsonStrHandler.convertJSONTOObject((String)obj);
				vos.add(vo);
			}else{
				RealActivity ra = baseDAO.get(new RealActivity(), key.getF1());
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
				memcached.add(getRealActivityKey(key), JsonStrHandler.convertObjectToJson(vo));
				vos.add(vo);
			}
			
		}
		return vos;
	}

	
	private List<CacheKey> getTheSearchKeys(String city, int activityType,int currentMaxID,int slidingDirections) {
		List<CacheKey> CacheKeyVOs = getCachedKeys();
		List<CacheKey> searchKeys = new ArrayList<CacheKey>();
		if(slidingDirections==0){//0 show the message run right
			for(int i=currentMaxID;i<CacheKeyVOs.size();i++){
				CacheKey ck = getCacheKeyFromCacheKeyVOs(CacheKeyVOs,i);
				if(ck==null)continue;
				if(city.length()!=0){
					if(ck.getProperty1().contains(city)&&ck.getTypeID().equals(activityType)){
						searchKeys.add(ck);
						if(searchKeys.size()==ResourceMessage.PICNUMBER)break;
					}
				}else{
					if(ck.getTypeID().equals(activityType)){
						searchKeys.add(ck);
						if(searchKeys.size()==ResourceMessage.PICNUMBER)break;
					}
				}
			}
		}else{
			for(int i=currentMaxID;i>0;i--){
				CacheKey ck = getCacheKeyFromCacheKeyVOs(CacheKeyVOs,i);
				if(ck==null)continue;
				if(city.length()!=0){
					if(ck.getProperty1().equals(city)&&ck.getTypeID().equals(activityType)){
						searchKeys.add(ck);
						if(searchKeys.size()==ResourceMessage.PICNUMBER)break;
					}
				}else{
					if(ck.getTypeID().equals(activityType)){
						searchKeys.add(ck);
						if(searchKeys.size()==ResourceMessage.PICNUMBER)break;
					}
				}
			}
		}
		return searchKeys;
	}
	private CacheKey getCacheKeyFromCacheKeyVOs(List<CacheKey> CacheKeyVOs,int id){
		if(id==0)id=1;
		for(CacheKey ck : CacheKeyVOs){
			if(ck.getF1().equals(id)){
				return ck;
			}
		}
		return null;
	}
	

	private List<CacheKey> getCachedKeys() {
		List<CacheKey> vos;
		if(memcached.get(getCachedKeyKeys())!=null){
			vos = JsonStrHandler.convertJsonToCacheKeyObjects((String)memcached.get(getCachedKeyKeys()));
		}else{
			vos = baseDAO.getAllSelf(new CacheKey(), "t_cachedkey");
			memcached.replace(getCachedKeyKeys(), JsonStrHandler.convertObjectToJson(vos));
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
	
	/**use cacheKey 
	 * then return the key to main 
	 * */
	private String getRealActivityKey(CacheKey cacheKey){
		return "realactivity_"+cacheKey.getTypeID()+"_"+cacheKey.getProperty1()+"_"+cacheKey.getF1();
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

	public RealActionVO searchFromCachedByRealActionID(int id) {
		List<CacheKey> searchKeys =getCacheKeyByRealActionID(id);
		RealActionVO vo = new RealActionVO();
		if(searchKeys.size()>0){
			Object obj = memcached.get(getRealActivityKey(searchKeys.get(0)));
			if(obj!=null){
				vo =JsonStrHandler.convertJSONTOObject((String)obj);
			}else{
				RealActivity ra = baseDAO.get(new RealActivity(), searchKeys.get(0).getF1());
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
				memcached.add(getRealActivityKey(searchKeys.get(0)), JsonStrHandler.convertObjectToJson(vo));
			}
		}
		return vo;
	}
	
	private List<CacheKey> getCacheKeyByRealActionID(int id){
		List<CacheKey> CacheKeyVOs = getCachedKeys();
		List<CacheKey> searchKeys = new ArrayList<CacheKey>();
		for(CacheKey ck:CacheKeyVOs){
			if(ck.getF1().equals(id)){
				searchKeys.add(ck);
			}
		}
		return searchKeys;
	}

	/**get the evaluation from the cache
	 * 1.throw search from memcacheCache get all the comments cache keys
	 * 2.loop the comments cache keys 
	 * 3.if can get the Memo from the cache,then and the message to return Object
	 * 4.if can't get the memo from the cache,then get the message from the database then add the message to memcache. 
	 * */
	public List<EvaluationVO> getEvaluationFromCache(int id) {
		List<EvaluationVO> vos = new ArrayList<EvaluationVO>();
		List<CommentsCacheKey> cacheKeys = getCommentsCacheKey(id);
		for(CommentsCacheKey ck:cacheKeys){
			Object obj = memcached.get(getCommentsCacheKeyName(ck.getF1()));
			if(obj!=null){
				vos.add(JsonStrHandler.convertJSONTOEvaluationVOObject((String)obj));
			}else{
				//TODO:从数据库里面取出评价，然后将评价写入到缓存中
				EvaluationVO vo = new EvaluationVO();
				Evaluation eval = baseDAO.get(new Evaluation(), ck.getF1());
				vo.setActivityTypeId(eval.getActivityTypeId());
				vo.setClient(eval.getClient());
				vo.setId(eval.getId());
				vo.setMemo(eval.getMemo());
				vo.setRealActivityId(eval.getRealActivityId());
				vo.setUserId(eval.getUserId());
				vos.add(vo);
			}
		}
		return vos;
	}
	
	/**Organization the commentsCacheKey
	 * 1.incoming the evaluation id
	 * 2.return message like 'evaluation_1'
	 * */
	private String getCommentsCacheKeyName(int id){
		return "evaluation_"+id;
	}
	
	/**store all the cache keys,key name
	 * */
	private String getEvaluationCackeKey(){
		return "evaluation_cachedkeys";
	}
	
	/**get meet the conditions comments cache keys
	 * 1.get all comments cache keys 
	 * 2.get meet the conditions throw commentsCacheKey F1 equal id
	 * */
	private List<CommentsCacheKey> getCommentsCacheKey(int id){
		List<CommentsCacheKey> cacheKeys =getAllCommentsCacheKey();
		List<CommentsCacheKey> ck = new ArrayList<CommentsCacheKey>();
		for(CommentsCacheKey c : cacheKeys){
			if(c.getF1().equals(id)){
				ck.add(c);
			}
		}
		return ck;
	}
	
	/**get all the comments cache keys
	 * 1.get the all cache keys from memcache,then convert the json String to Object
	 * 2.if get cache not has the message ,then get cache key from database then add the message to memcache
	 * */
	private List<CommentsCacheKey> getAllCommentsCacheKey(){
		List<CommentsCacheKey> vos;
		if(memcached.get(getCachedKeyKeys())!=null){
			vos = JsonStrHandler.convertJsonToCommentsCacheKeyObjects((String)memcached.get(getEvaluationCackeKey()));
		}else{
			vos = baseDAO.getAllSelf(new CommentsCacheKey(), "t_commentscachedkey");
			memcached.replace(getEvaluationCackeKey(), JsonStrHandler.convertObjectToJson(vos));
		}
		return vos;
	}
}
