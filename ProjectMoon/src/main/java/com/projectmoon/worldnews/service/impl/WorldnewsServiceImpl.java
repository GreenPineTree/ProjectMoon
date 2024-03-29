package com.projectmoon.worldnews.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.projectmoon.worldnews.WorldnewsVO;
import com.projectmoon.worldnews.mapper.WorldnewsDao;
import com.projectmoon.worldnews.service.WorldnewsService;



@Service
public class WorldnewsServiceImpl implements WorldnewsService{

	@Autowired
	private WorldnewsDao worldnewsMapper;

	// 경제지표 정보 입력
	@Override
	public int InsertEconomicIndicator(WorldnewsVO worldnewsVO) {
			int result = worldnewsMapper.InsertEconomicIndicator(worldnewsVO);
		return result;
	}

	// 뉴스 정보 입력
	@Override
	public int InsertNews(WorldnewsVO worldnewsVO) {
			int result = worldnewsMapper.InsertNews(worldnewsVO);
		return result;
	}

	// 경제지표 정보 가져오기
	@Override
	public List<WorldnewsVO> SelectEconomicIndicator(WorldnewsVO worldnewsVO) {
			List<WorldnewsVO> resultList = worldnewsMapper.SelectEconomicIndicator(worldnewsVO);
		return resultList;
	}

	// 뉴스 정보 가져오기
	@Override
	public List<WorldnewsVO> SelectNews(WorldnewsVO worldnewsVO) {
			List<WorldnewsVO> resultList = worldnewsMapper.SelectNews(worldnewsVO);
		return resultList;
	}

	// 경제지표 정보 수정하기
	@Override
	public int UpdateEconomicIndicator(WorldnewsVO worldnewsVO) {
			int result = worldnewsMapper.UpdateEconomicIndicator(worldnewsVO);
		return result;
	}

	// 뉴스 정보 수정하기
	@Override
	public int UpdateNews(WorldnewsVO worldnewsVO) {
			int result = worldnewsMapper.UpdateNews(worldnewsVO);
		return result;
	}

	// 경제지표 정보 삭제하기
	@Override
	public int DeleteEconomicIndicator(WorldnewsVO worldnewsVO) {
			int result = worldnewsMapper.DeleteEconomicIndicator(worldnewsVO);
		return result;
	}

	// 뉴스 정보 삭제하기
	@Override
	public int DeleteNews(WorldnewsVO worldnewsVO) {
			int result = worldnewsMapper.DeleteNews(worldnewsVO);
		return result;
	}

	
	

	
}
