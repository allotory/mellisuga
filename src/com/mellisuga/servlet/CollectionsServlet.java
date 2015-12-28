package com.mellisuga.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.CollectionFolderDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.CollectionFolder;
import com.mellisuga.model.Member;

@WebServlet("/CollectionsServlet")
public class CollectionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CollectionsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 返回我创建的收藏夹列表
			CollectionFolderDAO collectionFolderDAO = session.getMapper(CollectionFolderDAO.class);
			List<CollectionFolder> collectionFolderList = collectionFolderDAO.queryCollectionFolderByMid(m.getId());
			
			// 返回我关注的收藏夹列表
			// 。。。
			
			
			request.setAttribute("collectionFolderList", collectionFolderList);
			request.getRequestDispatcher("/pages/collection.jsp")
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
