package com.projectmoon.service.imple;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectmoon.domain.AccountBookVO;
import com.projectmoon.persistence.AccountBookDao;
import com.projectmoon.service.AccountBookService;


@Service
public class AccountBookServiceImpl implements AccountBookService{

	@Autowired
	private AccountBookService accountBookService;
	
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

	


	
	
}
