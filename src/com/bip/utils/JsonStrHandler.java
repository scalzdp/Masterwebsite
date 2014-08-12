package com.bip.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bip.bean.CacheKey;
import com.bip.bean.CommentsCacheKey;
import com.bip.bean.Location;
import com.bip.vo.EvaluationVO;
import com.bip.vo.PictureVO;
import com.bip.vo.RealActionVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import javassist.bytecode.Descriptor.Iterator;

public class JsonStrHandler {
	
	/**
	 * @return
	 */
	public static Map getMapFromJson(String jsonStr){
		//setDataFormat2JAVA();
		Map map = new HashMap();
		/*for(Iterator iter = jsonObject.keys();iter.hasNext()){
			String key = (String)iter.next() ;
			map.put(key, jsonObject.get(key));
		}*/
		return map;
	}
	
	/** 
	* 从一个JSON数组得到一个java对象数组，形如： 
	* [{"id" : idValue, "name" : nameValue}, {"id" : idValue, "name" : nameValue}, ...] 
	* @param object  
	* @return 
	*/ 
	public static ArrayList getDTOArray(String jsonString){
		ArrayList list = new ArrayList();
		JSONObject jsonObj = JSONObject.fromObject(jsonString);
		list.add(jsonObj.get(""));
		return list; 
	}
	
	/**
	 *将一个JavaList对象序列化为Json对象
	 *@param o 传递的JavaList对象 
	 */
	public static <T> String convertObjectToJson(List<T> objects){
		try{
			if(objects==null){
				return "";
			}
			JSONArray jo = JSONArray.fromObject(objects);
			System.err.println(jo.toString());
			return jo.toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	/** convert object to jsonString  
	 * */
	public static <T> String convertObjectToJson(T object){
		try{
			if(object==null){
				return "";
			}
			JSONArray jo = JSONArray.fromObject(object);
			System.err.println(jo.toString());
			return jo.toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	/** convert jsonString to RealActionVO object
	 * */
	public static RealActionVO convertJSONTOObject(String jsonString){
		RealActionVO vo = new RealActionVO();
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		List<PictureVO> picturevos = new ArrayList<PictureVO>();
		JSONObject jsonObj = JSONObject.fromObject(jsonArray.get(0));
		vo.setActiontypename(jsonObj.getString("actiontypename"));
		vo.setDateTime(jsonObj.getString("dateTime"));
		vo.setDescription(jsonObj.getString("description"));
		vo.setLatitude(jsonObj.getDouble("latitude"));
		vo.setLongitude(jsonObj.getDouble("longitude"));
		vo.setRealactivityID(jsonObj.getInt("realactivityID"));
		vo.setTelephone(jsonObj.getString("telephone"));
		JSONArray jsonArrayPictureVOs = JSONArray.fromObject(jsonObj.getString("picturevos"));
		for(int i=0;i<jsonArrayPictureVOs.size();i++){
			JSONObject jsonObjs = JSONObject.fromObject(jsonArrayPictureVOs.get(i));
			PictureVO picturevo = new PictureVO();
			picturevo.setId(jsonObjs.getInt("id"));
			picturevo.setIsMain(jsonObjs.getInt("isMain"));
			picturevo.setPicMaxPath(jsonObjs.getString("picMaxPath"));
			picturevo.setPicMinPath(jsonObjs.getString("picMinPath"));
			picturevo.setRealActivityId(jsonObjs.getInt("realActivityId"));
			picturevos.add(picturevo);
		}
		vo.setPicturevos(picturevos);
		return vo;
	}
	
	public static List<CacheKey> convertJsonToCacheKeyObjects(String jsonString){
		List<CacheKey> cacheKeys = new ArrayList<CacheKey>();
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		for(int i=0;i<jsonArray.size();i++){
			CacheKey ckey = new CacheKey();
			JSONObject jsonObjs = JSONObject.fromObject(jsonArray.get(i));
			ckey.setId(jsonObjs.getInt("id"));
			ckey.setDataMark(jsonObjs.getInt("dataMark"));
			ckey.setF1(jsonObjs.getInt("f1"));
			ckey.setProperty1(jsonObjs.getString("property1"));
			ckey.setProperty2(jsonObjs.getString("property2"));
			ckey.setProperty3(jsonObjs.getString("property3"));
			ckey.setProperty4(jsonObjs.getString("property4"));
			ckey.setTypeID(jsonObjs.getInt("typeID"));
			cacheKeys.add(ckey);
		}
		return cacheKeys;
	}
	
	public static List<CommentsCacheKey> convertJsonToCommentsCacheKeyObjects(String jsonString){
		List<CommentsCacheKey> cacheKeys = new ArrayList<CommentsCacheKey>();
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		for(int i=0;i<jsonArray.size();i++){
			CommentsCacheKey ckey = new CommentsCacheKey();
			JSONObject jsonObjs = JSONObject.fromObject(jsonArray.get(i));
			ckey.setId(jsonObjs.getInt("id"));
			ckey.setDataMark(jsonObjs.getInt("dataMark"));
			ckey.setF1(jsonObjs.getInt("f1"));
			ckey.setProperty1(jsonObjs.getString("property1"));
			ckey.setProperty2(jsonObjs.getString("property2"));
			ckey.setProperty3(jsonObjs.getString("property3"));
			ckey.setProperty4(jsonObjs.getString("property4"));
			ckey.setTypeID(jsonObjs.getInt("typeID"));
			cacheKeys.add(ckey);
		}
		return cacheKeys;
	}
	
	public static EvaluationVO convertJSONTOEvaluationVOObject(String jsonString){
		EvaluationVO vo = new EvaluationVO();
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		JSONObject jsonObj = JSONObject.fromObject(jsonArray.get(0));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		vo.setId(jsonObj.getInt("id"));
		vo.setActivityTypeId(jsonObj.getInt("realActivityId"));
		vo.setClient(jsonObj.getString("client"));
		vo.setMemo(jsonObj.getString("memo"));
		try {
			vo.setTime(sdf.parse(jsonObj.getString("time")));
		} catch (ParseException e) {
		}
		try{
			vo.setUserId(jsonObj.getInt("userId"));
		}catch(Exception e){
			vo.setUserId(0);
		}
		return vo;
	}
}
