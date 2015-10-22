package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/CreateCollectionServlet")
public class CreateCollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateCollectionServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		String foldername = request.getParameter("foldername");
		String description = request.getParameter("description");
		int is_public = Integer.parseInt(request.getParameter("is_public"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			CollectionFolderDAO collectionFolderDAO = session.getMapper(CollectionFolderDAO.class);
			CollectionFolder collectionFolder = new CollectionFolder();
			collectionFolder.setFoldername(foldername);
			collectionFolder.setDescription(description);
			collectionFolder.setOwner_id(m.getId());
			collectionFolder.setAnswers_num(0);
			collectionFolder.setFollowers_num(0);
			collectionFolder.setIs_public(is_public);
			collectionFolderDAO.insertCollectionFolder(collectionFolder);
			
			session.commit();
			
			// 返回收藏夹列表
			
			
		} catch (Exception e) {
			out.print("create collection folder error!");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
		
		out.print("create collection folder succsss!~");
	}

}
