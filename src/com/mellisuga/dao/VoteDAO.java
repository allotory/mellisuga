package com.mellisuga.dao;

import java.util.HashMap;
import java.util.List;

import com.mellisuga.model.Vote;

public interface VoteDAO {

	// 插入投票
	public void insertVote(Vote vote);
	
	// 更新投票
	public void updateVote(Vote vote);
	
	// 查询投票
	public Vote queryVoteAUid(HashMap<String, Object> parameterMap);
	
	// 删除投票
	public void deleteVoteById(int id);
	
	// 查询投票
	public List<Vote> queryVoteByAid(int answer_id);
}
