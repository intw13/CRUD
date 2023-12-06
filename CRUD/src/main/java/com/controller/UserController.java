package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.UserService;
import com.vo.User;

@Controller
public class UserController {

    @Autowired
    UserService service;

    @GetMapping("/login")
    public String login() {
        return "/user/login";
    }

    @PostMapping("/login")
    public String loginCheck(HttpServletRequest req, User user) throws Exception {
        User us = service.loginCheck(user);

        HttpSession session = req.getSession(); // 세션에 아이디,이름,회원등급

        session.setAttribute("userId", us.getUserId());
        session.setAttribute("userName", us.getUserName());
        session.setAttribute("userRank", us.getUserRank());

        return "redirect:/board/lists";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession();

        session.invalidate();

        return "redirect:/";
    }

    @GetMapping("/signup")
    public String register() {

        return "/user/signup";
    }

    // 회원가입
    @PostMapping("/signup")
    public String register2(User user) throws Exception {
    	
        service.signUp(user);

        return "redirect:/";
    }
    // 중복확인
    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam String userId) throws Exception {
    	
    	// 값 자바스크립트에 넘김
        return service.idCheck(userId);
    }
}
