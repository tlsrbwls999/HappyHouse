package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class MemberDto implements Serializable{
	private String name;
	private String id;
	private String password;
	private String email;
	private int age;
	
	public MemberDto() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", id=" + id + ", pwd=" + password + ", email=" + email + ", age=" + age + "]";
	}
	
	

}
