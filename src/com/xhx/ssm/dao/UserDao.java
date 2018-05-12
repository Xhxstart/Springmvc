package com.xhx.ssm.dao;

import com.xhx.ssm.po.User;

public interface UserDao {

	public User findUserById(String Id) throws Exception;
	
	public int insertUser(User user) throws Exception;
	
	public User UpdateUser(User user) throws Exception;
}
