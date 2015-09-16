package com.mellisuga.db;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBConnection {

	// 当前sessionFactory
	private static SqlSessionFactory defaultSessionFactory;
	// 远程sessionFactory
	private static SqlSessionFactory remoteSessionFactory;
	
	static {
		try {
			defaultSessionFactory = new SqlSessionFactoryBuilder().build(
					Resources.getResourceAsReader("Configuration.xml"));
			remoteSessionFactory = new SqlSessionFactoryBuilder().build(
					Resources.getResourceAsReader("Configuration.xml"), "florisuga");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SqlSession openDefaultSession() {
		return defaultSessionFactory.openSession();
	}
	
	public static SqlSession openRemoteSession() {
		return remoteSessionFactory.openSession();
	}
	
	public static void closeSession(SqlSession sqlSession){  
        if(null != sqlSession)  
            sqlSession.close();  
    } 
}
