<%@ page language="java" import="java.io.*,java.util.*" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sitename = "";
	
	Properties pro = new Properties();  
	String realpath = request.getSession().getServletContext().getRealPath("/WEB-INF/classes/");
	try{  
		//读取配置文件
		FileInputStream in = new FileInputStream(realpath+"/config.properties");  
		pro.load(in);  
	} catch(FileNotFoundException e){  
	    e.printStackTrace();
	} catch(IOException e){
		e.printStackTrace();
	} 
	
	//通过key获取配置文件
	sitename = pro.getProperty("sitename");  
%>
