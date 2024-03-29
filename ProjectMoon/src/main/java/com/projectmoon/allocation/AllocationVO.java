package com.projectmoon.allocation;

import java.io.Serializable;

public class AllocationVO implements Serializable{
	
	/**
	 * 
	 */
	
	// stock - 주가테이블
	private String country; // 국가
	private String market; // 시장
	private String ticker; // 티커
	private String name; // 회사
	private String yymm; // 기준년도
	private String dividendPerShare; // 주당배당금
	private String odds; // 배당율
	
	
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
	public String getYymm() {
		return yymm;
	}
	public void setYymm(String yymm) {
		this.yymm = yymm;
	}
	public String getDividendPerShare() {
		return dividendPerShare;
	}
	public void setDividendPerShare(String dividendPerShare) {
		this.dividendPerShare = dividendPerShare;
	}
	public String getOdds() {
		return odds;
	}
	public void setOdds(String odds) {
		this.odds = odds;
	}
	
	@Override
	public String toString() {
		return "Allocation [country=" + country + ", market=" + market + ", ticker=" + ticker + ", name=" + name
				+ ", yymm=" + yymm + ", dividendPerShare=" + dividendPerShare + ", odds=" + odds + "]";
	}
	
	
	
	
	
	
	
	
}
