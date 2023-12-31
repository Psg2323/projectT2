package com.korea.k2.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao dao;
	
	@Override
	public void insert(CartVO vo) {
		dao.insert(vo);
		
		
	}

	@Override
	public List<CartVO> cartList(CartVO vo) {
		
		return dao.cartList(vo);
	}

	@Override
	public void delete(CartVO vo) {
		dao.delete(vo);
		
	}

	@Override
	public void deleteAll(CartVO vo) {
		dao.deleteAll(vo);
		
	}

	@Override
	public void update(CartVO vo) {
		dao.update(vo);
		
	}

	@Override
	public void insertOrderJumunseo(OrderjumunseoVO vo) {
		dao.insertOrderJumunseo(vo);
		
	}

	@Override
	public void insertOrderMoney(OrderMoneyVO vo) {
		dao.insertOrderMoney(vo);
		
	}

	@Override
	public int orderG(OrderMoneyVO vo) {
		
		return dao.orderG(vo);
	}

	@Override
	public List<OrderMoneyVO> MoneyList(OrderMoneyVO vo) {
		
		return dao.MoneyList(vo);
	}

	@Override
	public List<OrderOneVO> OrderOne(OrderOneVO vo) {
		
		return dao.OrderOne(vo);
	}

	

	


}
