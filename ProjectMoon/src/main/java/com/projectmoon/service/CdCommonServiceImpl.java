package com.projectmoon.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectmoon.domain.AccountBookVO;
import com.projectmoon.domain.CommonVO;
import com.projectmoon.persistence.AccountBookDao;
import com.projectmoon.persistence.CdCommonDao;


@Service
//@Component
//* 서비스 계층(Service/Business layer)
//- 표현 계층(Presentation layer)과 영속 계층(Persistence layer) 사이를 연결하여
//	  두 계층이 직접적으로 통신하지 않도록 하는 역할
//- 트랜잭션(transaction) 관리
//- DB와 상과없이 데이터를 처리 가능
public class CdCommonServiceImpl implements CdCommonService{

	@Autowired
	private CdCommonDao cdCommonDao;
	

	@Override
	public List<CommonVO> selectCode(CommonVO commonvo) {
		
		return cdCommonDao.selectCode(commonvo);
	}


	
	
}
