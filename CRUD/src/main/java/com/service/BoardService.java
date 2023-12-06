package com.service;

import java.util.List;

import com.vo.Board;
import com.vo.Comment;
import com.vo.Search;

public interface BoardService {

	public List<Board> boardList(Search param) throws Exception;
	
	public int boardCount(Search param) throws Exception;
	
	public Board boardView(int param) throws Exception;
	
	public int views(Board param) throws Exception;
	
	public List<Comment> commentList(int param) throws Exception;
	
	public int commentWrite(Comment param) throws Exception;
	
	public int boardDelete(int param) throws Exception;
	
	public int commentDelete(int param) throws Exception;
	
	public int boardModify(Board param) throws Exception;
	
	public int boardWrite(Board param) throws Exception;
}
