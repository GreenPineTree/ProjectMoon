package com.projectmoon.domain;

import java.io.Serializable;


public class FinancialStatementsVO implements Serializable{
	
	/**
	 * 
	 */
	
	// company - 기업
	private String country; // 국가
	private String market; // 시장
	private String ticker; // 티커
	private String name; // 회사이름
	private String sector; // 업종
	private String subSector; // 업종상세
	private String remark; // 비고
		
	
	//financial_statements - 재무제표
//	private String country; // 국가
//	private String market; // 시장
//	private String ticker; // 티커
//	private String name; // 회사이름
	private String year; // 기준년도
	private String quarters; // 분기
	private String assets; // 자산
	private String debts; // 부채
	private String capital; // 자본
	private String revenue; // 수익
	private String cost; // 비용
	private String tax; // 세금
	private String netIncome; // 당기순이익
	private String per; // 주가수익율
	private String roe; // 자기자본이익율
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
