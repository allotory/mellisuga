package com.mellisuga.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.TrendsBean;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.RoleDAO;
import com.mellisuga.dao.RoleMemberDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.function.TrendsFunc;
import com.mellisuga.model.Member;
import com.mellisuga.model.Role;
import com.mellisuga.model.RoleMember;
import com.mellisuga.remote.model.User;

@WebServlet("/InitServlet")
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InitServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		User u = (User) request.getSession().getAttribute("user");
		
		SqlSession defaultSession = null;
		
		try{
			defaultSession = DBConnection.openDefaultSession();
			
			// 插入成员信息
			MemberDAO memberDAO = defaultSession.getMapper(MemberDAO.class);
			Member member = new Member();
			member.setFullname(u.getUsername());
			member.setAvatar_path("./images/avatar/default.jpg");
			member.setUser_id(u.getId());
			
			memberDAO.insertMember(member);
			defaultSession.commit();
			
			// 查询成员角色
			RoleDAO roleDAO = defaultSession.getMapper(RoleDAO.class);
			Role r = new Role();
			r.setRolename("NormalUser");
			Role role = roleDAO.queryRoleByName(r);
			
			// 查询成员
			Member m = memberDAO.queryMemberByUserID(u.getId());
			
			// 插入成员角色对应关系
			RoleMemberDAO roleMemberDAO = defaultSession.getMapper(RoleMemberDAO.class);
			RoleMember roleMember = new RoleMember();
			roleMember.setMember_id(m.getId());
			roleMember.setRole_id(role.getId());
			
			roleMemberDAO.insertRoleMember(roleMember);
			defaultSession.commit();
			
			// 首页动态查询
			List<TrendsBean> trendsBeanList = new TrendsFunc()
				.getTrends(defaultSession, member, "allUser", 1);
			
			// 跳转首页
			request.getSession().setAttribute("member", m);
			request.setAttribute("trendsBeanList", trendsBeanList);
			request.getRequestDispatcher("/pages/index.jsp")
					.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(defaultSession);
		}
	}

}
