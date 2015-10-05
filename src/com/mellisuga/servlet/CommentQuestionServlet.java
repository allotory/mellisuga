package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.CommentDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Comment;
import com.mellisuga.model.Member;

@WebServlet("/CommentQuestionServlet")
public class CommentQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentQuestionServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		int question_id = Integer.parseInt(request.getParameter("question_id"));
		String content = request.getParameter("comment_content");
		
		// 更新日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			CommentDAO commentDAO = session.getMapper(CommentDAO.class);
			Comment comment = new Comment();
			comment.setQuestion_id(question_id);
			comment.setAnswer_id(0);
			comment.setReviewer_id(m.getId());
			comment.setParent_comment_id(0);
			comment.setContent(content);
			comment.setComment_date(now);
			comment.setFavour_num(0);
			
			commentDAO.insertComment(comment);
			
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}

		// 返回评论
		out.print("<div class='panel-body q-comment'>");
		out.print("<div class='avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1'>");
		out.print("<div class='row'>");
		out.print("<a href='#'>");
		out.print("<img src='" + m.getAvatar_path() + "' class='img-responsive img-rounded' alt='Responsive image'>");
		out.print("</a>");
		out.print("</div>");
		out.print("</div><!-- end avatar and upvote col -->");
		out.print("<div class='content-details col-lg-11 col-md-11 col-sm-10 col-xs-10'>");
		out.print("<div class='row'>");
		out.print("<div class='author-info'><a href='#'><strong>" + m.getFullname() + "</strong></a></div>");
		out.print("</div>");
		out.print("<div class='row'>");
		out.print("<div class='question-content'>");
		out.print("<div class='editable-content' style='display: block;'>");
		out.print(content);
		out.print("<span class='answer-date' style='display: block;'>");
		out.print("<a target='_blank' href='#'>发布于 " + now + "</a>");
		out.print("<span style='margin-left: 5px;'>");
		out.print("<a href='#' class='split'><i class='fa fa-reply'></i> 回复</a>");
		out.print("<a href='#' class='split'><i class='fa fa-thumbs-o-up'></i> 赞</a>");
		out.print("<a href='#' class='split'><i class='fa fa-flag-o'></i> 举报</a>");
		out.print("</span>");
		out.print("<a href='#' class='split module-right'>0赞</a>");
		out.print("</span>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div><!-- end comment-details -->");
		out.print("</div>");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
