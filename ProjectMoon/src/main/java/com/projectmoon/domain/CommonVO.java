package com.projectmoon.domain;

import java.io.Serializable;


public class CommonVO implements Serializable{
	
	/**
	 * 
	 */
		
	// cd_code - 공통코드
	private String code; // 코드분류
	private String maincategory; // 대분류
	private String properties; // 코드설명
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMaincategory() {
		return maincategory;
	}
	public void setMaincategory(String maincategory) {
		this.maincategory = maincategory;
	}
	public String getProperties() {
		return properties;
	}
	public void setProperties(String properties) {
		this.properties = properties;
	}
	
	
	@Override
	public String toString() {
		return "CommonVO [code=" + code + ", maincategory=" + maincategory + ", properties=" + properties + "]";
	}
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
