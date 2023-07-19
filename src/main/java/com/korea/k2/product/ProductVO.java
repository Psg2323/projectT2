package com.korea.k2.product;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	  private int productId;        	// 상품번호
	  private int productPrice;    	   	// 상품가격
	  
	  private String productName;     	// 상품이름
	  private String productDesc;     	// 상품설명
	  private MultipartFile productImg;	// 상품이미지
	  private String productImgStr;   	// 상품이미지Str
	  
	  private Date productDate;       	// 등록날짜
	  private String productDateStr;  	// 등록날짜Str
	  
	  private String ch1;				// 검색타입
	  private String ch2;				// 검색어

}
