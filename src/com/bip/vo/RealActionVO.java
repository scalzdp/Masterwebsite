package com.bip.vo;

import java.util.List;

public class RealActionVO {
	private Integer realactivityID;
	private String location;
	private String telephone;
	private String description;
	private String dateTime;
	private Double latitude;
	private Double longitude;
	private String actiontypename;
	
	private List<PictureVO> picturevos;
	
	public Integer getRealactivityID() {
		return realactivityID;
	}
	public void setRealactivityID(Integer realactivityID) {
		this.realactivityID = realactivityID;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public String getActiontypename() {
		return actiontypename;
	}
	public void setActiontypename(String actiontypename) {
		this.actiontypename = actiontypename;
	}
	public List<PictureVO> getPicturevos() {
		return picturevos;
	}
	public void setPicturevos(List<PictureVO> picturevos) {
		this.picturevos = picturevos;
	}
	
}
