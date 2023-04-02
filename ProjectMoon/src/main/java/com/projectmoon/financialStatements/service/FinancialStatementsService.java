package com.projectmoon.financialStatements.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectmoon.financialStatements.FinancialStatementsVO;


public interface FinancialStatementsService {
		// 기업 정보 입력
		public int InsertCompany(FinancialStatementsVO financialStatementeVO);
		
		// 기업 재무상태표 입력
		public int InsertFinancialStatements(FinancialStatementsVO financialStatementeVO);
		
		// 기업 정보 목록 가져오기 
		public List<FinancialStatementsVO>SelectCompanyList(FinancialStatementsVO financialStatementeVO);

		// 기업 재무상태표 가져오기
		public List<FinancialStatementsVO>SelectFinancialStatements(FinancialStatementsVO financialStatementeVO);
		
		// 기업 정보 수정하기 
		public int UpdateCompany(FinancialStatementsVO financialStatementeVO);
		
		// 기업 재무재표 수정하기
		public int UpdateFinancialStatements(FinancialStatementsVO financialStatementeVO);
		
		// 기업 정보 삭제하기
		public int DeleteCompany(FinancialStatementsVO financialStatementeVO);
		
		// 기업 재무상태표 삭제하기
		public int DeleteFinancialStatements(FinancialStatementsVO financialStatementeVO);

}
