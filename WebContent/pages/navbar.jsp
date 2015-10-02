<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.model.*" %>
<%
	Member me = (Member) request.getSession().getAttribute("member"); 
%>
<ul class="nav navbar-nav">
	<li>
		<a href="./IndexServlet">首页</a>
	</li>
	<li>
		<a href="#">话题</a>
	</li>
	<li>
		<a href="./pages/ask.jsp">提问</a>
	</li>
	<li>
		<a href="#">发现</a>
	</li>
	<li>
		<a href="#">消息</a>
	</li>
</ul>

<ul class="nav navbar-nav navbar-right">
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=me.getFullname() %> <span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="#" class="glyphicon glyphicon-user"> 我的主页</a></li>
			<li><a href="#" class="glyphicon glyphicon-envelope"> 私信</a></li>
			<li><a href="#" class="glyphicon glyphicon-cog"> 设置</a></li>
			<li class="divider"></li>
			<li><a href="#" class="glyphicon glyphicon-off"> 退出</a></li>
		</ul>
	</li>
</ul>    