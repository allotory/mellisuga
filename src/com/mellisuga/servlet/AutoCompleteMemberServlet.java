package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/AutoCompleteMemberServlet")
public class AutoCompleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AutoCompleteMemberServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String text = request.getParameter("text");

		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			List<Member> memberList = memberDAO.queryMemberByLike(text + "%");
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("memberList", memberList);
			
			//System.out.println(jsonObject.toString());
			out.print(jsonObject.toString());

		} catch (Exception e) {
			out.print("autocompleteerror");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}

	
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
