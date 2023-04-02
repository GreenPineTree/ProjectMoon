package com.projectmoon.cdCommon.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectmoon.cdCommon.CdCommonVO;





public interface CdCommonService {
		
		// 코드 불러오기
		public List<CdCommonVO> selectCode(CdCommonVO commonvo);
		

}

