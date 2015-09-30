package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.Trends;

public interface TrendsDAO {

	// 添加动态
	public void insertTrends(Trends trends);
	
	// 查询动态
	public List<Trends> queryAllTrends();
}
