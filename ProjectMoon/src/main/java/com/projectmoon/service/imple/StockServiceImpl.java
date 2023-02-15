package com.projectmoon.service.imple;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.projectmoon.domain.StockVO;
import com.projectmoon.persistence.StockDao;
import com.projectmoon.service.StockService;


@Service
public class StockServiceImpl implements StockService{

	@Autowired
	private StockService stockService;

	@Autowired
	private StockDao stockMapper;

	// 주식 정보 입력
	@Override
	public int InsertStock(StockVO stockVO) {
			int result = stockMapper.InsertStock(stockVO);
		return result;
	}

	// 주식 정보 가져오기
	@Override
	public List<StockVO> SelectStock(StockVO stockVO) {
			List<StockVO> resultList = stockMapper.SelectStock(stockVO);
		return resultList;
	}

	// 주식 정보 수정하기
	@Override
	public int UpdateStock(StockVO stockVO) {
			int result = stockMapper.UpdateStock(stockVO);
		return result;
	}

	// 주식 정보 삭제하기
	@Override
	public int DeleteStock(StockVO stockVO) {
			int result = stockMapper.DeleteStock(stockVO);
		return result;
	}

	
	
	
}
