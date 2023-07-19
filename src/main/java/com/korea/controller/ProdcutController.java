package com.korea.controller;

import java.io.File;

import java.text.SimpleDateFormat;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.korea.k2.product.ProductService;
import com.korea.k2.product.ProductVO;

@Controller
public class ProdcutController {
	
	String path="";
	String timeStr="";

	@Autowired
	private ProductService s;
	
	
	@Autowired // 서블릿 주입하기
	private ServletContext servletContext;
	
	@PostConstruct 
	public void init() {
		path = servletContext.getRealPath("/product/files/");
	}
	
	
	@RequestMapping(value="/productList.do")
	public String selectAll(ProductVO vo, Model model) throws Exception{
			
			model.addAttribute("li", s.selectAll(vo));
			
		return "/product/productList.jsp";
	}
	
	@RequestMapping(value="/productOne.do")
	public String selectOne(ProductVO vo, Model model) throws Exception{
			
			model.addAttribute("k", s.selectOne(vo));
			
		return "/product/productEdit.jsp";
	}
	
	@RequestMapping(value="/productInsert.do")
	public String productInsert(ProductVO vo) throws Exception{
			
		long time = System.currentTimeMillis();
		SimpleDateFormat daytime =new SimpleDateFormat("yyyy/MM/dd");
		timeStr=daytime.format(time);
		
		String fileName ="";
		MultipartFile updateFile =vo.getProductImg();
		fileName=updateFile.getOriginalFilename();
		File f=new File(path+fileName);
		if( !updateFile.isEmpty()) {
			if (f.exists()) {
			  String onlyFileName =fileName.substring(0,fileName.lastIndexOf(".")); 
			  String extension =fileName.substring(fileName.lastIndexOf(".")); 
			  fileName=onlyFileName+"_"+timeStr+extension;
			}
			updateFile.transferTo(new File(path+fileName));		  
		} else {
			 fileName= "space.PNG"; // 첨부파일이 없어면 ...
		}		
		vo.setProductImgStr(fileName);
		
			s.insert(vo);
		
		return "/productList.do";
	}
	
	@RequestMapping(value="/productDelete.do")
	public String productDelete(ProductVO vo) throws Exception{
		String DelfileName = s.selectOne(vo).getProductImgStr();
		
		System.out.println("파일 이름: "+DelfileName);
		if(!DelfileName.equals("space.PNG")) {
			File delfile= new File(path+DelfileName);
			if(delfile.exists()) {
			delfile.delete();
			}
		}
		
		s.delete(vo);
		
		return "/productList.do";
	}

}
