package com.bip.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bip.bean.Location;

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
}