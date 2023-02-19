package com.projectmoon.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.projectmoon.domain.StockVO;

@Repository
//@Component
//- 영속 계층(Persistence Layer)의 DB 관련 기능을 담당
//- Spring Component bean으로 등록함
//- 스프링 프레임워크가 bean을 생성하기 위해서는
//	 root-context.xml에 bean으로 등록해야 함
//- <context: component-scan .. />
public class StockDaoImple implements StockDao{

	@Override
	public int InsertStock(StockVO stockVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StockVO> SelectStock(StockVO stockVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int UpdateStock(StockVO stockVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int DeleteStock(StockVO stockVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
