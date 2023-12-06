package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.service.BoardService;
import com.vo.Board;
import com.vo.Comment;
import com.vo.Search;


@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/lists")
	public String lists(HttpServletRequest req, Search sv, Model model) throws Exception {
		
		sv.setPageInt(1);
		if (sv.getPage() != null && !sv.getPage().equals("")) {
			sv.setPageInt(Integer.parseInt(sv.getPage()));
		}
		
		List<Board> list = service.boardList(sv);
		int boardCount = service.boardCount(sv);
		
		model.addAttribute("list",list);
		model.addAttribute("count",boardCount);
		
		return "board/board";
	}
	
	@GetMapping("/view")
	public String detail(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		String bid = req.getParameter("id");
		int bid2 = Integer.parseInt(bid); //게시글 아이디

		Board board = service.boardView(bid2); // 게시글 자세히보기
		List<Comment> comment = service.commentList(bid2); // 댓글 리스트
		
		HttpSession session = req.getSession();

		session.setAttribute("bid", bid);

		String sessionId = (String) req.getSession().getAttribute("userId");
		String sessionRank = (String) req.getSession().getAttribute("userRank");
		String rank = "";
		if(sessionRank != null) {
			if (sessionRank.equals("1") || sessionId.equals(board.getWritedid())) {
				rank = "Y";
			}
		}
		if(sessionId == null) {
			sessionId = "";
		}

		Cookie[] cookies = req.getCookies(); // 쿠키 설정
		boolean idFound = false;

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("Hit_cookie") && cookie.getValue().contains(bid)) {
					idFound = true;
					break;
				}
			}
		}
		if (!idFound) {
			service.views(board); // 게시글 조회수 +1
			Cookie newCookie = new Cookie("Hit_cookie", bid);
			newCookie.setMaxAge(60 * 60 * 2);
			res.addCookie(newCookie);
		}

		model.addAttribute("rank", rank); // 등급
		model.addAttribute("view", board); // 게시글
		model.addAttribute("comment", comment); // 댓글
		return "board/view";
	}

	@PostMapping("/view")
	public String comment(HttpServletRequest req, @RequestParam String content) throws Exception {
		Comment comment = new Comment();

		String id = req.getParameter("id");

		comment.setContent(content);
		comment.setContent_id(Integer.parseInt(id));
		comment.setWritedid((String) req.getSession().getAttribute("userId"));

		service.commentWrite(comment);

		return "redirect:/board/view" + "?id=" + id;
	}
	
	@GetMapping("/write")
	public String regedit() {

		return "board/write";
	}

	@PostMapping("/write")
	public String regedit2(HttpServletRequest req, Board board,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) throws Exception {

		board.setWritedid((String) req.getSession().getAttribute("userId"));

		if (file != null && !file.isEmpty()) {

			String fileName = file.getOriginalFilename();
			String folderPath = servletContext.getRealPath("/resources/upload");
			String filePath = folderPath + File.separator + fileName;
			String saveFolder = folderPath + File.separator;

			File folder = new File(saveFolder);
			if (!folder.exists()) {
				folder.mkdir();
			}

			InputStream ism = file.getInputStream();
			FileOutputStream fos = new FileOutputStream(filePath);

			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = ism.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}

			fos.close();
			ism.close();

			board.setFilepath(fileName);
		}
		service.boardWrite(board);

		return "redirect:/board/lists";
	}
	
	@GetMapping("/modify")
	public String modify(HttpServletRequest req, Model model) throws Exception {
		int bid = Integer.parseInt(req.getParameter("id"));

		Board board = service.boardView(bid);

		model.addAttribute("board", board);

		return "board/modify";
	}

	@PostMapping("/modify")
	public String modify2(Board board) throws Exception {
		
		service.boardModify(board);

		return "redirect:/board/lists";
	}
	
	@GetMapping("/boardDelete")
	public String deleteBrd(HttpServletRequest req) throws Exception {
		int bid = Integer.parseInt(req.getParameter("id"));

		service.boardDelete(bid);

		return "redirect:/board/lists";
	}

	@GetMapping("/commentDelete")
	public String deleteCmt(HttpServletRequest req) throws Exception {
		int cid = Integer.parseInt(req.getParameter("id"));
		
		String bid = (String) req.getSession().getAttribute("bid");

		service.commentDelete(cid);

		return "redirect:/board/view" + "?id=" + bid;
	}

}
