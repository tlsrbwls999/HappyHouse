package com.ssafy.happyhouse.model.dto;

public class Dongcode {
	private String dongCode;
	private String sidoName;
	private String gugunName;
	private String dongName;
	
	public Dongcode(String dongCode, String sidoName, String gugunName, String dongName) {
		super();
		this.dongCode = dongCode;
		this.sidoName = sidoName;
		this.gugunName = gugunName;
		this.dongName = dongName;
	}

	public String getDongCode() {
		return dongCode;
	}

	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}

	public String getSidoName() {
		return sidoName;
	}

	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}

	public String getGugunName() {
		return gugunName;
	}

	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}

	public String getDongName() {
		return dongName;
	}

	public void setDongName(String dongName) {
		this.dongName = dongName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Dongcode [dongCode=").append(dongCode).append(", sidoName=").append(sidoName)
				.append(", gugunName=").append(gugunName).append(", dongName=").append(dongName).append("]");
		return builder.toString();
	}
	
	
}
