package com.bip.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_comprehensiveEvaluation")
public class ComprehensiveEvaluation {
	private Integer id;
	private Integer realActivityId;
	private Integer activityTypeId;
	private Double averageScore;
	private Integer scoreNum;
	private Date lastScoreTime;
	
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
	public Integer getActivityTypeId() {
		return activityTypeId;
	}
	public void setActivityTypeId(Integer activityTypeId) {
		this.activityTypeId = activityTypeId;
	}
	
	@Column
	public Double getAverageScore() {
		return averageScore;
	}
	public void setAverageScore(Double averageScore) {
		this.averageScore = averageScore;
	}
	
	@Column
	public Integer getScoreNum() {
		return scoreNum;
	}
	public void setScoreNum(Integer scoreNum) {
		this.scoreNum = scoreNum;
	}
	
	@Column
	public Date getLastScoreTime() {
		return lastScoreTime;
	}
	public void setLastScoreTime(Date lastScoreTime) {
		this.lastScoreTime = lastScoreTime;
	}
}
