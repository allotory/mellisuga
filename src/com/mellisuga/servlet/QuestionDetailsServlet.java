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
import com.mellisuga.dao.FollowDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.NoHelpDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TagDAO;
import com.mellisuga.dao.ThanksDAO;
import com.mellisuga.dao.VoteDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.function.WilsonScoreInterval;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.NoHelp;
import com.mellisuga.model.Question;
import com.mellisuga.model.Tag;
import com.mellisuga.model.Thanks;
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
			
/**				
 * 				QuestionBean
 * 					 |
 * 		---------------------------------------------
 * 		|         	|              	 |        		|
 * 	 Question    List<Tag>    List<AnswerBean>	isFollowing
 * 									 |
 * 			 --------------------------------------------------------------------
 * 			 |   	 |       |         |           |				|			|
 * 		isThanked  Answer   Member	  Vote   List<voterBean>	isCollected	  isNoHelp
 * 													|
 * 											 ---------------
 * 											 |		       |	
 * 										  List<Member>   UpCount
 */

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
			
			// 查询是否关注该问题
			FollowDAO followDAO = session.getMapper(FollowDAO.class);
			HashMap<String, Object> followMap = new HashMap<String, Object>();
			followMap.put("question_id", q.getId());
			followMap.put("follower_id", m.getId());
			int count = followDAO.isExistInFollow(followMap);
			boolean isFollowing = count > 0 ? true: false;   
			questionBean.setFollowing(isFollowing);
			
			// 查询答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			ThanksDAO thanksDAO = session.getMapper(ThanksDAO.class);
			NoHelpDAO noHelpDAO = session.getMapper(NoHelpDAO.class);
			VoteDAO voteDAO = session.getMapper(VoteDAO.class);
			List<Answers> answersList = answersDAO.queryAnswerByQuestionId(q);
			List<AnswerBean> answerBeanList = new ArrayList<AnswerBean>();
			
			// 存在答案
			if(answersList != null && !answersList.isEmpty()) {
				
				MemberDAO memberDAO = session.getMapper(MemberDAO.class);
				for(Answers a : answersList) {
					// 由答案查询答案作者
					AnswerBean answerBean = new AnswerBean();
					Member member = memberDAO.queryMemberByUserID(a.getAuthor_id());
					answerBean.setMember(member);
					
					// 设置答案
					answerBean.setAnswer(a);
					
					// 计算并设置答案权重
					/**
					 *  威尔逊区间算法
					 *  	u 为加权赞同票数，
					 *  	v 为加权反对票数，
					 *  	z_alpha 为参数， 暂定2.2，(5~10好一点，吗)
					 * 
					 *  n = u + v;
					 *  p = u / n;
					 *  
					 *  score = (p + z*z/2n - (z/2n)*Math.sqrt(4n*(1 - p)*p + z*z)) 
					 *  			/ (1 + z*z/n)
					 *  
					 *  z设置得越高，绝对赞同数就越重要，反之设置较低时，赞同率就越重要。
					 *  当z等于0时，赞同率将起到全部作用。
					 *  比如一个1000赞，100反对的回答，当z等于0.73时，其分数将完全等于一个1赞0反对的回答。
					 *  
					 *  当z增大时，绝对赞同数起的作用就开始增大。
					 *  两个回答，前者100赞30反对，后者70赞0反对，那么当z小于21时，后者排名靠前，当大于21时，前者排名靠前。
					 */
					
					// 赞同数
					HashMap<String, Object> voteUpCountMap = new HashMap<String, Object>();
					voteUpCountMap.put("answer_id", a.getId());
					voteUpCountMap.put("vote_type", "up");
					int voteUpCount = voteDAO.queryCountByAidVoteType(voteUpCountMap);
					
					// 反对数
					HashMap<String, Object> voteDownCountMap = new HashMap<String, Object>();
					voteDownCountMap.put("answer_id", a.getId());
					voteDownCountMap.put("vote_type", "down");
					int voteDownCount = voteDAO.queryCountByAidVoteType(voteDownCountMap);
					
					// 计算权重
					double answerWeight = WilsonScoreInterval.getWSI(voteUpCount, voteDownCount);
					answerBean.setAnswerWeight(answerWeight);
					
					
					// 单元测试。。。。。
					
					
					// 查询是否感谢过作者
					HashMap<String, Object> thanksMap = new HashMap<String, Object>();
					thanksMap.put("answer_id", a.getId());
					thanksMap.put("thanker_id", m.getId());
					Thanks thanks = thanksDAO.queryThanksByAMId(thanksMap);
					if(thanks == null) {
						answerBean.setThanked(false);
					} else {
						answerBean.setThanked(true);
					}
					
					// 查询是否没有帮助
					HashMap<String, Object> noHelpMap = new HashMap<String, Object>();
					noHelpMap.put("answer_id", a.getId());
					noHelpMap.put("member_id", m.getId());
					NoHelp noHelp = noHelpDAO.queryNoHelpByAMid(noHelpMap);
					if(noHelp == null) {
						answerBean.setNoHelp(false);
					} else {
						answerBean.setNoHelp(true);
					}
					
					// 查询是否投票
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
