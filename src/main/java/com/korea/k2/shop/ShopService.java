package com.korea.k2.shop;

import java.util.List;

public interface ShopService {
	
	void insert(MemberVO vo);
	void update(MemberVO vo);
	
	MemberVO edit(MemberVO vo);
	List<MemberVO> selectAll(MemberVO vo);
	
	int selectcustno();
	
	List<MoneyVO> ShopMoney(MoneyVO vo); //매출조회
	String idCk(MemberVO vo);//아이디 중복체크

}
