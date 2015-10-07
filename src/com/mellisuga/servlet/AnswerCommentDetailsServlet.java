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

import com.mellisuga.bean.CommentBean;
import com.mellisuga.dao.CommentDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Comment;
import com.mellisuga.model.Member;

@WebServlet("/AnswerCommentDetailsServlet")
public class AnswerCommentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AnswerCommentDetailsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			CommentDAO commentDAO = session.getMapper(CommentDAO.class);
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			
			// 查询问题下所有评论
			List<Comment> commentList = commentDAO.queryCommentByAnswerId(answer_id);
			
			List<CommentBean> commentBeanList = new ArrayList<CommentBean>();
			for(Comment c : commentList) {
				// 查询评论用户
				int member_id = c.getReviewer_id();
				Member m = memberDAO.queryMemberByID(member_id);
				
				// 设置评论Bean
				CommentBean commentBean = new CommentBean();
				commentBean.setComment(c);
				commentBean.setMember(m);
				
				// 添加到List
				commentBeanList.add(commentBean);
			}
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("commentBeanList", commentBeanList);
			//System.out.println(jsonObject);
			
			// 返回评论json
			out.print(jsonObject.toString());
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
