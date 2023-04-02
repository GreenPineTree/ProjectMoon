package com.projectmoon.company.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectmoon.company.CompanyVO;
import com.projectmoon.company.service.CompanyService;


@Controller
@RequestMapping(value="/company")
public class CompanyController {
	
	@Autowired
	private CompanyService companyService;
	
	
	@RequestMapping(value="/mainView")
	public String companyMain() {
		System.out.println("어서오세요 기업화면입니다");
		
		return "/company/main";
	}
	
	@RequestMapping(value="/registView")
	public String companyRegist() {
		
		return "/company/regist";
	}
	
	@ResponseBody
	@RequestMapping(value="/regist")
	public String accountBookRegist(@RequestBody CompanyVO companyVO) {
		System.out.println("데이터 확인 : " + companyVO);
		String result = "SUCCESS";
		int registResult = 0;
		
		registResult = companyService.InsertCompany(companyVO);
		System.out.println("insert 확인 : " + registResult);
		if(registResult != 1) {
			System.out.println("등록실패");
			result = "FAIL";
		}
		
		return result;
	}

	
	@ResponseBody
	@RequestMapping(value="/selectCompany")
	public CompanyVO selectCompany(@RequestBody CompanyVO companyVO) {
		System.out.println("데이터 확인 : " + companyVO);
		CompanyVO resultVO = companyService.selectCompany(companyVO);
		
		return resultVO;
	}
	
	@ResponseBody
	@RequestMapping(value="/getCompanyList")
	public List<CompanyVO> getCompanyList(@RequestBody CompanyVO companyVO) {
		System.out.println("데이터 확인 : " + companyVO);
		List<CompanyVO> list = companyService.getCompanyList(companyVO);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getCountryList")
	public List<CompanyVO> getCountryList(){
		List<CompanyVO> list = companyService.getCountryList();
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getMarketList")
	public List<CompanyVO> getMarketList(@RequestBody CompanyVO companyVO){
		List<CompanyVO> list = companyService.getMarketList(companyVO);
		return list;
	}
	
	
}
