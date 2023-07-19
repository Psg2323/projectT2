package com.korea.k2.openApi;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDaoImpl implements CompanyDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public void insert(CompanyVO vo) {
		mybatis.insert("OPENAPI.INSERT", vo);
		
	}


	@Override
	public void insertEv(EvSearchVO vo) {
		mybatis.insert("OPENAPI.EVINSERT", vo);
		
	}


	@Override
	public List<CompanyVO> list(CompanyVO vo) {
		
		return mybatis.selectList("OPENAPI.SELECT", vo);
	}


	@Override
	public List<EvSearchVO> listEv(EvSearchVO vo) {
		
		return mybatis.selectList("OPENAPI.EVSELECT", vo);
	}


	@Override
	public CompanyVO selectCompany(CompanyVO vo) {
		
		return mybatis.selectOne("OPENAPI.SELECTONE", vo);
	}


	@Override
	public EvSearchVO selectEvSearch(EvSearchVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OPENAPI.EVSELECTONE", vo);
	}

}
