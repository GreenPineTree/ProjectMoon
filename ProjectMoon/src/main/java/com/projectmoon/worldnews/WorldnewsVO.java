package com.projectmoon.worldnews;

import java.io.Serializable;


public class WorldnewsVO implements Serializable{
	
	/**
	 * 
	 */
		

	// economic_indicator - 경제지표
	private String country; // 국가
	private String year; // 기준년도
	private String month; // 기준월
	private String cpi; // 소비자물가지수
	private String core_cpi; // 근원소비자물가지수
	private String pce; // 개인소비지출물가지수
	
	

	// news - 뉴스
//	private String country; // 국가
	private String market; // 시장
	private String ticker; // 티커
//	private String year; // 기준년도
//	private String month; // 기준월
	private String date; // 기준일
	private String news; // 내용

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
