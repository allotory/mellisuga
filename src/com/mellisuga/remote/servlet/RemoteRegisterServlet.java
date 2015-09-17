package com.mellisuga.remote.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.db.DBConnection;
import com.mellisuga.remote.dao.RoleUserDAO;
import com.mellisuga.remote.dao.UserDAO;
import com.mellisuga.remote.model.RoleUser;
import com.mellisuga.remote.model.User;
import com.mellisuga.security.Encryption;
import com.mellisuga.security.Salt;
import com.mellisuga.utils.IPUtils;

@WebServlet("/RemoteRegisterServlet")
public class RemoteRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoteRegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// request parameter
		String username = request.getParameter("rusername");
		String password = request.getParameter("rpassword");
		String email = request.getParameter("remail");
		
		// IP
		String last_login_ip = IPUtils.getIP(request);
		
		// 密码盐
		String salt = Salt.getSalt();
		// 密码加密
		Encryption en = new Encryption();
		
		// 日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date); 
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		SqlSession session = null;
		
		try {
			session = DBConnection.openRemoteSession();

			// 用户
			UserDAO userDAO = session.getMapper(UserDAO.class);
			
			User user = new User();
			user.setUsername(username);
			user.setPassword(en.sha256Encode(password + salt));
			user.setSalt(salt);
			user.setEmail(email);
			user.setCreate_time(now);
			user.setLast_login_time(now);
			user.setLast_login_ip(last_login_ip);
			user.setStatus(1);
			user.setRemark("普通用户");
			
			userDAO.insertUser(user);
			session.commit();
			
			// 查询user id
			User u = userDAO.queryUserByName(user);
			//System.out.println(u.getId());
			//System.out.println(u.getUsername());
			
			// 用户角色
			RoleUserDAO roleUserDAO = session.getMapper(RoleUserDAO.class);
			
			RoleUser roleUser = new RoleUser();
			roleUser.setRole_id(1);
			roleUser.setUser_id(u.getId());
			roleUserDAO.insertRoleUser(roleUser);
			
			session.commit();
			
			request.getSession().setAttribute("flag", "regsuccess");
			response.sendRedirect(request.getContextPath() 
					+ "/pages/login.jsp");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

}
