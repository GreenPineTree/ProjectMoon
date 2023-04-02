package com.projectmoon.accountBook.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectmoon.accountBook.AccountBookVO;
import com.projectmoon.accountBook.service.AccountBookService;



@Controller
@RequestMapping(value="/accountBook")
public class AccountBookController {
	
	@Autowired
	private AccountBookService accountBookService;
	
	@RequestMapping(value="/accountBookMainView")
	public String accountBookMainView(Model model) {
		String result = "/accountbook/accountBookMainView";
		
		model.addAttribute("menuCheck", "4");
		return result;
	}
	
	@RequestMapping(value="/accountBookRegistView")
	public String accountBookRegistView(Model model) {
		String result = "/accountbook/accountBookRegistView";
		
		model.addAttribute("menuCheck", "4");
		return result;
	}
	
	@RequestMapping(value="/assetmanageView")
	public String assetmanageView(AccountBookVO accountBookVO, Model model) {
		String result = "/accountbook/assetmanageView_2";
		
		// assetManageView에서 년/월값을 받았다면 해당 값으로, 받지 않았다면 현재시점으로 검색
		if(accountBookVO.getMonth() == null || "".equals(accountBookVO.getMonth())) {
			accountBookVO = getTime(accountBookVO);
		} else {
			String getMonth = accountBookVO.getMonth();
			int intMonth = Integer.parseInt(getMonth);
			if(intMonth < 10) {
				getMonth = "0" + getMonth;
				accountBookVO.setMonth(getMonth);
			}
		}
		
		// 해당 년/월을 기준으로 현재 통장별 잔고 표시
		List<AccountBookVO> assetList = accountBookService.SelectAssetsManagement(accountBookVO);
		
		//검색 완료 후 월부분의 앞 0을 지움
		String getMonth = accountBookVO.getMonth();
		int intMonth = Integer.parseInt(getMonth);
		getMonth = "" + intMonth;
		accountBookVO.setMonth(getMonth);
		
		
		
		model.addAttribute("rtnVO", accountBookVO);
		model.addAttribute("rtnAssetList", assetList);
		model.addAttribute("menuCheck", "4");
		return result;
	}
	
	// 해당월 거래내역 불러오기
	@ResponseBody
	@RequestMapping(value="/SelectAccountBookList")
	public Map SelectAccountBookList(@RequestBody AccountBookVO accountBookVO){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		String rtnMsg = "";
		// assetManageView에서 년/월값을 받았다면 해당 값으로, 받지 않았다면 현재시점으로 검색
		if(accountBookVO.getMonth() == null || "".equals(accountBookVO.getMonth())) {
			accountBookVO = getTime(accountBookVO);
		} else {
			String getMonth = accountBookVO.getMonth();
			int intMonth = Integer.parseInt(getMonth);
			if(intMonth < 10) {
				getMonth = "0" + getMonth;
				accountBookVO.setMonth(getMonth);
			}
		}

		// 해당 년/월을 기준으로 거래내역 불러오기
		List<AccountBookVO> list = accountBookService.SelectAccountBookList(accountBookVO);
		if(list.size() < 1) {
			rtnMsg = "해당월의 거래내역이 없습니다.";
		}
		
		//검색 완료 후 월부분의 앞 0을 지움
		String getMonth = accountBookVO.getMonth();
		int intMonth = Integer.parseInt(getMonth);
		getMonth = "" + intMonth;
		accountBookVO.setMonth(getMonth);
		
		
		rtnMap.put("rtnMsg", rtnMsg);
		rtnMap.put("rtnList", list);
		return rtnMap;
	}
	
	// 관리화면 잔액 불러오기
	@ResponseBody
	@RequestMapping(value="/selectSettle")
	public Map selectSettle(@RequestBody AccountBookVO accountBookVO){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<AccountBookVO> list = accountBookService.SelectAssetsManagement(accountBookVO);
		if(list.size() < 1) {
			rtnMap.put("rtnMsg", "당월 데이터가 존재하지 않습니다.");
		}
		
		
		rtnMap.put("rtnList", list);
		return rtnMap;
	}
	
	// 현재 시간 불러오기(전역)
	public AccountBookVO getTime(AccountBookVO accountBookVO) {
		Date nowDate = new Date();
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM");
		String now = formatDate.format(nowDate);
		String[] arrNow = now.split("-");
		String year = arrNow[0];
		String month = arrNow[1];
		
		accountBookVO.setYear(year);
		accountBookVO.setMonth(month);		
		accountBookVO.setDate(nowDate.toString());
		
		return accountBookVO;
	}

