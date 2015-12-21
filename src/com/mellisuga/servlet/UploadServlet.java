package com.mellisuga.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.mellisuga.model.Member;
import com.mellisuga.security.Encryption;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	  
    /** 
     * 实现文件的上传 
     */   
    public void doGet(HttpServletRequest request,  
            HttpServletResponse response) throws ServletException, IOException {  
          
        //设置接收的编码格式  
        request.setCharacterEncoding("UTF-8");  
        
        Member m = (Member) request.getSession().getAttribute("member");
        
        //图片文件夹名称 
        String newfileName = new Encryption().sha256Encode(m.getId()+"");
        //文件存放真实地址  
        String fileRealPath = "";
        //文件存放真实相对路径  
        String fileRealResistPath = "";
        
        // 源文件名
        String srcFileName="";  
        
        // 获得容器中上传文件夹所在的物理路径  
        String savePath = this.getServletConfig().getServletContext()
        		.getRealPath("/") + "\\uploads\\avatar\\" + newfileName +"\\";  
        
        // 判断保存目录是否存在，否则创建
        File file = new File(savePath);  
        if (!file.isDirectory()) {  
            file.mkdirs();  
        }  
  
        try {  
            DiskFileItemFactory fac = new DiskFileItemFactory();  
            ServletFileUpload upload = new ServletFileUpload(fac);  
            upload.setHeaderEncoding("UTF-8");  
            
            // 获取多个上传文件  
            List<FileItem> fileList = upload.parseRequest(request);  
            // 遍历上传文件写入磁盘  
            Iterator<FileItem> it = fileList.iterator();  
            while (it.hasNext()) {  
            	Object obit = it.next();
            	if(obit instanceof DiskFileItem){
	                DiskFileItem item = (DiskFileItem) obit;  
	                  
	                // 如果item是文件上传表单域     
	                // 获得文件名及路径     
	                String fileName = item.getName();  
	                if (fileName != null) {  
	                    srcFileName = item.getName().substring(item.getName().lastIndexOf("\\")+1);  
	                    //获取文件后缀名
	                    String formatName = srcFileName.substring(srcFileName.lastIndexOf("."));  
	                    //文件存放真实地址
	                    fileRealPath = savePath + newfileName+ formatName;  
	                    //System.out.println(fileRealPath);
	                    
	                    // 获得文件输入流  
	                    BufferedInputStream in = new BufferedInputStream(item.getInputStream());  
	                    // 获得文件输出流
	                    BufferedOutputStream outStream = new BufferedOutputStream(
	                    		new FileOutputStream(new File(fileRealPath)));  
	                    // 开始把文件写到你指定的上传文件夹  
	                    Streams.copy(in, outStream, true);
	                    //上传成功，则插入数据库  
	                    if (new File(fileRealPath).exists()) {  
	                        //虚拟路径赋值  
	                        fileRealResistPath="./images/avatar/"+newfileName+"/"+fileRealPath.substring(fileRealPath.lastIndexOf("\\")+1);  
	                    }  
	                       
	                }   
            	}
            }   
        } catch (org.apache.commons.fileupload.FileUploadException ex) {
    	   ex.printStackTrace();  
           System.out.println("上传文件失败，请稍候重试！");  
           return;  
		}   

		request.setAttribute("fileRealResistPath", fileRealResistPath);
		request.getRequestDispatcher("/pages/log.jsp")
				.forward(request, response); 
    }  
   
    public void doPost(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {  
        doGet(req, resp);  
    }  

}
