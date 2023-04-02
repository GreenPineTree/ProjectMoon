package com.projectmoon.allocation.mapper;

import java.util.List;

import com.projectmoon.allocation.AllocationVO;




public interface AllocationDao {
	
	// 배당 정보 입력
	public int InsertAllocation(AllocationVO allocationVO);
	
	// 배당 정보 가져오기
	public List<AllocationVO> SelectAllocation(AllocationVO allocationVO);

	// 배당 정보 수정하기 
	public int UpdateAllocation(AllocationVO allocationVO);
	
	// 배당 정보 삭제하기
	public int DeleteAllocation(AllocationVO allocationVO);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
