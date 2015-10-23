package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;

import com.mellisuga.dao.CollectionFolderDAO;
import com.mellisuga.db.DBConnection;
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
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 返回收藏夹列表
			CollectionFolderDAO collectionFolderDAO = session.getMapper(CollectionFolderDAO.class);
			List<CollectionFolder> collectionFolderList = collectionFolderDAO.queryCollectionFolderByMid(m.getId());
			for(CollectionFolder cf : collectionFolderList) {
				System.out.println(cf.getId() + "=" + cf.getFoldername());
			}
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("collectionFolderList", collectionFolderList);
			
			// 返回收藏夹json
			//System.out.println(jsonObject.toString());
			out.print(jsonObject.toString());
		} catch (Exception e) {
			out.print("create collection folder error!");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
