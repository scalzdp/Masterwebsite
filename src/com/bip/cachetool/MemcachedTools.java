package com.bip.cachetool;

import org.springframework.stereotype.Service;

import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;

@Service
public class MemcachedTools {
	
	protected static MemCachedClient mcc = new MemCachedClient();
	
	protected static MemcachedTools memCached = new MemcachedTools();
	 
	static{
		//�������б����Ȩ��
		String[] servers={"127.0.0.1:11211"};
		Integer[] weights={3};
		
		//��ȡsocket���ӳص�ʵ������
		SockIOPool pool =SockIOPool.getInstance();
		
		//���÷�������Ϣ
		pool.setServers(servers);
		pool.setWeights(weights);
		
		//���ó�ʼ����������С������������Լ������ʱ��
		pool.setInitConn(5);
		pool.setMinConn(5);
		pool.setMaxConn(250);
		pool.setMaxIdle(1000*60*60*6);
		
		//�������̵߳�˯��ʱ��
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
