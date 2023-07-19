package com.korea.k2.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(CartVO vo) {
		mybatis.insert("CART.INSERT", vo);
		
	}

	@Override
	public List<CartVO> cartList(CartVO vo) {
		
		return mybatis.selectList("CART.SELECTCARTLIST", vo);
	}

	@Override
	public void delete(CartVO vo) {
		mybatis.delete("CART.CARTDELETE", vo);
		
	}

	@Override
	public void deleteAll(CartVO vo) {
		mybatis.delete("CART.CARTDELETEALL", vo);
		
	}

	@Override
	public void update(CartVO vo) {
		mybatis.update("CART.CARTUPDATE", vo);
		
	}

	@Override
	public void insertOrderJumunseo(OrderjumunseoVO vo) {
		mybatis.insert("CART.ORDERJUMUNSEO",vo);
		
	}

	@Override
	public void insertOrderMoney(OrderMoneyVO vo) {
		System.out.println("daoimpl ==> "+ vo);
		mybatis.insert("CART.ORDERMONEY",vo);
		
	}

	@Override
	public int orderG(OrderMoneyVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("CART.ORDERG", vo);
	}

	@Override
	public List<OrderMoneyVO> MoneyList(OrderMoneyVO vo) {
		
		return mybatis.selectList("CART.SELECTMONEY", vo);
	}

	@Override
	public List<OrderOneVO> OrderOne(OrderOneVO vo) {
		
		return mybatis.selectList("CART.ORDERONE", vo);
	}

	

	


}
