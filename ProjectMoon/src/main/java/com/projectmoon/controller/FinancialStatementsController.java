package com.projectmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/financialStatements")
public class FinancialStatementsController {

	
	@RequestMapping(value="/main")
	public String financialStatementsMain() {
		System.out.println("어서오세요 경제지표화면입니다.");
		
		return "/financialstatements/main";
	}
}
