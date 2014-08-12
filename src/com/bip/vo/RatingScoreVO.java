package com.bip.vo;

import java.util.Date;

public class RatingScoreVO {
	private Integer id;
	private Integer realActivityId;
	private Integer userId;
	private Integer activityTypeId;
	private Double score;
	private Date scoreTime;
	private String client;
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
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public Date getScoreTime() {
		return scoreTime;
	}
	public void setScoreTime(Date scoreTime) {
		this.scoreTime = scoreTime;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
}
