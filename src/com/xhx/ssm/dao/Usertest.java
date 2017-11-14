package com.xhx.ssm.dao;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xhx.ssm.po.User;

public class Usertest extends UserDaoImpl {

	private ApplicationContext ac;
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("classpath:spring/beans.xml");
	}

	@Test
	public void test() throws Exception {
		UserDao userdao = (UserDao) ac.getBean("UserDao");
		User user = userdao.findUserById("22222");
		System.out.println(user.getSHAIN_NM().toString());
	}

}
