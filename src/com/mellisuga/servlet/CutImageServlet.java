package com.mellisuga.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.MemberDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.function.ImageCut;
import com.mellisuga.model.Member;
import com.mellisuga.security.Encryption;

@WebServlet("/CutImageServlet")
public class CutImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CutImageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
        Member m = (Member) request.getSession().getAttribute("member");
        //图片文件夹名称 
        String newFolderName = new Encryption().sha256Encode(m.getId()+"");
        
		/*
         * 获取参数
         * x,y,w,h,bigImage
         */
        int x = Integer.parseInt(request.getParameter("x"));
        int y = Integer.parseInt(request.getParameter("y"));
        int w = Integer.parseInt(request.getParameter("w"));
        int h = Integer.parseInt(request.getParameter("h"));
        String image_src = request.getParameter("image_src");    
        
        //获取文件真实路径
        //获取文件名
        String[] imageNameS = image_src.split("/");
        String imageName = imageNameS[imageNameS.length-1];
        //文件正式路径
        String srcImagePath = this.getServletConfig().getServletContext().getRealPath("/") 
        		+ "\\uploads\\avatar\\"+ newFolderName +"\\" + imageName;
        //切割图片
        ImageCut.abscut(srcImagePath, srcImagePath, x, y, w, h);
        
        //头像裁剪完成后，将图片路径保存到用户
        SqlSession defaultSession = null;
		
		try {
			defaultSession = DBConnection.openDefaultSession();
			
			// 插入成员信息
			MemberDAO memberDAO = defaultSession.getMapper(MemberDAO.class);
			Member member = memberDAO.queryMemberByID(m.getId());
			member.setAvatar_path(image_src);
			memberDAO.updateMember(member);
			defaultSession.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// 重定向到用户页面
        response.sendRedirect(request.getContextPath()
				+ "/HomeServlet?id=" + m.getId() + "&pageNum=1");
	}

}
