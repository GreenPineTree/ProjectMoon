package com.projectmoon.accountBook.mapper;

import java.util.List;
import java.util.Map;

import com.projectmoon.accountBook.AccountBookVO;


public interface AccountBookDao {
	
	// 기업 정보 입력
	public int InsertAccountBook(AccountBookVO accountBookVO);
	
	// 기업 정보 목록 가져오기 
	public List<AccountBookVO>SelectAccountBookList(AccountBookVO accountBookVO);

	// 기업 정보 수정하기 
	public int UpdateAccountBook(AccountBookVO accountBookVO);
	
	// 기업 정보 삭제하기
	public int DeleteAccountBook(AccountBookVO accountBookVO);
	
	// 기업 재무상태표 입력
	public int InsertAssetsManagement(AccountBookVO accountBookVO);
	
	// 기업 재무상태표 가져오기
	public List<AccountBookVO>SelectAssetsManagement(AccountBookVO accountBookVO);
	
	// 기업 재무재표 수정하기
	public int UpdateAssetsManagement(AccountBookVO accountBookVO);
	
	// 기업 재무상태표 삭제하기
	public int DeleteAssetsManagement(AccountBookVO accountBookVO);

	// 해당 연도 가져오기
	public List<AccountBookVO>getYear();
	
	// 해당 월 가져오기
	public List<AccountBookVO>getMonth(AccountBookVO accountBookVO);
	
	// 월말정산 금액 게산하기
	public AccountBookVO SelectSumAssets(AccountBookVO accountBookVO);
	
	// 전월 잔액 가져오기
	public AccountBookVO SelectAssetsBalance(AccountBookVO accountBookVO);
	
	// 차트그리기
	// 구분 가져오기
	public List<AccountBookVO>getDivisionDetail(AccountBookVO accountBookVO);
	
	// 세부 합산 및 이름 가져오기
	public List<AccountBookVO>getDivsionSubDetailSum(AccountBookVO accountBookVO);
	
	
	
	
	
	
	
}
