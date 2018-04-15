package com.xhx.mapper;

import java.util.List;

import com.xhx.ssm.po.User;

public interface UserMapper {

	//???mapper接口如果有多个参数，那就传入pojo对象
	//dao层的代码是被公用的，即使参数只用一个pojo对象
	//
	//mapper接口mybatis自己实现这个接口(相当于dao接口)
	public User findUserById(String Id) throws Exception;
	
	//如果mapper接口返回单个的pojo对象，代理对象通过selectOne查询数据库
	//如果mapper接口返回集合对象，代理对象就调用selectList查询
	public List<User> findUserByName(User user) throws Exception;
	
	public Integer findPageCountByName(User user) throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	public User UpdateUser(User user) throws Exception;
	
	public List<User> findUserInfoByParams(User user) throws Exception;
}
