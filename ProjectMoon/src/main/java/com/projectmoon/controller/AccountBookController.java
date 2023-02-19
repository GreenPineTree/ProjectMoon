package com.projectmoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("어서오세요 가계부입니다.");
		
		return "/accountbook/main";
	}
	
	@RequestMapping(value="/registView")
	public String accountBookRegistView() {
		System.out.println("가계부 등록화면입니다.");
		
		
		return "/accountbook/regist";
	}

	@RequestMapping(value="/regist")
	public String accountBookRegist(AccountBookVO accountBookVO) {
		System.out.println("가계부 등록합니다.");
		System.out.println(accountBookVO.toString());
		
		return "/accountbook/main";
	}
}
