package com.projectmoon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projectmoon.domain.AccountBookVO;
import com.projectmoon.domain.CommonVO;

@Repository
// @Component
//- 영속 계층(Persistence Layer)의 DB 관련 기능을 담당
//- Spring Component bean으로 등록함
//- 스프링 프레임워크가 bean을 생성하기 위해서는
//	 root-context.xml에 bean으로 등록해야 함
//- <context: component-scan .. />
public class AccountBookDaoImple implements AccountBookDao {
	
	private static final String NAMESPACE = "com.projectmoon.persistence.AccountBookMapper";

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int InsertAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".InsertAccountBook", accountBookVO);
	}

	@Override
	public List<AccountBookVO> SelectAccountBookList(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".SelectAccountBookList", accountBookVO);
	}

	@Override
	public int UpdateAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".UpdateAccountBook", accountBookVO);
	}

	@Override
	public int DeleteAccountBook(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".DeleteAccountBook", accountBookVO);
	}
	
	@Override
	public int InsertAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".InsertAssetsManagement", accountBookVO);
	}
	
	@Override
	public List<AccountBookVO> SelectAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".SelectAssetsManagement", accountBookVO);
	}
	
	@Override
	public int UpdateAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".UpdateAssetsManagement", accountBookVO);
	}

	@Override
	public int DeleteAssetsManagement(AccountBookVO accountBookVO) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".DeleteAssetsManagement", accountBookVO);
	}

	@Override
	public List<CommonVO> selectAll() {
		System.out.println("디비 접속 확인 DAOImple ");
		return sqlSession.selectList(NAMESPACE + ".selectAll");
	}

}
