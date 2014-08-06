package com.bip.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_userGrowth")
public class UserGrowthRecord {
	private Integer id;
	private Integer userId;
	private Integer evaluationNum;
	private Double experience;
	private Date lastTime;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	@Column
	public Integer getEvaluationNum() {
		return evaluationNum;
	}
	public void setEvaluationNum(Integer evaluationNum) {
		this.evaluationNum = evaluationNum;
	}
	
	@Column
	public Double getExperience() {
		return experience;
	}
	public void setExperience(Double experience) {
		this.experience = experience;
	}
	
	@Column
	public Date getLastTime() {
		return lastTime;
	}
	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
}
