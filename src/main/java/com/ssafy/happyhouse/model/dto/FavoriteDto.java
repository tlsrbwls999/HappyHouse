package com.ssafy.happyhouse.model.dto;

public class FavoriteDto {
	int no;
	String sido;
	String gugun;
	String dong;
	String id;
	
	public FavoriteDto() {};
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "FavoriteDto [no=" + no + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong + ", id=" + id + "]";
	}
	
	
}
