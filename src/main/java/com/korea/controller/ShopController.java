package com.korea.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.shop.MemberVO;
import com.korea.k2.shop.MoneyVO;
import com.korea.k2.shop.ShopService;

@Controller
public class ShopController {
	//생성자
	ShopController(){
		System.out.println("--> shopController");
	}
	
	@Autowired
	private ShopService s;
	
	
	
	@RequestMapping(value="/ShopSelectAll.do")
	public String selectAll(MemberVO vo, Model model) throws Exception{
			
			model.addAttribute("li", s.selectAll(vo));
		
		return "/shop/shop_selectAll.jsp";
	}
	
	@RequestMapping(value="/ShopSales.do")
	public String ShopSales(Model model,MoneyVO vo) throws Exception{
			
			System.out.println("controller-->"+vo);
			model.addAttribute("li", s.ShopMoney(vo));
		
		return "/shop/shop_money.jsp";
	}
	
	
	@RequestMapping(value="/ShopForm.do")
	public String ShopForm(Model model) throws Exception{
		
		
		model.addAttribute("custno", s.selectcustno());
		
		return "/shop/shop_form.jsp";
	}
	
	
	@RequestMapping(value="/ShopFormOk.do")
	public String ShopFormOk(MemberVO vo) throws Exception{
			
			String pwd=BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
			vo.setPassword(pwd);
			s.insert(vo);
		
		return "/ShopSelectAll.do";
	}
	
	@RequestMapping(value="/ShopEdit.do")
	public String ShopEdit(MemberVO vo, HttpSession session) throws Exception{
			
			s.edit(vo);
			session.setAttribute("m", s.edit(vo));
			
		return "/shop/shop_edit.jsp";
	}
	
	@RequestMapping(value="/ShopUpdateOk.do")
	public String ShopUpdateOk(MemberVO vo) throws Exception{
			
			s.update(vo);
		
		return "/ShopSelectAll.do";
	}
	
	@RequestMapping(value="/IdCheck.do")
	public void IdCheck(HttpServletResponse response ,MemberVO vo) throws Exception{
			
		PrintWriter out = response.getWriter();
		String str = s.idCk(vo);
		System.out.println("str: "+str);	
		if(str==null) {
			out.print("T");
		}else {
			out.print("F");
		}
	}

}
