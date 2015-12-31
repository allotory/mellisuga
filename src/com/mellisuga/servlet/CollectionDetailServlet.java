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

import com.mellisuga.bean.CollectionBean;
import com.mellisuga.bean.CollectionsDetailBean;
import com.mellisuga.bean.VoterBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.CollectionDAO;
import com.mellisuga.dao.CollectionFolderDAO;
import com.mellisuga.dao.FollowDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.NoHelpDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.ThanksDAO;
import com.mellisuga.dao.VoteDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Collection;
import com.mellisuga.model.CollectionFolder;
import com.mellisuga.model.Member;
import com.mellisuga.model.NoHelp;
import com.mellisuga.model.Question;
import com.mellisuga.model.Thanks;
import com.mellisuga.model.Vote;

@WebServlet("/CollectionDetailServlet")
public class CollectionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CollectionDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Member m = (Member) request.getSession().getAttribute("member");
		int folder_id = Integer.parseInt(request.getParameter("folder_id"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			CollectionsDetailBean collectionDetailBean = new CollectionsDetailBean();;
			List<CollectionBean> collectionBeanList = null; 
			
			// 由收藏夹id查询收藏夹
			CollectionFolderDAO collectionFolderDAO = session.getMapper(CollectionFolderDAO.class);
			CollectionFolder collectionFolder = collectionFolderDAO.queryCollectionFolderById(folder_id);
			collectionDetailBean.setCollectionFolder(collectionFolder);
			
			// 由收藏夹id查询答案id
			CollectionDAO collectionDAO = session.getMapper(CollectionDAO.class);
			List<Collection> collectionList = collectionDAO.queryAnswerIdByFolderId(folder_id);
			
			if(collectionList != null && !collectionList.isEmpty()) {
				
				collectionBeanList = new ArrayList<CollectionBean>(); 
				
				for(Collection c : collectionList) {
					
					CollectionBean collectionBean = new CollectionBean();
					
					// 由答案id查询答案
					AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
					Answers answer = new Answers();
					answer.setId(c.getAnswer_id());
					answer = answersDAO.queryAnswerById(answer);
					collectionBean.setAnswer(answer);
					
					// 查询回答问题信息
					QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
					Question question = new Question();
					question.setId(answer.getQuestion_id());
					question = questionDAO.queryQuestionById(question);
					collectionBean.setQuestion(question);
					
					// 查询回答用户
					MemberDAO memberDAO = session.getMapper(MemberDAO.class);
					Member member = memberDAO.queryMemberByID(answer.getAuthor_id());
					collectionBean.setMember(member);
					
					// 查询是否投票
					VoteDAO voteDAO = session.getMapper(VoteDAO.class);
					HashMap<String, Object> voteMap = new HashMap<String, Object>();
					voteMap.put("answer_id", answer.getId());
					voteMap.put("voter_id", m.getId());
					Vote vote = voteDAO.queryVoteAUid(voteMap);
					collectionBean.setVote(vote);
					
					// 查询所有点了赞同的用户
					List<Vote> voteUpList = voteDAO.queryVoteByAid(answer.getId());
					List<Member> memberList = new ArrayList<Member>();
					VoterBean voterBean = new VoterBean();
	
					if (voteUpList != null && !voteUpList.isEmpty()) {
						// 点赞用户大于0
						voterBean.setUpCount(voteUpList.size());
	
						int length = voteUpList.size() >= 3 ? voteUpList.size() - 3 : 0;
	
						for (int i = (voteUpList.size() - 1); i >= length; i--) {
							Member voter = memberDAO.queryMemberByID(
									voteUpList.get(i).getVoter_id());
							memberList.add(voter);
						}
	
						voterBean.setVoterList(memberList);
					} else if (voteUpList == null) {
						// 还没有人点过赞
						voterBean.setUpCount(0);
						voterBean.setVoterList(null);
					}
					collectionBean.setVoterBean(voterBean);
	
					// 查询是否感谢过作者
					ThanksDAO thanksDAO = session.getMapper(ThanksDAO.class);
					HashMap<String, Object> thanksMap = new HashMap<String, Object>();
					thanksMap.put("answer_id", answer.getId());
					thanksMap.put("thanker_id", m.getId());
					Thanks thanks = thanksDAO.queryThanksByAMId(thanksMap);
					if (thanks == null) {
						collectionBean.setThanked(false);
					} else {
						collectionBean.setThanked(true);
					}
					
					// 查询是否没有帮助
					NoHelpDAO noHelpDAO = session.getMapper(NoHelpDAO.class);
					HashMap<String, Object> noHelpMap = new HashMap<String, Object>();
					noHelpMap.put("answer_id", answer.getId());
					noHelpMap.put("member_id", m.getId());
					NoHelp noHelp = noHelpDAO.queryNoHelpByAMid(noHelpMap);
					if (noHelp == null) {
						collectionBean.setNoHelp(false);
					} else {
						collectionBean.setNoHelp(true);
					}
					
					// 查询是否关注该问题
					FollowDAO followDAO = session.getMapper(FollowDAO.class);
					HashMap<String, Object> followMap = new HashMap<String, Object>();
					followMap.put("question_id", question.getId());
					followMap.put("follower_id", m.getId());
					int count = followDAO.isExistInFollow(followMap);
					boolean isFollowing = count > 0 ? true : false;
					collectionBean.setFollowing(isFollowing);
					
					collectionBeanList.add(collectionBean);
				}
			}
			
			collectionDetailBean.setCollectionBeanList(collectionBeanList);
			
			request.setAttribute("collectionDetailBean", collectionDetailBean);
			request.getRequestDispatcher("/pages/collection_details.jsp")
					.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
