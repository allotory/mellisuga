package com.mellisuga.dao;

import java.util.HashMap;

import com.mellisuga.model.NoHelp;

public interface NoHelpDAO {

	// 插入没有帮助
	public void insertNoHelp(NoHelp noHelp);
	
	// 由答案及当前用户id查询答案是否没有帮助
	public NoHelp queryNoHelpByAMid(HashMap<String, Object> parameterMap);
	
	// 由答案及当前用户id删除没有帮助
	public void delNoHelpByAMid(HashMap<String, Object> parameterMap);
}
