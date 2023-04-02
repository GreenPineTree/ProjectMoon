package com.projectmoon.allocation.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/allocation")
public class AllocationController {
	
	
	@RequestMapping(value="/mainView")
	public String stockMain() {
		System.out.println("어서오세요 주식화면입니다.");
		
		return "/stock/main";
	}

	@RequestMapping(value="/registView")
	public String stockRegist() {
		System.out.println("어서오세요 주식화면입니다.");
		
		return "/stock/regist";
	}
	
	
	
}
