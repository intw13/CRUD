package com.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Comment {

	private int content_id;
	private int comment_id;
	private String writedid;
	private String content;
	private Date regdate;
	
}
