package com.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.guestbook.GuestBookService;
import com.korea.k2.guestbook.GuestBookVO;

@Controller
public class GuestBookController {
	
	@Autowired
	private GuestBookService s;
	
	
	
	
	@RequestMapping(value="/GuestBookInsert.do")
	public String GuestBookInsert(GuestBookVO vo) throws Exception{
			
		String [] str1 = {"박","석","김","이","최","강","배","서","양"};	
		String [] str2 = {"한영","기범","준수","대경","상준","운영","선주","주영","진호","지효"};	
		String [] title = {"상품 너무 좋았어요","적극 추천","별로..","좋습니다","배송이 빨라요","친절해요","그정돈가?","잘 모르겠어요","빠르게 잘 받았습니다","상품 문의요"};	
		
		for(int i=1; i<=555; i++) {
			int k1 = (int)(Math.random()*9);
			int k2 = (int)(Math.random()*10);
			int k3 = (int)(Math.random()*10);
			
			vo.setWriter(str1[k1]+str2[k2]);
			vo.setTitle(title[k3]);
			s.insert(vo);	
		}
		return "/guestbook/insertOK.jsp";
	}
	 
	@RequestMapping(value="/GuestBookList.do")
	public String GuestBookList(GuestBookVO vo, Model model) throws Exception{
			
			int totalcount = s.totalcount(vo);
			vo.setTotalcount(totalcount);
			model.addAttribute("k", vo);
			model.addAttribute("li", s.list(vo));
			
		return "/guestbook/guestBookList.jsp";
	}
	
	
}
