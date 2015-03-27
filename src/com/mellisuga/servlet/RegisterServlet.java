package com.mellisuga.servlet;

import java.io.IOException;

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
import com.mellisuga.security.Encryption;

/**
 * 用户注册
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		//接收参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmpsw = request.getParameter("confirmpsw");
		String email = request.getParameter("email");
		
		System.out.println(username + password + confirmpsw + email);
		if(!(!confirmpsw.equals(password) | confirmpsw == "" | password == "")) {
			//密码加密
			Encryption e = new Encryption();
			String password1 = e.encryptionPwd(password, "MD5");
			String password2 = e.encryptionPwd(password1 + password, "SHA");
			String password3 = e.encryptionPwd(password2 + username, "MD5");
			
			//数据存储
			SqlSessionFactory sqlSessionFactory = DBConnection.getSession();
			SqlSession session = sqlSessionFactory.openSession();
			try {
	        	UserDAO userDAO = session.getMapper(UserDAO.class);
	        	User user = new User();
	        	user.setUsername(username);
	        	user.setPassword(password3);
	        	user.setEmail(email);
	        	
	        	userDAO.addUser(user);
	        	session.commit();
	        } finally {
	        	session.close();
	        }
			
			
			//首页数据...
			
			
			

			//重定向到首页
			response.sendRedirect(request.getContextPath() 
					+ "/pages/frontend/index.jsp"); 
		}else {
			System.out.println("System error!");
		}
	}

}
