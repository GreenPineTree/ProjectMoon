package com.projectmoon.service;

import java.util.ArrayList;
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
public class AccountBookServiceImpl implements AccountBookService{

	@Autowired
	private AccountBookDao accountBookDao;
	
	@Autowired
	private CdCommonDao cdCommonDao;
	
	@Override
	public int InsertAccountBook(AccountBookVO accountBookVO) {

		return accountBookDao.InsertAccountBook(accountBookVO);
	}

	@Override
	public List<AccountBookVO> SelectAccountBookList(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.SelectAccountBookList(accountBookVO);
	}

	@Override
	public int UpdateAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.UpdateAccountBook(accountBookVO);
	}

	@Override
	public int DeleteAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.DeleteAccountBook(accountBookVO);
	}
	
	@Override
	public int InsertAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.InsertAssetsManagement(accountBookVO);
	}
	
	@Override
	public List<AccountBookVO> SelectAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.SelectAssetsManagement(accountBookVO);
	}
	
	@Override
	public int UpdateAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.UpdateAssetsManagement(accountBookVO);
	}

	@Override
	public int DeleteAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.DeleteAssetsManagement(accountBookVO);
	}

	@Override
	public List<AccountBookVO> getYear() {
		// TODO Auto-generated method stub
		return accountBookDao.getYear();
	}

	@Override
	public List<AccountBookVO> getMonth(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.getMonth(accountBookVO);
	}

	@Override
	public List<AccountBookVO> SelectSettle(AccountBookVO accountBookVO) {
		// 돌려줄 list 선언
		List<AccountBookVO> list = new ArrayList<AccountBookVO>();
		
		String month = accountBookVO.getMonth();
		String year = accountBookVO.getYear();
		String calYear = year;
		String calMonth = month;
		System.out.println("받은 데이터 상태 : " + accountBookVO);
		// 전월 구하기
		int intmonth = Integer.parseInt(month);
		int intyear = Integer.parseInt(year);
		intmonth = intmonth -1 ;
		if(intmonth == 0) {
			intyear = intyear -1;
			intmonth = 12;
		}
		year = String.valueOf(intyear);
		if(intmonth < 10) {
			month = "0" + String.valueOf(intmonth);
		} else {
			month = String.valueOf(intmonth);
		}
		
		AccountBookVO prevVO = new AccountBookVO();
		prevVO.setMonth(month);
		prevVO.setYear(year);
		
		// 1. 은행 목록 가져오기
		CommonVO commonVO = new CommonVO();
		commonVO.setCode("BANK");
		List<CommonVO> bankList = cdCommonDao.selectCode(commonVO);
		
		// 2. 전월잔액
		for(int i = 0; i < bankList.size(); i++) {
			commonVO = bankList.get(i);
			String bank = commonVO.getMainCategory();
			prevVO.setBank(bank);
			AccountBookVO balanceVO = accountBookDao.SelectAssetsBalance(prevVO);
			System.out.println("잔액 상태 : " + balanceVO);
			if(balanceVO != null ) {
				
				int balance = Integer.parseInt(balanceVO.getAmount());
				
				// 3. 당월 수익 / 비용 & 이체 		
				// 3-1 수익 vo
				AccountBookVO revenueVO = new AccountBookVO();
				revenueVO.setBank(bank);
				revenueVO.setYear(calYear);
				revenueVO.setMonth(calMonth);
				revenueVO.setDivision("ACCOUNT_REVENUE");
				revenueVO = accountBookDao.SelectSumAssets(revenueVO);
				int revenue = 0;
				if(revenueVO != null) {
					revenue = Integer.parseInt(revenueVO.getAmount());
				}
				
				
				// 3-2 비용 vo
				AccountBookVO costVO = new AccountBookVO();
				costVO.setBank(bank);
				costVO.setYear(calYear);
				costVO.setMonth(calMonth);
				costVO.setDivision("ACCOUNT_COST");
				costVO = accountBookDao.SelectSumAssets(costVO);
				int cost = 0;
				if(costVO != null) {
					cost = Integer.parseInt(costVO.getAmount());
				}
				
				
				// 4. 잔액 계산
				String amount = String.valueOf(balance + revenue - cost );
				System.out.println("잔액 : " + balance);
				System.out.println("수익 : " + revenue);
				System.out.println("비용 : " + cost);
				// 5. accountBookVO에 담아 list로 추가
				accountBookVO.setBank(bank);
				accountBookVO.setAmount(amount);
				list.add(accountBookVO);
				
				// 6. 해당 연월의 정산이 있는지 확인 후, 없다면 insert, 있다면 update를 진행
				AccountBookVO confirmVO = accountBookDao.SelectAssetsBalance(accountBookVO);
				if(confirmVO == null) {
					accountBookDao.InsertAssetsManagement(accountBookVO);
				} else {
					accountBookDao.UpdateAssetsManagement(accountBookVO);
				}
			} 
		}
		
		
		return list;
	}

	@Override
	public List<AccountBookVO> getDivisionDetail(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.getDivisionDetail(accountBookVO);
	}

	@Override
	public List<AccountBookVO> getDivsionSubDetailSum(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return accountBookDao.getDivsionSubDetailSum(accountBookVO);
	}

	@Override
	public List<AccountBookVO> getChart(AccountBookVO accountBookVO) {
		// 해당 연도에 존재하는 월 구하기
		String year = accountBookVO.getYear();
		List<AccountBookVO> monthList = accountBookDao.getMonth(accountBookVO);
		List<AccountBookVO> list = new ArrayList<AccountBookVO>();
		// 월 별 구분 구하기
		for(int i = 0; i < monthList.size(); i++) {
			AccountBookVO monthVO = monthList.get(i);
			monthVO.setYear(year);
			String month = monthVO.getMonth();
			List<AccountBookVO> divisionList = accountBookDao.getDivisionDetail(monthVO);
			
			// 구분에 따른 세부 합산 및 이름 가져오기
			for(int j = 0; j < divisionList.size(); j++) {
				AccountBookVO divisionVO = divisionList.get(j);
				divisionVO.setYear(year);
				divisionVO.setMonth(month);
				String divisionDetail = divisionVO.getDivisionDetail();
				
				List<AccountBookVO> sumList = accountBookDao.getDivsionSubDetailSum(divisionVO);
				
				// 구한 모든 값을 list에 합치기
				for(int z = 0; z < sumList.size(); z++) {
					AccountBookVO listVO = sumList.get(z);
					listVO.setYear(year);
					listVO.setMonth(month);
					listVO.setDivisionDetail(divisionDetail);
					
					list.add(listVO);
				}
				
			}
			
		}
		
		return list;
	}


	


	
	
}
