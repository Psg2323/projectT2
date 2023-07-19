package com.korea.k2.shop;

import java.util.List;

public interface ShopDao {
	
	void insert(MemberVO vo);
	void update(MemberVO vo);
	
	MemberVO edit(MemberVO vo);
	int selectcustno();
	List<MemberVO> selectAll(MemberVO vo);
	
	List<MoneyVO> ShopMoney(MoneyVO vo);
	
	String idCk(MemberVO vo);
}
