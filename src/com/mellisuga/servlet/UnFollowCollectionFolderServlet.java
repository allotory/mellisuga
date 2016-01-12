package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.CollectionFolderDAO;
import com.mellisuga.dao.CollectionFolderFollowDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.CollectionFolder;
import com.mellisuga.model.CollectionFolderFollow;
import com.mellisuga.model.Member;

@WebServlet("/UnFollowCollectionFolderServlet")
public class UnFollowCollectionFolderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UnFollowCollectionFolderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		Member m = (Member) request.getSession().getAttribute("member");
		int collection_folder_id = Integer.parseInt(request.getParameter("collection_folder_id"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 删除收藏夹关注
			CollectionFolderFollowDAO collectionFolderFollowDAO = session.getMapper(CollectionFolderFollowDAO.class);
			
			HashMap<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("collection_folder_id", collection_folder_id);
			parameterMap.put("follower_id", m.getId());
			
			CollectionFolderFollow cff = collectionFolderFollowDAO.queryCollectionFolderFollowById(parameterMap);
			collectionFolderFollowDAO.deleteCollectionFolderFollow(cff);
			
			// 更新收藏夹关注数目
			CollectionFolderDAO collectionFolderDAO = session.getMapper(CollectionFolderDAO.class);
			
			CollectionFolder collectionFolder = collectionFolderDAO.queryCollectionFolderById(collection_folder_id);
			if(collectionFolder.getFollowers_num() > 0) {
				collectionFolder.setFollowers_num(collectionFolder.getFollowers_num() - 1);
			}
			collectionFolderDAO.updateCollectionFolder(collectionFolder);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
