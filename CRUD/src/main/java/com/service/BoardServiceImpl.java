package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.BoardMapper;
import com.vo.Board;
import com.vo.Comment;
import com.vo.Search;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper mapper;
	
	public List<Board> boardList(Search param) throws Exception{
		return mapper.boardList(param);
	}
	public int boardCount(Search param) throws Exception {
		return mapper.boardCount(param);
	}
	public Board boardView(int param) throws Exception {
		return mapper.boardView(param);
	}
	
	public int views(Board param) throws Exception {
		return mapper.views(param);
	}
	
	public List<Comment> commentList(int param) throws Exception {
		return mapper.commentList(param);
	}
	public int commentWrite(Comment param) throws Exception {
		return mapper.commentWrite(param);
	}
	
	public int boardDelete(int param) throws Exception{
		return mapper.boardDelete(param);
	}
	
	public int commentDelete(int param) throws Exception {
		return mapper.commentDelete(param);
	}
	
	public int boardModify(Board param) throws Exception {
		return mapper.boardModify(param);
	}
	
	public int boardWrite(Board param) throws Exception {
		return mapper.boardWrite(param);
	}
}
