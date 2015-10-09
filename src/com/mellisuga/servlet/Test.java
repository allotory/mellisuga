package com.mellisuga.servlet;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Trends;

public class Test {

	public static void main(String[] args) {
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			TrendsDAO td = session.getMapper(TrendsDAO.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("answer_id", 1);
			map.put("member_id", 1);
			map.put("trends_type", "AgreeWithThisAnswer");
			
			Trends t = td.queryTrendsByTUid(map);
			System.out.println(t.getId());

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

}
