package com.projectmoon.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectmoon.domain.AccountBookVO;


public interface AccountBookService {
		// 가계부 정보 입력
		public int InsertAccountBook(AccountBookVO accountBookVO);
		
		// 자산 정보 입력
		public int InsertAssetsManagement(AccountBookVO accountBookVO);
		
		// 가계부 목록 가져오기 
		public List<AccountBookVO>SelectAccountBookList(AccountBookVO accountBookVO);

		// 자산 목록 가져오기
		public List<AccountBookVO>SelectAssetsManagement(AccountBookVO accountBookVO);
		
		// 가계부 수정하기
		public int UpdateAccountBook(AccountBookVO accountBookVO);
		
		// 자산 수정하기
		public int UpdateAssetsManagement(AccountBookVO accountBookVO);
		
		// 기업 정보 삭제하기
		public int DeleteAccountBook(AccountBookVO accountBookVO);
		
		// 자산 삭제하기
		public int DeleteAssetsManagement(AccountBookVO accountBookVO);
		
		// 해당 연도 가져오기
		public List<AccountBookVO>getYear();
		
		// 해당 월 가져오기
		public List<AccountBookVO>getMonth(AccountBookVO accountBookVO);
		

		// 정산 값 가져오기
		public List<AccountBookVO>SelectSettle(AccountBookVO accountBookVO);
		
		// 차트그리기
		// 구분 가져오기
		public List<AccountBookVO>getDivisionDetail(AccountBookVO accountBookVO);
		
		// 세부 합산 및 이름 가져오기
		public List<AccountBookVO>getDivsionSubDetailSum(AccountBookVO accountBookVO);
		
		public List<AccountBookVO>getChart(AccountBookVO accountBookVO);
}

