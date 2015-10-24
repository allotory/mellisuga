package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;

import com.mellisuga.bean.CollectionFolderBean;
import com.mellisuga.dao.CollectionDAO;
import com.mellisuga.dao.CollectionFolderDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Collection;
import com.mellisuga.model.CollectionFolder;
import com.mellisuga.model.Member;

@WebServlet("/CollectionFolderListServlet")
public class CollectionFolderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CollectionFolderListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		System.out.println(request.getParameter("answer_id"));
		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 返回收藏夹列表
			CollectionFolderDAO collectionFolderDAO = session.getMapper(CollectionFolderDAO.class);
			CollectionDAO collectionDAO = session.getMapper(CollectionDAO.class);
			List<CollectionFolder> collectionFolderList = collectionFolderDAO.queryCollectionFolderByMid(m.getId());
			
			List<CollectionFolderBean> collectionFolderBeanList = new ArrayList<CollectionFolderBean>();
			
			for(CollectionFolder cf : collectionFolderList) {
				CollectionFolderBean collectionFolderBean = new CollectionFolderBean();
				collectionFolderBean.setCollectionFolder(cf);
				
				// 查询当前答案是否在当前收藏夹里
				HashMap<String, Object> parameterMap = new HashMap<String, Object>();
				parameterMap.put("a_id", answer_id);
				parameterMap.put("cf_id", cf.getId());
				Collection collection = collectionDAO.queryCollectionByACid(parameterMap);
				if(collection != null) {
					collectionFolderBean.setCollected(true);
				} else {
					collectionFolderBean.setCollected(false);
				}
				
				collectionFolderBeanList.add(collectionFolderBean);
			}
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("collectionFolderBeanList", collectionFolderBeanList);
			
			// 返回收藏夹json
			System.out.println(jsonObject.toString());
			out.print(jsonObject.toString());
		} catch (Exception e) {
			out.print("get collection folder list error!");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
