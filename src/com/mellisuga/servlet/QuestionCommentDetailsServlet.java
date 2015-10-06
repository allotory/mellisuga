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

@WebServlet("/QuestionCommentDetailsServlet")
public class QuestionCommentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuestionCommentDetailsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		int question_id = Integer.parseInt(request.getParameter("question_id"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			CommentDAO commentDAO = session.getMapper(CommentDAO.class);
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			
			// 查询问题下所有评论
			List<Comment> commentList = commentDAO.queryCommentByQuestionId(question_id);
			
			List<CommentBean> commentBeanList = new ArrayList<CommentBean>();
			for(Comment c : commentList) {
				// 查询评论用户
				int member_id = c.getReviewer_id();
				Member m = memberDAO.queryMemberByID(member_id);
				
				// 设置评论Bean
				CommentBean commentBean = new CommentBean();
				commentBean.setComment(c);
				commentBean.setMember(m);
				//System.out.println(c.getContent() + "==" + m.getFullname());
				
				// 添加到List
				commentBeanList.add(commentBean);
			}
			//System.out.println("-------------------------------");
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("commentBeanList", commentBeanList);
			System.out.println(jsonObject);
			
			// 返回评论json
			out.print(jsonObject.toString());
			
//			JSONArray jsonArray = new JSONArray();
//			jsonArray.put(jsonObject);
//			System.out.println(jsonArray);
			
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
