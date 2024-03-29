package com.projectmoon.cdCommon;

import java.io.Serializable;


public class CdCommonVO implements Serializable{
	
	/**
	 * 
	 */
		
	// cd_code - 공통코드
	private String code; // 코드분류
	private String mainCategory; // 대분류
	private String subCategory; // 소분류
	private String properties; // 코드설명
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getProperties() {
		return properties;
	}
	public void setProperties(String properties) {
		this.properties = properties;
	}
	@Override
	public String toString() {
		return "CommonVO [code=" + code + ", mainCategory=" + mainCategory + ", subCategory=" + subCategory
				+ ", properties=" + properties + "]";
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
