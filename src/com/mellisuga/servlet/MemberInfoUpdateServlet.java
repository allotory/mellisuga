package com.mellisuga.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.MemberDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;

@WebServlet("/MemberInfoUpdateServlet")
public class MemberInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberInfoUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Member m = (Member) request.getSession().getAttribute("member");

		String fullname = request.getParameter("fullname");
		String gender = request.getParameter("gender");
		String autograph = request.getParameter("autograph");
		String location = request.getParameter("location");
		String business = request.getParameter("business");
		String employment = request.getParameter("employment");
		String position = request.getParameter("position");
		String education = request.getParameter("education");
		String major = request.getParameter("major");
		String description = request.getParameter("description");
		
		SqlSession session = DBConnection.openDefaultSession();
		MemberDAO memberDAO = session.getMapper(MemberDAO.class);
		
		try {
			
			// 插入成员信息
			Member member = memberDAO.queryMemberByID(m.getId());
			
			// 处理全名
			if(fullname != null && !fullname.equals("")) {
				member.setFullname(fullname);
			}
			
			// 处理性别
			if(gender != null && !gender.equals("")) {
				switch(gender) {
					case "male" :
						member.setGender(1);
						break;
					case "female" :
						member.setGender(2);
						break;
					case "other" :
						member.setGender(3);
						break;
				}
			}
			
			if(autograph != null && !autograph.equals("")) {
				member.setAutograph(autograph);
			}
			if(location != null && !location.equals("")) {
				member.setLocation(location);
			}
			if(business != null && !business.equals("")) {
				member.setBusiness(business);
			}
			if(employment != null && !employment.equals("")) {
				member.setEmployment(employment);
			}
			if(position != null && !position.equals("")) {
				member.setPosition(position);
			}
			if(education != null && !education.equals("")) {
				member.setEducation(education);
			}
			if(major != null && !major.equals("")) {
				member.setMajor(major);
			}
			if(description != null && !description.equals("")) {
				member.setDescription(description);
			}
			
			memberDAO.updateMember(member);
			session.commit();

			// 重定向到用户页面
			request.getSession().setAttribute("member", member);
	        response.sendRedirect(request.getContextPath()
					+ "/HomeServlet?id=" + m.getId() + "&pageNum=1");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

}
