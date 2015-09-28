package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AnswerServlet")
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AnswerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		System.out.println("==" + username);
    	
		out.print("<!-- left main content wrap  -->");
		out.print("<div class='row left-main-content-wrap'>");
		out.print("<div class='left-main-content'>");
		out.print("<!-- avatar and upvote col -->");
		out.print("<div class='avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1'>");
		out.print("<div class='row'>");
		out.print("<a href='#'><img src='./images/avatar/310d85e8d.jpg' class='img-responsive img-rounded' alt='Responsive image'></a>");
		out.print("</div>");
		out.print("<div class='row'>");
		out.print("<div class='vote-text-center vote-number'>");
		out.print("	<a href='#'><span class='glyphicon glyphicon-chevron-up' style='display:block;'></span><span style='display:block;'>122</span></a>");
		out.print("</div>");
		out.print("<div class='vote-text-center vote-number'>");
		out.print("	<a href='#'><span class='glyphicon glyphicon-chevron-down'></span></a>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div><!-- end avatar and upvote col -->");
		out.print("<!-- content-details -->");
		out.print("<div class='content-details col-lg-11 col-md-11 col-sm-11 col-xs-11'>");
		out.print("<div class='row'>");
		out.print("<div class='content-source'>");
		out.print("<a href='#'>空明流转</a> 赞同该回答<span class='source-time'>3小时前</span>");
		out.print("</div>");
		out.print("</div>");
		out.print("<div class='row'>");
		out.print("<div class='question-link'>");
		out.print("<h5><a href='https://www.baidu.com'>除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>");
		out.print("</div>");
		out.print("</div>");
		out.print("<div class='row'>");
		out.print("<div class='author-info'><a id='namez' href='#'></a>,<span>RednaxelaFX</span></div>");
		out.print("</div>");
		out.print("<div class='row'>");
		out.print("<div class='question-content'>");
		out.print("<div id='answers' class='editable-content' style='display: block;'>");
		out.print("这个廉价的东西不能退、不能改签应该是常识啊");
		out.print("<span class='answer-date' style='display: block;'><a target='_blank' href='#'>发布于 14:36</a></span>");
		out.print("</div>");
		out.print("<div class='summary-content clearfix' style='display: none;'>");
		out.print("这个廉价的东西不能退、不能改签应该是常识啊");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
		out.print("<div class='row'>");
		out.print("<div class='meta-panel'>");
		out.print("<a class='meta-item' href='javascript:;'><span class='glyphicon glyphicon-plus'></span> 关注问题</a>");
		out.print("<a href='#' class='meta-item'><span class='glyphicon glyphicon-comment'></span> 添加评论</a>");
		out.print("<a href='#' class='meta-item' data-thanked='false'><span class='glyphicon glyphicon-heart-empty'></span> 感谢</a>");
		out.print("<a href='#' class='meta-item'><span class='glyphicon glyphicon-share-alt'></span> 分享</a>");
		out.print("<a href='#' class='meta-item'><span class='glyphicon glyphicon-bookmark'></span> 收藏</a>");
		out.print("<span class='bull'>•</span>");
		out.print("<a href='#' class='meta-item'>没有帮助</a>");
		out.print("<span class='bull'>•</span>");
		out.print("<a href='#' class='meta-item goog-inline-block' style='-webkit-user-select: none;'>举报</a>");
		out.print("<span class='copyright'></span>");
		out.print("<a href='#' class='answer-collapse meta-item'><span class='glyphicon glyphicon-open'></span> 收起</a>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div><!-- end content-details -->");
		out.print("</div><!-- end left main content -->");
		out.print("</div><!--end left main content wrap  -->");

		out.print("<div class='row'>");
		out.print("<hr/>");
		out.print("</div>");
    	
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
