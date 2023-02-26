package com.projectmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/company")
public class CompanyController {
	
	
	@RequestMapping(value="/mainView")
	public String companyMain() {
		System.out.println("어서오세요 기업화면입니다");
		
		return "/company/main";
	}

}
