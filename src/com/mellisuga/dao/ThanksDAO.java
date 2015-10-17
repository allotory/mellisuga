package com.mellisuga.dao;

import java.util.HashMap;

import com.mellisuga.model.Thanks;

public interface ThanksDAO {

	// 插入感谢作者
	public void insertThanks(Thanks thanks);
	
	// 由答案id及用户id删除感谢作者
	public void deleteThanksByAMId(HashMap<String, Object> parameterMap);
}
