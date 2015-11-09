package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;

import com.mellisuga.dao.MemberDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;

@WebServlet("/MemberInfoServlet")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberInfoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		SqlSession session = DBConnection.openDefaultSession();
		MemberDAO memberDAO = session.getMapper(MemberDAO.class);
		
		try {
			
			Member member = memberDAO.queryMemberByID(id);
			
			List<Member> memberList = new ArrayList<Member>();
			memberList.add(member);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("memberList", memberList);
			
			// 返回评论json
			//System.out.println(jsonObject.toString());
			out.print(jsonObject.toString());
		} catch (Exception e) {
			out.print("querymemberinfoerror");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
