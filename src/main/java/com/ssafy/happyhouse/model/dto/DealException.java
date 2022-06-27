package com.ssafy.happyhouse.model.dto;

public class DealException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3299933864926320845L;
	public DealException() {
		super("거래 정보 처리 중 오류 발생");
	}
	public DealException(String msg) {
		super(msg);
	}
}
