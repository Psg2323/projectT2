package com.korea.k2.cart;

import java.util.Date;

import lombok.Data;

@Data
public class OrderjumunseoVO {
	
	private int 	idx;
	private int 	custNo;
	private int 	cartId;
	private int 	productId;
	private int 	amount;	
	private int     orderG;
	private String 	productName;	
	private Date 	getDate;
	

}
