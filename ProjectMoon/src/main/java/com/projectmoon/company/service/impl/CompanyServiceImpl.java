package com.projectmoon.company.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectmoon.company.CompanyVO;
import com.projectmoon.company.mapper.CompanyDao;
import com.projectmoon.company.service.CompanyService;



@Service
//@Component
//* 서비스 계층(Service/Business layer)
//- 표현 계층(Presentation layer)과 영속 계층(Persistence layer) 사이를 연결하여
//	  두 계층이 직접적으로 통신하지 않도록 하는 역할
//- 트랜잭션(transaction) 관리
//- DB와 상과없이 데이터를 처리 가능
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDao companyDao;
	
	@Override
	public int InsertCompany(CompanyVO companyVO) {
		int result = 0;
		result = companyDao.InsertCompany(companyVO);
		
		return result;
	}

	@Override
	public CompanyVO selectCompany(CompanyVO companyVO) {
		CompanyVO resultVO = companyDao.selectCompany(companyVO);
		return resultVO;
	}
	
	@Override
	public int UpdateCompany(CompanyVO companyVO) {
		int result = 0;
		result = companyDao.UpdateCompany(companyVO);
		return result;
	}

	@Override
	public int DeleteCompany(CompanyVO companyVO) {
		int result = 0;
		result = companyDao.DeleteCompany(companyVO);
		return result;
	}

	@Override
	public List<CompanyVO> getCompanyList(CompanyVO companyVO) {
		List<CompanyVO> list = companyDao.getCompanyList(companyVO);
		return list;
	}

	@Override
	public List<CompanyVO> getCountryList() {
		List<CompanyVO> list = companyDao.getCountryList();
		
		return list;
	}

	@Override
	public List<CompanyVO> getMarketList(CompanyVO companyVO) {
		List<CompanyVO> list = companyDao.getMarketList(companyVO);
		return list;
	}



	


	
	
}
