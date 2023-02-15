package com.projectmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/stock")
public class StockController {
	
	
	@RequestMapping(value="/main")
	public String stockMain() {
		System.out.println("어서오세요 주식화면입니다.");
		
		return "/stock/main";
	}

}
