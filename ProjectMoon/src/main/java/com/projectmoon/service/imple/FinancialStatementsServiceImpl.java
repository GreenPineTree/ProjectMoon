package com.projectmoon.service.imple;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.projectmoon.domain.FinancialStatementsVO;
import com.projectmoon.persistence.FinancialStatementsDao;
import com.projectmoon.service.FinancialStatementsService;


@Service
public class FinancialStatementsServiceImpl implements FinancialStatementsService{

	@Autowired
	private FinancialStatementsService financialstatementsService;

	@Autowired
	private FinancialStatementsDao financialstatementsMapper;

	
	// 기업 정보 입력
	@Override
	public int InsertCompany(FinancialStatementsVO financialStatementeVO) {
			int result = financialstatementsMapper.InsertCompany(financialStatementeVO);
		return result;
	}

	// 기업 재무상태표 입력
	@Override
	public int InsertFinancialStatements(FinancialStatementsVO financialStatementeVO) {
			int result = financialstatementsMapper.InsertFinancialStatements(financialStatementeVO);
		return result;
	}

	// 기업 정보 목록 가져오기 
	@Override
	public List<FinancialStatementsVO> SelectCompanyList(FinancialStatementsVO financialStatementeVO) {
			List<FinancialStatementsVO> resultList = financialstatementsMapper.SelectCompanyList(financialStatementeVO);
		return resultList;
	}

	// 기업 재무상태표 가져오기
	@Override
	public List<FinancialStatementsVO> SelectFinancialStatements(FinancialStatementsVO financialStatementeVO) {
			List<FinancialStatementsVO> resultList = financialstatementsMapper.SelectFinancialStatements(financialStatementeVO);
		return resultList;
	}

	// 기업 정보 수정하기 
	@Override
	public int UpdateCompany(FinancialStatementsVO financialStatementeVO) {
			int result = financialstatementsMapper.UpdateCompany(financialStatementeVO);
		return result;
	}

	// 기업 재무재표 수정하기
	@Override
	public int UpdateFinancialStatements(FinancialStatementsVO financialStatementeVO) {
		int result = financialstatementsMapper.UpdateFinancialStatements(financialStatementeVO);
		return result;
	}

	// 기업 정보 삭제하기
	@Override
	public int DeleteCompany(FinancialStatementsVO financialStatementeVO) {
			int result = financialstatementsMapper.DeleteCompany(financialStatementeVO);
		return result;
	}

	// 기업 재무상태표 삭제하기
	@Override
	public int DeleteFinancialStatements(FinancialStatementsVO financialStatementeVO) {
			int result = financialstatementsMapper.DeleteFinancialStatements(financialStatementeVO);
		return result;
	}

	
}
