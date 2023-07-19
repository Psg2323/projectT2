package com.korea.k2.cart;

import java.util.List;

public interface CartService {
	
	void insert(CartVO vo);  						// 장바구니 추가
	void delete(CartVO vo);  						// 장바구니 상품 삭제
	void deleteAll(CartVO vo); 						// 장바구니 전체 삭제
	void update(CartVO vo); 						// 장바구니 업데이트
	void insertOrderJumunseo(OrderjumunseoVO vo); 	// 주문서 저장하기
	void insertOrderMoney(OrderMoneyVO vo); 		// 주문금액 저장하기
	
	int orderG(OrderMoneyVO vo);                    // 주문서 그룹 묶기
	List<CartVO> cartList(CartVO vo); 				//장바구니 목록
	List<OrderMoneyVO> MoneyList(OrderMoneyVO vo);  // 주문 목록
	List<OrderOneVO> OrderOne(OrderOneVO vo);   	//주문서 상세보기



}
