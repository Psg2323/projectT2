package com.korea.k2.guestbook;

import java.util.Date;

import lombok.Data;

@Data
public class GuestBookVO {
	
	private int rownum;
	private int rnum;
	private int idx;
	private int totalcount;
	
	private String title;
	private String writer;
	private String dateStr;
	private Date date_for;
	

}
