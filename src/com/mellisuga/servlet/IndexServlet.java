package com.mellisuga.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.TrendsBean;
import com.mellisuga.bean.VoterBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.FollowDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.dao.VoteDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;
import com.mellisuga.model.Vote;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession defaultSession = null;

		try {
			defaultSession = DBConnection.openDefaultSession();

			// 首页动态查询
			TrendsDAO trendsDAO = defaultSession.getMapper(TrendsDAO.class);
			AnswersDAO answersDAO = defaultSession.getMapper(AnswersDAO.class);
			MemberDAO memberDAO = defaultSession.getMapper(MemberDAO.class);
			VoteDAO voteDAO = defaultSession.getMapper(VoteDAO.class);
			FollowDAO followDAO = defaultSession.getMapper(FollowDAO.class);
			List<Trends> trendsList = trendsDAO.queryAllTrends();
			List<TrendsBean> trendsBeanList = new ArrayList<TrendsBean>();
			
			QuestionDAO questionDAO = defaultSession.getMapper(QuestionDAO.class);
			
			if(trendsList != null) {
				for(Trends t : trendsList) {
					
					TrendsBean trendsBean = null;
					
					// 动态类型—— FollowingQuestion, AgreeWithThisAnswer, AnswerThisQuestion, AskAQuestion
					if("FollowingQuestion".equals(t.getTrends_type())) {
						// 1：关注该问题
						trendsBean = new TrendsBean();
						trendsBean.setTrends(t);
						
						// 查询所提问题信息
						Question question = new Question();
						question.setId(t.getTrends_id());
						Question q = questionDAO.queryQuestionById(question);
						trendsBean.setQuestion(q);
						
						Member mm = memberDAO.queryMemberByUserID(t.getTrends_member());
						trendsBean.setMember(mm);
						
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
						Member member = memberDAO.queryMemberByUserID(answers.getAuthor_id());
						trendsBean.setMember(member);
						
						// 查询点赞用户
						Member tm = memberDAO.queryMemberByID(t.getTrends_member());
						trendsBean.setTrendsMember(tm);
						
						// 查询是否投票
						HashMap<String, Object> voteMap = new HashMap<String, Object>();
						voteMap.put("answer_id", answers.getId());
						voteMap.put("voter_id", m.getId());
						Vote vote = voteDAO.queryVoteAUid(voteMap);
						trendsBean.setVote(vote);
						
						// 查询所有点了赞同的用户
						List<Vote> voteUpList = voteDAO.queryVoteByAid(answers.getId());
						List<Member> memberList = new ArrayList<Member>();
						VoterBean voterBean = new VoterBean();
						
						if(voteUpList != null && !voteUpList.isEmpty()) {
							// 点赞用户大于0
							voterBean.setUpCount(voteUpList.size());
							
							int length = voteUpList.size() >= 3 ? voteUpList.size() - 3 : 0;
							
							for(int i = (voteUpList.size() - 1); i >= length; i --) {
								Member voter = memberDAO.queryMemberByID(
										voteUpList.get(i).getVoter_id());
								memberList.add(voter);
							}
							
							voterBean.setVoterList(memberList);
						} else if(voteUpList == null) {
							// 还没有人点过赞
							voterBean.setUpCount(0);
							voterBean.setVoterList(null);
						}
						
						trendsBean.setVoterBean(voterBean);
						
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
						Member member = memberDAO.queryMemberByID(answers.getAuthor_id());
						trendsBean.setMember(member);
						// 查询是否投票
						HashMap<String, Object> voteMap = new HashMap<String, Object>();
						voteMap.put("answer_id", answers.getId());
						voteMap.put("voter_id", m.getId());
						Vote vote = voteDAO.queryVoteAUid(voteMap);
						trendsBean.setVote(vote);
						
						// 查询所有点了赞同的用户
						List<Vote> voteUpList = voteDAO.queryVoteByAid(answers.getId());
						List<Member> memberList = new ArrayList<Member>();
						VoterBean voterBean = new VoterBean();
						
						if(voteUpList != null && !voteUpList.isEmpty()) {
							// 点赞用户大于0
							voterBean.setUpCount(voteUpList.size());
							
							int length = voteUpList.size() >= 3 ? voteUpList.size() - 3 : 0;
							
							for(int i = (voteUpList.size() - 1); i >= length; i --) {
								Member voter = memberDAO.queryMemberByID(
										voteUpList.get(i).getVoter_id());
								memberList.add(voter);
							}
							
							voterBean.setVoterList(memberList);
						} else if(voteUpList == null) {
							// 还没有人点过赞
							voterBean.setUpCount(0);
							voterBean.setVoterList(null);
						}
						
						trendsBean.setVoterBean(voterBean);
						
					} else if("AskAQuestion".equals(t.getTrends_type())) {
						// 4：提了一个问题
						trendsBean = new TrendsBean();
						trendsBean.setTrends(t);
						
						// 查询所提问题信息
						Question question = new Question();
						question.setId(t.getTrends_id());
						Question q = questionDAO.queryQuestionById(question);
						trendsBean.setQuestion(q);

						// 提问用户
						Member member = memberDAO.queryMemberByID(q.getMember_id());
						trendsBean.setMember(member);
					}
					
					// 查询是否关注该问题
					HashMap<String, Object> followMap = new HashMap<String, Object>();
					followMap.put("question_id", trendsBean.getQuestion().getId());
					followMap.put("follower_id", m.getId());
					int count = followDAO.isExistInFollow(followMap);
					boolean isFollowing = count > 0 ? true: false;   
					trendsBean.setFollowing(isFollowing);
					
					trendsBeanList.add(trendsBean);
				}
			}
			
			request.setAttribute("trendsBeanList", trendsBeanList);
			request.getRequestDispatcher("/pages/index.jsp")
					.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(defaultSession);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
