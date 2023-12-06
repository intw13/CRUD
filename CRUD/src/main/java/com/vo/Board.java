package com.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {

	private int content_id;
	private String title;
	private String writedid;
	private String content;
	private Date regdate;
	private String filepath;
	private int hit;
	private String boardId;
}