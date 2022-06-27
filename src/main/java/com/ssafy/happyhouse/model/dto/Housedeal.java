package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class Housedeal implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8873637398148588411L;
	private int no;
	private int aptCode;
	private String aptName;
	private String dongName;
	private String dealAmount;
	private String dealYear;
	private String dealMonth;
	private String dealDay;
	private String area;
	private String floor;
	private String type;
	private String rentMoney;
	private float lat;
	private float lng;
	public Housedeal(int no, int aptCode, String aptName, String dongName, String dealAmount, String dealYear,
			String dealMonth, String dealDay, String area, String floor, String type, String rentMoney, float lat,
			float lng) {
		super();
		this.no = no;
		this.aptCode = aptCode;
		this.aptName = aptName;
		this.dongName = dongName;
		this.dealAmount = dealAmount;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
		this.type = type;
		this.rentMoney = rentMoney;
		this.lat = lat;
		this.lng = lng;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAptCode() {
		return aptCode;
	}
	public void setAptCode(int aptCode) {
		this.aptCode = aptCode;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	public String getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}
	public String getDealYear() {
		return dealYear;
	}
	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}
	public String getDealMonth() {
		return dealMonth;
	}
	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}
	public String getDealDay() {
		return dealDay;
	}
	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRentMoney() {
		return rentMoney;
	}
	public void setRentMoney(String rentMoney) {
		this.rentMoney = rentMoney;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Housedeal [no=").append(no).append(", aptCode=").append(aptCode).append(", aptName=")
				.append(aptName).append(", dongName=").append(dongName).append(", dealAmount=").append(dealAmount)
				.append(", dealYear=").append(dealYear).append(", dealMonth=").append(dealMonth).append(", dealDay=")
				.append(dealDay).append(", area=").append(area).append(", floor=").append(floor).append(", type=")
				.append(type).append(", rentMoney=").append(rentMoney).append(", lat=").append(lat).append(", lng=")
				.append(lng).append("]");
		return builder.toString();
	}
	
	
	
}
