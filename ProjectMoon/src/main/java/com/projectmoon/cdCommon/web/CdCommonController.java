package com.projectmoon.cdCommon.web;

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

import com.projectmoon.cdCommon.CdCommonVO;
import com.projectmoon.cdCommon.service.CdCommonService;



@Controller
@RequestMapping(value="/cdCommon")
public class CdCommonController {
	
	@Autowired
	private CdCommonService cdCommonService;
	
	@ResponseBody
	@RequestMapping(value="/selectCode", produces = "application/json")
	public List<CdCommonVO> selectCode(@RequestBody CdCommonVO cdCommonVO) {
		
		cdCommonVO.setCode(cdCommonVO.getCode());
		List<CdCommonVO> list = cdCommonService.selectCode(cdCommonVO);
		return list;
	}
	
}
