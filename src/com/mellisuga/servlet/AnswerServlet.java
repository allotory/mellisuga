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

import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;

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

		Member m = (Member) request.getSession().getAttribute("member");
		String question_id = request.getParameter("question_id");
		String ans = request.getParameter("answers");
		String is_anonymous = request.getParameter("is_anonymous");
		
		// 更新日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 查询问题
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
			Question question = new Question();
			question.setId(Integer.parseInt(question_id));
			Question q = questionDAO.queryQuestionById(question);
			
			// 更新问题信息
			q.setAnswers_num(q.getAnswers_num() + 1);
			q.setFollowers_num(q.getFollowers_num() + 1);
			q.setLast_updated(now);
			q.setScan_num(q.getScan_num() + 1);
			q.setReply_num(q.getReply_num() + 1);
			questionDAO.updateQuestion(q);
			
			// 插入答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			Answers answers = new Answers();
			answers.setQuestion_id(q.getId());
			answers.setAuthor_id(m.getId());
			answers.setAnswers(ans);
			answers.setAnswer_date(now);
			answers.setReply_num(0);
			answers.setIs_top_answer(0);
			if(is_anonymous != null) {
				answers.setIs_anonymous(0);
			} else {
				answers.setIs_anonymous(1);
			}
			answersDAO.insertAnswer(answers);
			
			// 更新用户信息（回答数）
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			m.setAnswer_num(m.getAnswer_num() + 1);
			memberDAO.updateMember(m);
			
			session.commit();
			
			// 重新查询用户信息
			m = memberDAO.queryMemberByUserID(m.getId());
			request.getSession().setAttribute("member", m);
			
			// 返回消息
			out.print("<!-- left main content wrap  -->");
			out.print("<div class='row left-main-content-wrap'>");
			out.print("<div class='left-main-content'>");
			out.print("<!-- avatar and upvote col -->");
			out.print("<div class='avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1'>");
			out.print("<div class='row'>");
			out.print("<a href='#'><img src='"+ m.getAvatar_path() +"' class='img-responsive img-rounded' alt='Responsive image'></a>");
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
			// 赞同部分
//			out.print("<div class='row'>");
//			out.print("<div class='content-source'>");
//			out.print("<a href='#'>空明流转</a> 赞同该回答<span class='source-time'>3小时前</span>");
//			out.print("</div>");
//			out.print("</div>");
			// 问题标题
//			out.print("<div class='row'>");
//			out.print("<div class='question-link'>");
//			out.print("<h5><a href='https://www.baidu.com'>除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>");
//			out.print("</div>");
//			out.print("</div>");
			out.print("<div class='row'>");
			out.print("<div class='author-info'><a href='#'><strong>" + m.getFullname() +"</strong></a>,<span>"+ m.getAutograph() +"</span></div>");
			out.print("</div>");
			out.print("<div class='row'>");
			out.print("<div class='question-content'>");
			out.print("<div id='answers' class='editable-content' style='display: block;'>");
			out.print(answers.getAnswers());
			out.print("<span class='answer-date' style='display: block;'><a target='_blank' href='#'>发布于" + now + "</a></span>");
			out.print("</div>");
			out.print("<div class='summary-content clearfix' style='display: none;'>");
			out.print(answers.getAnswers());
			out.print("</div>");
			out.print("</div>");
			out.print("</div>");
			out.print("<div class='row'>");
			out.print("<div class='meta-panel'>");
			//out.print("<a class='meta-item' href='javascript:;'><span class='glyphicon glyphicon-plus'></span> 关注问题</a>");
			out.print("<a href='#' class='meta-item'><span class='glyphicon glyphicon-comment'></span> 添加评论</a>");
			out.print("<a href='#' class='meta-item' data-thanked='false'><span class='glyphicon glyphicon-heart-empty'></span> 感谢</a>");
			out.print("<a href='#' class='meta-item'><span class='glyphicon glyphicon-share-alt'></span> 分享</a>");
			out.print("<a href='#' class='meta-item'><span class='glyphicon glyphicon-bookmark'></span> 收藏</a>");
//			out.print("<span class='bull'>•</span>");
//			out.print("<a href='#' class='meta-item'>没有帮助</a>");
//			out.print("<span class='bull'>•</span>");
//			out.print("<a href='#' class='meta-item goog-inline-block' style='-webkit-user-select: none;'>举报</a>");
//			out.print("<span class='copyright'></span>");
			out.print("<a href='#' class='answer-collapse meta-item'><span class='glyphicon glyphicon-open'></span> 收起</a>");
			out.print("</div>");
			out.print("</div>");
			out.print("</div><!-- end content-details -->");
			out.print("</div><!-- end left main content -->");
			out.print("</div><!--end left main content wrap  -->");

			out.print("<div class='row'>");
			out.print("<hr style='margin-top:12px;margin-bottom:12px;'/>");
			out.print("</div>");
			
		} catch(Exception e) {
			out.println("Post answer error!");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
