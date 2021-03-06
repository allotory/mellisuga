package com.mellisuga.dao;

import java.util.HashMap;
import java.util.List;

import com.mellisuga.model.Trends;

public interface TrendsDAO {

	// 添加动态
	public void insertTrends(Trends trends);
	
	// 查询动态
	public List<Trends> queryAllTrends();
	
	// 通过动态类型所对应id和用户id查询动态
	public Trends queryTrendsByTUid(HashMap<String, Object> parameterMap);
	
	// 删除动态
	public void deleteTrendsById(int id);
	
	// 通过用户ID和动态ID（问题ID） 动态类型删除动态
	public void deleteTrendsByTUid(HashMap<String, Object> parameterMap);
	
	// 由动态发起人查询动态列表
	public List<Trends> queryTrendsByTMid(int member_id);
}
