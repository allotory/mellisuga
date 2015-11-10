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
		<a id="msg" class="mouse-hand">
      		消息<span class="badge">42</span>
      	</a>
	</li>
</ul>

<ul class="nav navbar-nav navbar-right">
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=me.getFullname() %> <span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="./HomeServlet?id=<%=me.getId() %>"><i class="fa fa-user margin-icon"></i> 我的主页</a></li>
			<li><a href="#"><i class="fa fa-envelope margin-icon"></i> 私信</a></li>
			<li><a href="#"><i class="fa fa-cog margin-icon"></i> 设置</a></li>
			<li class="divider"></li>
			<li><a href="#"><i class="fa fa-power-off margin-icon"></i> 退出</a></li>
		</ul>
	</li>
</ul>    