package com.ssafy.happyhouse.model.dto;

public class NewsDto {
	
	int no;
	String title;
	int date;
	String url;
	
	public NewsDto(String title,int date) {
		this.title=title;
		this.date=date;
	}
	
	public NewsDto(int no,String title, int date) {
		super();
		this.no=no;
		this.title = title;
		this.date = date;
	}
	
	public NewsDto(int no,String title,int date,String url) {
		this.no=no;
		this.title = title;
		this.date = date;
		this.url = url;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
