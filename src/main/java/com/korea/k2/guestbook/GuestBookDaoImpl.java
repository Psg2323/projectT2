package com.korea.k2.guestbook;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestBookDaoImpl implements GuestBookDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(GuestBookVO vo) {
		
		mybatis.insert("GUESTBOOK.INSERT", vo);
	}

	@Override
	public List<GuestBookVO> list(GuestBookVO vo) {
		
		System.out.println("daoimpl==>" + vo);
		return mybatis.selectList("GUESTBOOK.SELECT", vo);
	}


	@Override
	public int totalcount(GuestBookVO vo) {
		
		return mybatis.selectOne("GUESTBOOK.TOTALCOUNT");
	}

}
