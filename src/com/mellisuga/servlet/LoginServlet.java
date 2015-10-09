package com.mellisuga.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.TrendsBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;
import com.mellisuga.remote.dao.UserDAO;
import com.mellisuga.remote.model.User;
import com.mellisuga.security.Encryption;
import com.mellisuga.utils.IPUtils;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("remember_me");

		// System.out.println("=" + email + "=" + password + "=" + rememberMe);

		SqlSession remoteSession = null;
		SqlSession defaultSession = null;

		try {
			remoteSession = DBConnection.openRemoteSession();
			defaultSession = DBConnection.openDefaultSession();

			// 查询校验用户
			UserDAO userDAO = remoteSession.getMapper(UserDAO.class);
			User user = new User();
			user.setEmail(email);
			User u = userDAO.queryUserByEmail(user);

			if (u == null) {
				// 用户不存在
				request.getSession().setAttribute("flag", "notexist");
				response.sendRedirect(request.getContextPath()
						+ "/pages/login.jsp");
			}

			// 密码加密
			String encryptPass = new Encryption().sha256Encode(password
					+ u.getSalt());

			if (u != null && encryptPass.equals(u.getPassword())) {

				// 判断是否记住密码
				if (rememberMe != null && "yes".equals(rememberMe)) {
					// TODO cookie
					// TODO cookie
					// TODO cookie
					// TODO cookie
				}

				// 查询个人资料
				MemberDAO memberDAO = defaultSession.getMapper(MemberDAO.class);
				Member member = memberDAO.queryMemberByUserID(u.getId());

				// 用户存在，判断是否已初始化
				if (member == null) {
					// 用户存在，但尚未初始化，跳转到info页面
					request.getSession().setAttribute("user", u);
					response.sendRedirect(request.getContextPath()
							+ "/pages/info.jsp");
				} else {
					// 用户存在，资料已初始化，正常登录
					
					//更新IP
					String last_login_ip = IPUtils.getIP(request);

					// 更新日期
					Date date = new Date();
					String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date); 
					Timestamp now = Timestamp.valueOf(dateFormate);

					u.setLast_login_ip(last_login_ip);
					u.setLast_login_time(now);
					userDAO.updateUser(u);
					
					remoteSession.commit();
					
					// 首页动态查询
					TrendsDAO trendsDAO = defaultSession.getMapper(TrendsDAO.class);
					AnswersDAO answersDAO = defaultSession.getMapper(AnswersDAO.class);
					List<Trends> trendsList = trendsDAO.queryAllTrends();
					List<TrendsBean> trendsBeanList = new ArrayList<TrendsBean>();
					
					QuestionDAO questionDAO = defaultSession.getMapper(QuestionDAO.class);
					
					if(trendsList != null) {
						for(Trends t : trendsList) {
							
							TrendsBean trendsBean = null;
							
							// 动态类型—— FollowingQuestion, AgreeWithThisAnswer, AnswerThisQuestion, AskAQuestion
							if("FollowingQuestion".equals(t.getTrends_type())) {
								// 1：关注该问题
								
							} else if("AgreeWithThisAnswer".equals(t.getTrends_type())) {
								// 2：赞同该回答
								trendsBean = new TrendsBean();
								trendsBean.setTrends(t);
								
								// 查询回答问题信息
								Question question = new Question();
								question.setId(t.getP_trends_id());
								Question q = questionDAO.queryQuestionById(question);
								trendsBean.setQuestion(q);
								
								// 查询答案
								Answers answers = new Answers();
								answers.setId(t.getTrends_id());
								answers = answersDAO.queryAnswerById(answers);
								trendsBean.setAnswer(answers);

								// 查询回答用户
								Member m = memberDAO.queryMemberByUserID(answers.getAuthor_id());
								trendsBean.setMember(m);
								
								// 查询点赞用户
								Member tm = memberDAO.queryMemberByID(t.getTrends_member());
								trendsBean.setTrendsMember(tm);
								
							} else if("AnswerThisQuestion".equals(t.getTrends_type())) {
								// 3：回答了该问题
								trendsBean = new TrendsBean();
								trendsBean.setTrends(t);
								
								// 查询回答问题信息
								Question question = new Question();
								question.setId(t.getP_trends_id());
								Question q = questionDAO.queryQuestionById(question);
								trendsBean.setQuestion(q);
								
								// 查询答案
								Answers answers = new Answers();
								answers.setId(t.getTrends_id());
								answers = answersDAO.queryAnswerById(answers);
								trendsBean.setAnswer(answers);
								
								// 查询回答用户
								Member m = memberDAO.queryMemberByUserID(answers.getAuthor_id());
								trendsBean.setMember(m);
								
							} else if("AskAQuestion".equals(t.getTrends_type())) {
								// 4：提了一个问题
								trendsBean = new TrendsBean();
								trendsBean.setTrends(t);
								
								// 查询所提问题信息
								Question question = new Question();
								question.setId(t.getTrends_id());
								Question q = questionDAO.queryQuestionById(question);
								trendsBean.setQuestion(q);
								
								Member m = memberDAO.queryMemberByUserID(q.getMember_id());
								trendsBean.setMember(m);
							}
							trendsBeanList.add(trendsBean);
						}
					}
					
					request.getSession().setAttribute("member", member);
					request.setAttribute("trendsBeanList", trendsBeanList);
					request.getRequestDispatcher("/pages/index.jsp")
							.forward(request, response);
				}

			} else {
				// 用户存在，但密码不正确
				request.getSession().setAttribute("flag", "notexist");
				response.sendRedirect(request.getContextPath()
						+ "/pages/login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(defaultSession);
			DBConnection.closeSession(remoteSession);
		}

	}

}
