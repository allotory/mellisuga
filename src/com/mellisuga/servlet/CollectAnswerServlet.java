package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.CollectionDAO;
import com.mellisuga.dao.CollectionFolderDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Collection;
import com.mellisuga.model.CollectionFolder;

@WebServlet("/CollectAnswerServlet")
public class CollectAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CollectAnswerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		int collection_folder_id = Integer.parseInt(request.getParameter("collection_folder_id"));
		
		SqlSession session = DBConnection.openDefaultSession();
		try {
			// 添加答案到收藏夹
			CollectionDAO collectionDAO = session.getMapper(CollectionDAO.class);
			Collection collection = new Collection();
			collection.setAnswer_id(answer_id);
			collection.setCollection_folder_id(collection_folder_id);
			collectionDAO.insertCollection(collection);
			
			// 更新收藏夹答案数量
			CollectionFolderDAO collectionFolderDAO = session.getMapper(CollectionFolderDAO.class);
			CollectionFolder collectionFolder = collectionFolderDAO.queryCollectionFolderById(collection_folder_id);
			collectionFolder.setAnswers_num(collectionFolder.getAnswers_num() + 1);
			collectionFolderDAO.updateCollectionFolder(collectionFolder);
			
			session.commit();
		} catch (Exception e) {
			out.print("addToCollectionFolderError!");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
