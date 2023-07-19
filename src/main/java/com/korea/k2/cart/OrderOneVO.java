package com.korea.k2.cart;

import java.util.Date;

import lombok.Data;

@Data
public class OrderOneVO {
	
	private int baesongbi;
	private int totalMoney;
	private int orderG;
	private int idx;
	private int productId;
	private int amount;
	private int custNo;
	
	private Date getDate;
	
	private String custName;
	private String productName;
	private String phone;
	private String address;
	private String pstcode;
	private String detailaddress;

}