	@ResponseBody
	@RequestMapping(value="/regist")
	public String accountBookRegist(@RequestBody AccountBookVO accountBookVO) {
		System.out.println("데이터 확인 : " + accountBookVO);
		String result = "SUCCESS";
		String yymmdd = accountBookVO.getDate();
		yymmdd = yymmdd.replace("-", "");
		String year = yymmdd.substring(0, 4);
		String month = yymmdd.substring(4, 6);
		String date = yymmdd.substring(6);
		
		accountBookVO.setYear(year);
		accountBookVO.setMonth(month);
		accountBookVO.setDate(date);
		int registResult = 0;
		// 이체일 경국 각각 수익 비용처리
		if("ACCOUNT_TRANSFER".equals(accountBookVO.getDivision())) {
			String bankFrom = accountBookVO.getDivisionSubDetail(); // 보내는 통장
			String bankTo = accountBookVO.getBank(); // 받는 통장
			int charge = Integer.parseInt(accountBookVO.getDetail());
			// TO(비정기_수익_기타)
			accountBookVO.setDivision("ACCOUNT_REVENUE");
			accountBookVO.setDivisionDetail("REVENUE_IRREGULAR");
			accountBookVO.setDivisionSubDetail("04");
			accountBookVO.setDetail("이체");
			registResult = accountBookService.InsertAccountBook(accountBookVO);
			// FROM(비정기_비용_기타) 원금 + 수수료(있다면)
			accountBookVO.setDivision("ACCOUNT_COST");
			accountBookVO.setDivisionDetail("COST_IRREGULAR");
			accountBookVO.setDivisionSubDetail("05");
			accountBookVO.setBank(bankFrom);
			accountBookVO.setDetail("이체");
			registResult = accountBookService.InsertAccountBook(accountBookVO);
			
			if(charge > 0) {
				accountBookVO.setDivision("ACCOUNT_COST");
				accountBookVO.setDivisionDetail("COST_IRREGULAR");
				accountBookVO.setDivisionSubDetail("05");
				accountBookVO.setBank(bankFrom);
				accountBookVO.setAmount(String.valueOf(charge));
				accountBookVO.setDetail("이체수수료");
				registResult = accountBookService.InsertAccountBook(accountBookVO);
			}
			
		} else {
			registResult = accountBookService.InsertAccountBook(accountBookVO);
		}
		if(registResult != 1) {
			System.out.println("등록실패");
			result = "FAIL";
		}
		
		return result;
	}
	
	
	@RequestMapping(value="/getYear")
	@ResponseBody
	public List<AccountBookVO> getYear(){
		
		List<AccountBookVO> list = accountBookService.getYear();
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getMonth")
	public List<AccountBookVO> getMonth(@RequestBody AccountBookVO accountBookVO){
		List<AccountBookVO> list = accountBookService.getMonth(accountBookVO);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getBalance")
	public List<AccountBookVO> getBalance(@RequestBody AccountBookVO accountBookVO){
		String month = accountBookVO.getMonth();
		String year = accountBookVO.getYear();
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
		
		accountBookVO.setYear(year);
		accountBookVO.setMonth(month);
		List<AccountBookVO> list = accountBookService.SelectAssetsManagement(accountBookVO);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getSettle")
	public List<AccountBookVO>getSettle(@RequestBody AccountBookVO accountBookVO){
		
		
		List<AccountBookVO> list = accountBookService.SelectAssetsManagement(accountBookVO);
		if(list.size() < 1) {
			list = accountBookService.SelectSettle(accountBookVO);
		}
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/setNewSettle")
	public List<AccountBookVO>setNewSettle(@RequestBody AccountBookVO accountBookVO){
		
		
		List<AccountBookVO> list = accountBookService.SelectSettle(accountBookVO);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getChart")
	public List<AccountBookVO>getChart(@RequestBody AccountBookVO accountBookVO){
		
		List<AccountBookVO> list = accountBookService.getChart(accountBookVO);
		//월별로 데이터 나열 + 목록 통일화 필요
		
		
		System.out.println("리스트 확인 : " + list);
		
		return list;
	}
	
}
