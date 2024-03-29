package com.projectmoon.financialStatements.mapper.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.projectmoon.financialStatements.FinancialStatementsVO;
import com.projectmoon.financialStatements.mapper.FinancialStatementsDao;


@Repository
//@Component
//- 영속 계층(Persistence Layer)의 DB 관련 기능을 담당
//- Spring Component bean으로 등록함
//- 스프링 프레임워크가 bean을 생성하기 위해서는
//	 root-context.xml에 bean으로 등록해야 함
//- <context: component-scan .. />
public class FinancialStatementsDaoImple implements FinancialStatementsDao {

	private static final String NAMESPACE = "financialStatementsMapper";
	
	@Override
	public int InsertCompany(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int InsertFinancialStatements(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FinancialStatementsVO> SelectCompanyList(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FinancialStatementsVO> SelectFinancialStatements(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int UpdateCompany(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int UpdateFinancialStatements(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int DeleteCompany(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int DeleteFinancialStatements(FinancialStatementsVO financialStatementeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
