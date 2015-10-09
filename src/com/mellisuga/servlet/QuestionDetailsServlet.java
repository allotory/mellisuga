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

import com.mellisuga.bean.AnswerBean;
import com.mellisuga.bean.QuestionBean;
import com.mellisuga.bean.VoterBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TagDAO;
import com.mellisuga.dao.VoteDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Tag;
import com.mellisuga.model.Vote;

@WebServlet("/QuestionDetails")
public class QuestionDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuestionDetailsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int question_id = Integer.parseInt(request.getParameter("id"));
		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		QuestionBean questionBean = new QuestionBean();
		try {
			session = DBConnection.openDefaultSession();

			// 查询问题
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
			Question question = new Question();
			question.setId(question_id);
			Question q = questionDAO.queryQuestionById(question);
			questionBean.setQuestion(q);

			// 查询标签
			TagDAO tagDAO = session.getMapper(TagDAO.class);
			List<Tag> tagList = tagDAO.queryTagByQuestionId(q);
			questionBean.setTagList(tagList);
			
			// 查询答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			List<Answers> answersList = answersDAO.queryAnswerByQuestionId(q);
			List<AnswerBean> answerBeanList = new ArrayList<AnswerBean>();
			if(answersList != null && !answersList.isEmpty()) {
				// 由答案查询答案作者
				MemberDAO memberDAO = session.getMapper(MemberDAO.class);
				for(Answers a : answersList) {
					AnswerBean answerBean = new AnswerBean();
					Member member = memberDAO.queryMemberByUserID(a.getAuthor_id());
					answerBean.setAnswer(a);
					answerBean.setMember(member);
					
					// 查询是否投票
					VoteDAO voteDAO = session.getMapper(VoteDAO.class);
					HashMap<String, Object> voteMap = new HashMap<String, Object>();
					voteMap.put("answer_id", a.getId());
					voteMap.put("voter_id", m.getId());
					Vote vote = voteDAO.queryVoteAUid(voteMap);
					answerBean.setVote(vote);
					
					// 查询所有点了赞同的用户
					List<Vote> voteUpList = voteDAO.queryVoteByAid(a.getId());
					List<Member> memberList = new ArrayList<Member>();
					VoterBean voterBean = new VoterBean();
					if(voteUpList != null && !voteUpList.isEmpty()) {
						// 点赞用户大于0
						voterBean.setUpCount(voteUpList.size());
						for(Vote v : voteUpList) {
							Member voter = memberDAO.queryMemberByID(v.getVoter_id());
							memberList.add(voter);
							
							// TODO 不用全部查出来，只要最后3个即可
							// TODO 不用全部查出来，只要最后3个即可
							// TODO 不用全部查出来，只要最后3个即可
							// TODO 不用全部查出来，只要最后3个即可
							// TODO 不用全部查出来，只要最后3个即可
						}
						voterBean.setVoterList(memberList);
					} else if(voteUpList == null) {
						// 还没有人点过赞
						voterBean.setUpCount(0);
						voterBean.setVoterList(null);
					}
					answerBean.setVoterBean(voterBean);
					
					answerBeanList.add(answerBean);
				}
			}
			questionBean.setAnswerBeanList(answerBeanList);
			
			request.setAttribute("questionBean", questionBean);
			request.getRequestDispatcher("/pages/question.jsp")
					.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
