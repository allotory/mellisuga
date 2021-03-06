package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.ThanksDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;

@WebServlet("/UnThankAuthorServlet")
public class UnThankAuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UnThankAuthorServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 删除感谢作者
			ThanksDAO thanksDAO = session.getMapper(ThanksDAO.class);
			HashMap<String, Object> thanksMap = new HashMap<String, Object>();
			thanksMap.put("answer_id", answer_id);
			thanksMap.put("thanker_id", m.getId());
			thanksDAO.deleteThanksByAMId(thanksMap);
			
			// 查询问题
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			Answers answer = new Answers();
			answer.setId(answer_id);
			answer = answersDAO.queryAnswerById(answer);
			
			// 更新用户
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			Member member = memberDAO.queryMemberByID(answer.getAuthor_id());
			member.setThank_num(member.getThank_num() - 1);
			memberDAO.updateMember(member);
			
			session.commit();
		} catch(Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
