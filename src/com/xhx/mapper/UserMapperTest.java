package com.xhx.mapper;

import static org.junit.Assert.*;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xhx.ssm.po.User;

public class UserMapperTest {

	/*//开发规范
	1 在mapper。xml文件中namespace等于mapper接口的的地址
	2 在mapper。xml文件中的statement的id和接口方法名一致
	3 接口的输入的参数类型和mapper。xml文件类型一致*/
	
/*	以上的开发规范对之前的以下代码自动生成
    String statement = "config.userMapper.getUser";//映射sql的标识字符串
    //使用预编译的statement，在下次使用的时候就不需要在编译
    User user = SqlSession.selectOne(statement, Id);
    SqlSession.close();
    */
	
	private  ApplicationContext ac;
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("classpath:spring/beans.xml");
	}

	@Test
	public void testFindUserById() throws Exception {
		//创建usermapper对象,mybatis自动生成Mapper代理对象
		UserMapper userMapper = (UserMapper) ac.getBean("userMapper");
		
		User user = userMapper.findUserById("33333");
		
		System.out.println(user.getSHAIN_NM());
	}

}
