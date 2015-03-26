package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mellisuga.dao.UserDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.User;

/**
 * 验证用户名唯一性
 * 
 * @author Administrator
 */
@WebServlet("/ValidateUser")
public class ValidateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ValidateUser() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			
			SqlSessionFactory sqlSessionFactory = DBConnection.getSession();
			SqlSession session = sqlSessionFactory.openSession();
			UserDAO userDAO = session.getMapper(UserDAO.class);
			
        	User user = new User();
        	user.setUsername(username);
        	user = userDAO.findUserByName(user);
        	
        	if(user == null) {
        		//用户名不存在
        		out.print("1");
        	}else {
        		out.print("0");
        	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
