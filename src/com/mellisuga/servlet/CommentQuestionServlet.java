package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String question_id = request.getParameter("question_id");
		System.out.println(question_id);
		
		PrintWriter out = response.getWriter();
		
		out.print("<div class='panel-body q-comment'>");
		out.print("<div class='avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1'>");
		out.print("<div class='row'>");
		out.print("<a href='#'>");
		out.print("<img src='./images/avatar/310d85e8d.jpg' class='img-responsive img-rounded' alt='Responsive image'>");
		out.print("</a>");
		out.print("</div>");
		out.print("</div><!-- end avatar and upvote col -->");
		out.print("<div class='content-details col-lg-11 col-md-11 col-sm-10 col-xs-10'>");
		out.print("<div class='row'>");
		out.print("<div class='author-info'><a href='#'><strong>空明</strong></a></div>");
		out.print("</div>");
		out.print("<div class='row'>");
		out.print("<div class='question-content'>");
		out.print("<div class='editable-content' style='display: block;'>");
		out.print("这个廉价的东西不能退、不能改签应该是常识啊");
		out.print("<span class='answer-date' style='display: block;'>");
		out.print("<a target='_blank' href='#'>发布于 14:36</a>");
		out.print("<span style='margin-left: 5px;'>");
		out.print("<a href='#' class='split'><i class='fa fa-reply'></i> 回复</a>");
		out.print("<a href='#' class='split'><i class='fa fa-thumbs-o-up'></i> 赞</a>");
		out.print("<a href='#' class='split'><i class='fa fa-flag-o'></i> 举报</a>");
		out.print("</span>");
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
