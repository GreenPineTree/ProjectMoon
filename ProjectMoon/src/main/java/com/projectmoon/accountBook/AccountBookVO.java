package com.projectmoon.accountBook;

import java.io.Serializable;


public class AccountBookVO implements Serializable{
	
	/**
	 * 
	 */
		
	
	// account_book - 가계부
	private String year; // 기준년도
	private String month; // 기준 월
	private String division; // 수익 / 비용 구분
	private String divisionDetail; // 구분 상세
	private String divisionSubDetail; // 구분 상세 세부
	private String amount; // 금액
	private String detail; // 내역
	private String date; // 발생날짜
	private String bank; // 은행
	private String bankNm; // 은행명
	
	
	// assets_management - 자산관리
	//private String year; // 기준년도
	//private String month; // 기준 월
	//private String division; // 구분
	//private String amount; // 금액
	//private String bank; // 은행
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getDivisionDetail() {
		return divisionDetail;
	}
	public void setDivisionDetail(String divisionDetail) {
		this.divisionDetail = divisionDetail;
	}
	public String getDivisionSubDetail() {
		return divisionSubDetail;
	}
	public void setDivisionSubDetail(String divisionSubDetail) {
		this.divisionSubDetail = divisionSubDetail;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBankNm() {
		return bankNm;
	}
	public void setBankNm(String bankNm) {
		this.bankNm = bankNm;
	}
	
	
	@Override
	public String toString() {
		return "AccountBookVO [year=" + year + ", month=" + month + ", division=" + division + ", divisionDetail="
				+ divisionDetail + ", divisionSubDetail=" + divisionSubDetail + ", amount=" + amount + ", detail="
				+ detail + ", date=" + date + ", bank=" + bank + ", bankNm=" + bankNm + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
}
