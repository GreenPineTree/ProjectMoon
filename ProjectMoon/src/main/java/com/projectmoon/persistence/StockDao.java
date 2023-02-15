package com.projectmoon.persistence;

import java.util.List;
import java.util.Map;

import com.projectmoon.domain.StockVO;



public interface StockDao {
	
	// 주식 정보 입력
	public int InsertStock(StockVO stockVO);
	
	// 주식 정보 가져오기
	public List<StockVO> SelectStock(StockVO stockVO);

	// 주식 정보 수정하기 
	public int UpdateStock(StockVO stockVO);
	
	// 주식 정보 삭제하기
	public int DeleteStock(StockVO stockVO);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
