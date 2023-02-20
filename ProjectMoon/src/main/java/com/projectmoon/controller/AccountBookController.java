package com.projectmoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectmoon.domain.AccountBookVO;
import com.projectmoon.service.AccountBookService;


@Controller
@RequestMapping(value="/accountBook")
public class AccountBookController {
	
	@Autowired
	private AccountBookService accountBookService;
	
	@RequestMapping(value="/mainView")
	public String accountBookMain() {
		String result = "/accountbook/main";
		System.out.println("어서오세요 가계부입니다.");
		
		return result;
	}
	
	@RequestMapping(value="/registView")
	public String accountBookRegistView() {
		String result = "/accountbook/regist";
		System.out.println("가계부 등록화면입니다.");
		
		
		return result;
	}

	@RequestMapping(value="/regist")
	public String accountBookRegist(AccountBookVO accountBookVO) {
		String result = "/accountbook/main";
		System.out.println("가계부 등록합니다.");
		System.out.println(accountBookVO.toString());
		String yymmdd = accountBookVO.getDate();
		yymmdd = yymmdd.replace("-", "");
		String year = yymmdd.substring(0, 4);
		String month = yymmdd.substring(4, 6);
		String date = yymmdd.substring(6);
		
		accountBookVO.setYear(year);
		accountBookVO.setMonth(month);
		accountBookVO.setDate(date);
		System.out.println(accountBookVO.toString());
		int registResult = accountBookService.InsertAccountBook(accountBookVO);
		if(registResult != 1) {
			System.out.println("등록실패");
			result = "/accountbook/regist";
		}
		
		return result;
	}
	
	@RequestMapping(value="/listView")
	public String listView() {
		String result = "/accountbook/list";
		System.out.println("가계부 목록입니다.");
		
		return result;
	}
	
	@RequestMapping(value="/getYear")
	@ResponseBody
	public List<AccountBookVO> getYear(){
		
		List<AccountBookVO> list = accountBookService.getYear();
		return list;
	}
	
	@RequestMapping(value="/getMonth")
	@ResponseBody
	public List<AccountBookVO> getMonth(@RequestParam String year){
		
		AccountBookVO accountBookVO = new AccountBookVO();
		accountBookVO.setYear(year);
		List<AccountBookVO> list = accountBookService.getMonth(accountBookVO);
		return list;
	}
	
	@RequestMapping(value="/SelectAccountBookList")
	@ResponseBody
	public List<AccountBookVO> SelectAccountBookList(@RequestParam String year, @RequestParam String month){
		
		AccountBookVO accountBookVO = new AccountBookVO();
		accountBookVO.setYear(year);
		accountBookVO.setMonth(month);
		List<AccountBookVO> list = accountBookService.SelectAccountBookList(accountBookVO);
		return list;
	}
	
}
