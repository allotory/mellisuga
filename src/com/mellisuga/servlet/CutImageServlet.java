package com.mellisuga.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        
        System.out.println(x);
        System.out.println(y);
        System.out.println(w);
        System.out.println(h);
        System.out.println(image_src);
        
        //获取文件真实路径
        //获取文件名
        String[] imageNameS = image_src.split("/");
        String imageName = imageNameS[imageNameS.length-1];
        System.out.println(imageName);
        //文件正式路径
        String srcImagePath = this.getServletConfig().getServletContext().getRealPath("/") + "\\uploads\\avatar\\"+ newFolderName +"\\" + imageName;
        System.out.println(srcImagePath);
        //切割图片
        ImageCut.abscut(srcImagePath, srcImagePath, x, y, w, h);
        
        //头像裁剪完成后，将图片路径保存到用户
        System.out.println(image_src);
	}

}
