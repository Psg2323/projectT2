package com.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.korea.k2.cart.CartService;
import com.korea.k2.cart.CartVO;
import com.korea.k2.cart.OrderMoneyVO;
import com.korea.k2.cart.OrderOneVO;
import com.korea.k2.cart.OrderjumunseoVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService s;
	
	@RequestMapping(value="/CartUpdate.do")
	public String CartUpdate(
					@RequestParam String[] cartId,
					@RequestParam String[] custNo,
					@RequestParam String[] productId,
					@RequestParam String[] amount ) throws Exception{
		
		String custNoStr="";
		for(int i=0; i<cartId.length; i++) {
			CartVO vo = new CartVO();
			custNoStr =  custNo[i];
			vo.setCartId(Integer.parseInt(cartId[i]));
			vo.setAmount(Integer.parseInt(amount[i]));
			s.update(vo);
		}
		return "redirect:/CartList.do?custNo="+custNoStr;
	}
	
	@RequestMapping(value="/CartOrder.do")
	public String CartOrder(
					@RequestParam String[] cartId,
					@RequestParam String[] custNo,
					@RequestParam String[] productId,
					@RequestParam String[] productName,
					@RequestParam String[] amount,
					OrderMoneyVO mvo, CartVO vo) throws Exception{
		
		String custNoStr="";
		mvo.setCustno(Integer.parseInt(custNo[0]));
		s.insertOrderMoney(mvo);
		int orderG = s.orderG(mvo);
		
		for(int i=0; i<cartId.length; i++) {
			OrderjumunseoVO ovo = new OrderjumunseoVO();
			custNoStr =  custNo[i];
			ovo.setCustNo(Integer.parseInt(custNo[i]));
			ovo.setCartId(Integer.parseInt(cartId[i]));
			ovo.setProductId(Integer.parseInt(productId[i]));
			ovo.setProductName(productName[i]);
			ovo.setAmount(Integer.parseInt(amount[i]));
			ovo.setOrderG(orderG);
			System.out.println("ovo==> "+ovo);
			s.insertOrderJumunseo(ovo);
		}
		CartVO cartVO = new CartVO();
		cartVO.setCustNo(Integer.parseInt(custNoStr));
		s.deleteAll(cartVO);
		//mvo.setCustno(Integer.parseInt(custNo[0]));
		return "redirect:/CartList.do?custNo="+custNoStr;
	}
	

	
	
	@RequestMapping(value="/CartInsert.do")
	public String CartInsert(CartVO vo) throws Exception{
			System.out.println("insert확인" + vo);
			s.insert(vo);
		
		return "/CartList.do";
	}
	
	@RequestMapping(value="/CartList.do")
	public String CartList(CartVO vo,Model model) throws Exception{
			
		model.addAttribute("li", s.cartList(vo));
			
		
		return "/cart/cartList.jsp";
	}
	
	@RequestMapping(value="/MoneyList.do")
	public String MoneyList(OrderMoneyVO vo,Model model) throws Exception{
			
		model.addAttribute("li", s.MoneyList(vo));
			
		
		return "/cart/orderMoneyList.jsp";
	}
	
	@RequestMapping(value="/OrderOne.do")
	public String OrderOne(OrderOneVO vo,Model model) throws Exception{
			
		model.addAttribute("li", s.OrderOne(vo));
			
		return "/cart/orderJumunseoList.jsp";
	}
	
	
	@RequestMapping(value="/CartDelete.do")
	public String CartDelete(CartVO vo) throws Exception{
		
			s.delete(vo);
		
		return "/CartList.do";
	}
	
	@RequestMapping(value="/CartDeleteAll.do")
	public String CartDeleteAll(CartVO vo) throws Exception{
		
			s.deleteAll(vo);
		
		return "/CartList.do";
	}

}
