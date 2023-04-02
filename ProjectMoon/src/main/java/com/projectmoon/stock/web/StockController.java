package com.projectmoon.stock.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectmoon.stock.StockVO;
import com.projectmoon.stock.service.StockService;


@Controller
@RequestMapping(value="/stock")
public class StockController {
	
	@Autowired
	private StockService stockService;
	
	@RequestMapping(value="/mainView")
	public String stockMain(StockVO stockVO, ModelMap model) {
		System.out.println("어서오세요 주식화면입니다.");
		System.out.println("데이터 확인 합니다 : " + stockVO);
		
		model.addAttribute("country", stockVO.getCountry());
		model.addAttribute("market", stockVO.getMarket());
		model.addAttribute("ticker", stockVO.getTicker());
		
		
		return "/stock/main";
	}

	@RequestMapping(value="/registView")
	public String stockRegistView() {
		System.out.println("어서오세요 주식화면입니다.");
		
		return "/stock/regist";
	}
	
	@ResponseBody
	@RequestMapping(value="/regist")
	public String stockRegist(@RequestBody StockVO stockVO) {
		System.out.println("데이터확인 : " + stockVO);
		String result = "SUCCESS";
		String date = stockVO.getYymm();
		date = date.replaceAll("-", "");
		date = date.substring(0, 6);
		stockVO.setYymm(date);
		
		int insertResult = stockService.InsertStock(stockVO);
		if(insertResult == 0) {
			result = "FAIL";
		}
		
		
		return result;
	}
	
	
}
