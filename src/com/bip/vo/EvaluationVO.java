package com.bip.vo;

import java.util.Date;

public class EvaluationVO {
	private Integer id;
	private Integer realActivityId;
	private Integer userId;
	private Integer activityTypeId;
	private String Memo;
	private String client;
	private Date time;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRealActivityId() {
		return realActivityId;
	}
	public void setRealActivityId(Integer realActivityId) {
		this.realActivityId = realActivityId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getActivityTypeId() {
		return activityTypeId;
	}
	public void setActivityTypeId(Integer activityTypeId) {
		this.activityTypeId = activityTypeId;
	}
	public String getMemo() {
		return Memo;
	}
	public void setMemo(String memo) {
		Memo = memo;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	
}
