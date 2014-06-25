package com.bip.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bip.bean.Location;
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

		JSONObject jsonObj = JSONObject.fromObject(jsonArray.get(0));
		vo.setActiontypename(jsonObj.getString("actiontypename"));
		vo.setDateTime(jsonObj.getString("dateTime"));
		vo.setDescription(jsonObj.getString("description"));
		vo.setLatitude(jsonObj.getDouble("latitude"));
		vo.setLongitude(jsonObj.getDouble("longitude"));
		vo.setRealactivityID(jsonObj.getInt("realactivityID"));
		vo.setTelephone(jsonObj.getString("telephone"));
		return vo;
	}
}
