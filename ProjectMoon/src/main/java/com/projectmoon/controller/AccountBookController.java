package com.projectmoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectmoon.domain.CommonVO;
import com.projectmoon.service.AccountBookService;


@Controller
@RequestMapping(value="/accountBook")
public class AccountBookController {
	
	@Autowired
	private AccountBookService accountBookService;
	
	@RequestMapping(value="/main")
	public String accountBookMain() {
		System.out.println("어서오세요 가계부입니다.");
		
		return "/accountbook/main";
	}
	
	@RequestMapping(value="/regist")
	public String accountBookRegist(Model model) {
		System.out.println("가계부 등록화면입니다.");
		
		System.out.println("수입 / 지출 / 이체 구분 불러오기");
		List<CommonVO> commonVO = accountBookService.selectAll();
		
		model.addAttribute("ab", commonVO);
		return "/accountbook/regist";
	}

	@ResponseBody
	@RequestMapping(value="/selectAB")
	public String selectAB() {
		
		
		
		return "";
	}
}
