package com.projectmoon.company;

import java.io.Serializable;

public class CompanyVO implements Serializable{
	
	/**
	 * 
	 */
	
	// Company 회사테이블
	private String country;
	private String market;
	private String ticker;
	private String name;
	private String sector;
	private String remark;
	
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMarket() {
		return market;
	}
	public void setMarket(String market) {
		this.market = market;
	}
	public String getTicker() {
		return ticker;
	}
	public void setTicker(String ticker) {
		this.ticker = ticker;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "CompanyVO [country=" + country + ", market=" + market + ", ticker=" + ticker + ", name=" + name
				+ ", sector=" + sector + ", remark=" + remark + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
