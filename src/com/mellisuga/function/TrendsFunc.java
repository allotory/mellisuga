package com.mellisuga.function;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.TrendsBean;
import com.mellisuga.bean.VoterBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.FollowDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.NoHelpDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.ThanksDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.dao.VoteDAO;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.NoHelp;
import com.mellisuga.model.Question;
import com.mellisuga.model.Thanks;
import com.mellisuga.model.Trends;
import com.mellisuga.model.Vote;

public class TrendsFunc {

	public List<TrendsBean> getTrends(SqlSession defaultSession, Member member, String trends_object) {

		// 动态查询
		TrendsDAO trendsDAO = defaultSession.getMapper(TrendsDAO.class);
		QuestionDAO questionDAO = defaultSession.getMapper(QuestionDAO.class);
		MemberDAO memberDAO = defaultSession.getMapper(MemberDAO.class);
		AnswersDAO answersDAO = defaultSession.getMapper(AnswersDAO.class);
		VoteDAO voteDAO = defaultSession.getMapper(VoteDAO.class);
		FollowDAO followDAO = defaultSession.getMapper(FollowDAO.class);
		ThanksDAO thanksDAO = defaultSession.getMapper(ThanksDAO.class);
		NoHelpDAO noHelpDAO = defaultSession.getMapper(NoHelpDAO.class);
		
		List<Trends> trendsList = null;
		
		// 查询全部动态列表
		if(trends_object.equals("specificUser")) {
			trendsList = trendsDAO.queryTrendsByTMid(member.getId());
		} else if(trends_object.equals("allUser")) {
			trendsList = trendsDAO.queryAllTrends();
		}
		List<TrendsBean> trendsBeanList = new ArrayList<TrendsBean>();

		if (trendsList != null) {
			for (Trends t : trendsList) {

				TrendsBean trendsBean = null;

				// 动态类型—— FollowingQuestion, AgreeWithThisAnswer,
				// AnswerThisQuestion, AskAQuestion
				if ("FollowingQuestion".equals(t.getTrends_type())) {
					// 1：关注该问题
					trendsBean = new TrendsBean();
					trendsBean.setTrends(t);

					// 查询所提问题信息
					Question question = new Question();
					question.setId(t.getTrends_id());
					Question q = questionDAO.queryQuestionById(question);
					trendsBean.setQuestion(q);

					// 查询关注问题的用户信息
					Member m = memberDAO.queryMemberByUserID(t.getTrends_member());
					trendsBean.setMember(m);

				} else if ("AgreeWithThisAnswer".equals(t.getTrends_type())) {
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

					// 查询是否投票
					HashMap<String, Object> voteMap = new HashMap<String, Object>();
					voteMap.put("answer_id", answers.getId());
					voteMap.put("voter_id", member.getId());
					Vote vote = voteDAO.queryVoteAUid(voteMap);
					trendsBean.setVote(vote);

					// 查询所有点了赞同的用户
					List<Vote> voteUpList = voteDAO.queryVoteByAid(answers.getId());
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

					trendsBean.setVoterBean(voterBean);

					// 查询是否感谢过作者
					HashMap<String, Object> thanksMap = new HashMap<String, Object>();
					thanksMap.put("answer_id", answers.getId());
					thanksMap.put("thanker_id", member.getId());
					Thanks thanks = thanksDAO.queryThanksByAMId(thanksMap);
					if (thanks == null) {
						trendsBean.setThanked(false);
					} else {
						trendsBean.setThanked(true);
					}

					// 查询是否没有帮助
					HashMap<String, Object> noHelpMap = new HashMap<String, Object>();
					noHelpMap.put("answer_id", answers.getId());
					noHelpMap.put("member_id", member.getId());
					NoHelp noHelp = noHelpDAO.queryNoHelpByAMid(noHelpMap);
					if (noHelp == null) {
						trendsBean.setNoHelp(false);
					} else {
						trendsBean.setNoHelp(true);
					}
				} else if ("AnswerThisQuestion".equals(t.getTrends_type())) {
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
					Member m = memberDAO.queryMemberByUserID(answers
							.getAuthor_id());
					trendsBean.setMember(m);

					// 查询是否投票
					HashMap<String, Object> voteMap = new HashMap<String, Object>();
					voteMap.put("answer_id", answers.getId());
					voteMap.put("voter_id", member.getId());
					Vote vote = voteDAO.queryVoteAUid(voteMap);
					trendsBean.setVote(vote);

					// 查询所有点了赞同的用户
					List<Vote> voteUpList = voteDAO.queryVoteByAid(answers.getId());
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

					trendsBean.setVoterBean(voterBean);

					// 查询是否感谢过作者
					HashMap<String, Object> thanksMap = new HashMap<String, Object>();
					thanksMap.put("answer_id", answers.getId());
					thanksMap.put("thanker_id", member.getId());
					Thanks thanks = thanksDAO.queryThanksByAMId(thanksMap);
					if (thanks == null) {
						trendsBean.setThanked(false);
					} else {
						trendsBean.setThanked(true);
					}

					// 查询是否没有帮助
					HashMap<String, Object> noHelpMap = new HashMap<String, Object>();
					noHelpMap.put("answer_id", answers.getId());
					noHelpMap.put("member_id", member.getId());
					NoHelp noHelp = noHelpDAO.queryNoHelpByAMid(noHelpMap);
					if (noHelp == null) {
						trendsBean.setNoHelp(false);
					} else {
						trendsBean.setNoHelp(true);
					}

				} else if ("AskAQuestion".equals(t.getTrends_type())) {
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

				// 查询是否关注该问题
				HashMap<String, Object> followMap = new HashMap<String, Object>();
				followMap.put("question_id", trendsBean.getQuestion().getId());
				followMap.put("follower_id", member.getId());
				int count = followDAO.isExistInFollow(followMap);
				boolean isFollowing = count > 0 ? true : false;
				trendsBean.setFollowing(isFollowing);

				trendsBeanList.add(trendsBean);
			}
		}
		
		return trendsBeanList;
	}
}