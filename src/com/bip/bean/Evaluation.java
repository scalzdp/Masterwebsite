package com.bip.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_evaluation")
public class Evaluation {
	private Integer id;
	private Integer realActivityId;
	private Integer userId;
	private Integer activityTypeId;
	private Double score;
	private String Memo;
	private Date scoreTime;
	private String client;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column
	public Integer getRealActivityId() {
		return realActivityId;
	}
	public void setRealActivityId(Integer realActivityId) {
		this.realActivityId = realActivityId;
	}
	
	@Column
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	@Column
	public Integer getActivityTypeId() {
		return activityTypeId;
	}
	public void setActivityTypeId(Integer activityTypeId) {
		this.activityTypeId = activityTypeId;
	}
	
	@Column
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	
	@Column
	public String getMemo() {
		return Memo;
	}
	public void setMemo(String memo) {
		Memo = memo;
	}
	
	@Column
	public Date getScoreTime() {
		return scoreTime;
	}
	public void setScoreTime(Date scoreTime) {
		this.scoreTime = scoreTime;
	}
	
	@Column
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
}
