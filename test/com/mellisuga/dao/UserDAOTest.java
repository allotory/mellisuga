package com.mellisuga.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mellisuga.model.User;

public class UserDAOTest {
	
	 private static SqlSessionFactory sqlSessionFactory;
	 private static Reader reader; 

	static{
	    try{
	        reader = Resources.getResourceAsReader("Configuration.xml");
	        sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
	    }catch(Exception e){
	        e.printStackTrace();
	    }
	}
	
	public static SqlSessionFactory getSession(){
	    return sqlSessionFactory;
	}

	public static void main(String[] args) {
		SqlSession session = sqlSessionFactory.openSession();
        try {
        	UserDAO userDAO = session.getMapper(UserDAO.class);
        	User user = new User();
        	user.setUsername("admin");
        	user.setPassword("123456");
        	user.setEmail("admin@yousite.com");
        	
        	userDAO.addUser(user);
        	session.commit();
        } finally {
        	session.close();
        }
	}
}
