package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.UserMapper;
import com.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper;
	
	public User loginCheck(User param) throws Exception {
		return mapper.loginCheck(param);
	}
	
	public void signUp(User param) throws Exception {
		mapper.signUp(param);
	}
	
	public int idCheck(String id) throws Exception {
		int result = 0;
		
		result = mapper.idCheck(id);
		return result;
	}

}
