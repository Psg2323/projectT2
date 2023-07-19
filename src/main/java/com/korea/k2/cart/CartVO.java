package com.korea.k2.cart;

import lombok.Data;

@Data
public class CartVO {
	
	private int cartId;
	private int custNo;
	private int productId;
	private int amount;
	private int productPrice;
	
	private String productName;
	private String productImgStr;

}
