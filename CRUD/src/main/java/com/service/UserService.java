package com.service;

import com.vo.User;

public interface UserService {
	
	public User loginCheck(User param) throws Exception;
	
	public void signUp(User param) throws Exception;
	
	public int idCheck(String param) throws Exception;
}
