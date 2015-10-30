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

import com.mellisuga.dao.ReportTypeDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.ReportType;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReportServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		int is_common = Integer.parseInt(request.getParameter("is_common"));
		
		SqlSession session = null;
		List<ReportType> reportTypeList = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 查询举报类型
			ReportTypeDAO reportTypeDAO = session.getMapper(ReportTypeDAO.class);
			if(is_common == 0) {
				// 问题举报列表
				reportTypeList = reportTypeDAO.queryAllReportType();
			} else if(is_common == 1) {
				// 答案及评论举报列表
				reportTypeList = reportTypeDAO.queryReportTypeByIsCommon(1);
			}
			
			session.commit();
		} catch(Exception e) {
			out.print("queryreporttypeerror");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("reportTypeList", reportTypeList);
		
		// 返回举报类型 Json
		out.print(jsonObject.toString());
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
