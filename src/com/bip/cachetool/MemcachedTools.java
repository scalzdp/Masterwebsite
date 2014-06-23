package com.bip.cachetool;

import org.springframework.stereotype.Service;

import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;

@Service
public class MemcachedTools {
	
	protected static MemCachedClient mcc = new MemCachedClient();
	
	protected static MemcachedTools memCached = new MemcachedTools();
	 
	static{
		//服务器列表和其权重
		String[] servers={"127.0.0.1:11211"};
		Integer[] weights={3};
		
		//获取socket连接池的实例对象
		SockIOPool pool =SockIOPool.getInstance();
		
		//设置服务器信息
		pool.setServers(servers);
		pool.setWeights(weights);
		
		//设置初始连接数、最小和最大连接数以及最大处理时间
		pool.setInitConn(5);
		pool.setMinConn(5);
		pool.setMaxConn(250);
		pool.setMaxIdle(1000*60*60*6);
		
		//设置主线程的睡眠时间
		pool.setMaintSleep(30);
		
	}
	private void connectMemcached(String host,String port){
		
	}
	
	private void disConnectMemcached(String host,String port){
		
	}
	
	private void put(String key,Object value){
		
	}
	
	private Object get(String key){
		return null;
	}
}
