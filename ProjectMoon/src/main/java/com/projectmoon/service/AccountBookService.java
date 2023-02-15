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

}

