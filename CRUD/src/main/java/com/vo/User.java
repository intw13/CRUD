package com.vo;

import java.util.Date;

import lombok.Data;

@Data
public class User {
	
	private String userId;
	private String userPass;
	private String userEmail;
	private String userName;
	private String gender;
	private Date regdate;
	private String userRank;
}
