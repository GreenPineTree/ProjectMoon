package com.projectmoon.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectmoon.domain.AccountBookVO;
import com.projectmoon.domain.CommonVO;
import com.projectmoon.persistence.AccountBookDao;


@Service
//@Component
//* 서비스 계층(Service/Business layer)
//- 표현 계층(Presentation layer)과 영속 계층(Persistence layer) 사이를 연결하여
//	  두 계층이 직접적으로 통신하지 않도록 하는 역할
//- 트랜잭션(transaction) 관리
//- DB와 상과없이 데이터를 처리 가능
public class AccountBookServiceImpl implements AccountBookService{

	@Autowired
	private AccountBookDao accountBookMapper;
	
	
	@Override
	public int InsertAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int InsertAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AccountBookVO> SelectAccountBookList(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AccountBookVO> SelectAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int UpdateAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int UpdateAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int DeleteAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int DeleteAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommonVO> selectAll() {
		
		System.out.println("디비 접속 확인 service ");
		return accountBookMapper.selectAll();
	}

	


	
	
}
