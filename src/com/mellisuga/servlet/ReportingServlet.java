package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.ReportDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;
import com.mellisuga.model.Report;

@WebServlet("/ReportingServlet")
public class ReportingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReportingServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		int report_type_id = Integer.parseInt(request.getParameter("report_type"));
		int report_category = Integer.parseInt(request.getParameter("report_category"));
		int report_category_id = Integer.parseInt(request.getParameter("report_category_id"));

		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 查询举报类型
			ReportDAO reportDAO = session.getMapper(ReportDAO.class);
			Report report = new Report();
			report.setReport_type_id(report_type_id);
			report.setReport_category(report_category);
			report.setReport_category_id(report_category_id);
			report.setMember_id(m.getId());
			reportDAO.insertReport(report);
			
			session.commit();
		} catch(Exception e) {
			out.print("insertreporterror");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
