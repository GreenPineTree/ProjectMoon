package com.projectmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/accountBook")
public class AccountBookController {
	
	
	
	@RequestMapping(value="/main")
	public String accountBookMain() {
		System.out.println("어서오세요 가계부입니다.");
		
		return "/accountbook/main";
	}

}
