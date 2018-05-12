package com.xhx.ssm.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.xhx.ssm.po.User;


public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

	@Override
	public User findUserById(String Id) throws Exception {
		// TODO Auto-generated method stub	
		//继承SqlSessionDaoSupport 通过this.getSqlSession()得到sqlsession
		//创建能执行映射文件中sql的sqlSession
			
        SqlSession SqlSession = this.getSqlSession();
        String statement = "config.mybatis.userMapper.findUserById";//映射sql的标识字符串
        //使用预编译的statement，在下次使用的时候就不需要在编译
        User user = SqlSession.selectOne(statement, Id);
       
		return user;
	}


	@Override
	public User UpdateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return 1;
	}

}
