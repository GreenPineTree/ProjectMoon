package com.projectmoon.cdCommon.mapper.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectmoon.cdCommon.CdCommonVO;
import com.projectmoon.cdCommon.mapper.CdCommonDao;


@Repository
// @Component
//- 영속 계층(Persistence Layer)의 DB 관련 기능을 담당
//- Spring Component bean으로 등록함
//- 스프링 프레임워크가 bean을 생성하기 위해서는
//	 root-context.xml에 bean으로 등록해야 함
//- <context: component-scan .. />
public class CdCommonDaoImple implements CdCommonDao {
	
	private static final String NAMESPACE = "cdCommonMapper";

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<CdCommonVO> selectCode(CdCommonVO cdCommonVO) {
		return sqlSession.selectList(NAMESPACE + ".selectCode", cdCommonVO);
	}


}
