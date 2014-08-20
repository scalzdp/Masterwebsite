package com.bip.vo;

import java.util.Date;

public class EvaluationOfHistoryVO {
	private Integer evaluationId;
	private Integer realActivityId;
	private String path;
	private String memo;
	private Date dateTime;
	
	public Integer getEvaluationId() {
		return evaluationId;
	}
	public void setEvaluationId(Integer evaluationId) {
		this.evaluationId = evaluationId;
	}
	public Integer getRealActivityId() {
		return realActivityId;
	}
	public void setRealActivityId(Integer realActivityId) {
		this.realActivityId = realActivityId;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	
}
