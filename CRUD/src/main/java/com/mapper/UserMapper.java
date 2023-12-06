package com.mapper;

import com.vo.User;

public interface UserMapper {

	public User loginCheck(User param) throws Exception;
	
	public int signUp(User param) throws Exception;
	
	public int idCheck(String param) throws Exception;
}
