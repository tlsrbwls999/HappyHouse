package com.ssafy.happyhouse.model.dto;

public class Sidocode {
	private String sidoCode;
	private String sidoName;
	
	public Sidocode(String sidoCode, String sidoName) {
		super();
		this.sidoCode = sidoCode;
		this.sidoName = sidoName;
	}

	public String getSidoCode() {
		return sidoCode;
	}

	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}

	public String getSidoName() {
		return sidoName;
	}

	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Sidocode [sidoCode=").append(sidoCode).append(", sidoName=").append(sidoName).append("]");
		return builder.toString();
	}
	
	
}
