<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.model.*" %>
<%@ page import="com.mellisuga.bean.*" %>
<%@ page import="java.util.Map" %>
<%@include file="sitename.jsp"%>
<%
String path = request.getContextPath();   
String basePath = request.getScheme() + "://" + request.getServerName() + ":" 
	+ request.getServerPort() + path + "/" ;
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
	<title>首页 - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>

<%
	Member m = (Member) request.getSession().getAttribute("member"); 
	//@SuppressWarnings("unchecked")
	//List<MessageBean> messageBeanList = (List<MessageBean>) request.getAttribute("messageBeanList");
	@SuppressWarnings("unchecked")
	Map<String, List<MessageBean>> messageBeanMap = (Map<String, List<MessageBean>>) request.getAttribute("messageBeanMap");
%>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand"><%=sitename %></a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">
			
				<!-- search -->
				<form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button" data-toggle="modal"
								data-target="#searchModal" data-backdrop="false">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				
				<!-- search modal -->
				<%@include file="modal.jsp"%>

				<!-- navbar -->
				<%@include file="navbar.jsp" %>
			</div>
		</div>
	</div>

    <div class="container">

      	<!-- main content -->
		<div class="question-main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="row">
				<div class="left-main col-lg-7 col-md-7 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

					<!--left main title row-->
					<div class="row">
						<div class="left-main-title">
							<i class="fa fa-list-ul"></i> 全部消息
						</div><!-- end left main title -->
					</div><!-- end left main title row -->
					
					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div>
					<%
						for(Map.Entry<String, List<MessageBean>> entry : messageBeanMap.entrySet()) {
					%>
					<div class="row msg-div">
						<div class="msg-date"><%=entry.getKey() %></div>
						<div class="msg-detail">
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 msg-icon">
								<i class="fa fa-file-text-o"></i>
							</div>
							<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 msg-content-list">
								<%
									for(MessageBean messageBean : entry.getValue()) {
										if(messageBean.getMessageLog().getMessage_type().equals("NewAnswerMsg")) {
								%>
								<div class="msg-content">
									<a href="./HomeServlet?id=<%=messageBean.getMember().getId() %>"><%=messageBean.getMember().getFullname() %></a>   
									回答了问题
									<a href="./QuestionDetails?id=<%=messageBean.getQuestion().getId() %>"><%=messageBean.getQuestion().getQuestion_title() %></a> 
								</div>
								<hr style="margin-top:10px; margin-bottom:10px;"/>
								<%
										} else if(messageBean.getMessageLog().getMessage_type().equals("SystemNotice")) {
								%>
								<div class="msg-content">
									<a href="#">系统管理员</a>   
									发布了公告
									<a href="#"><%=messageBean.getMessageText().getContent() %></a> 
								</div>
								<hr style="margin-top:10px; margin-bottom:10px;"/>
								<%
										} else if(messageBean.getMessageLog().getMessage_type().equals("CommentAnswerMsg")) {
								%>
								<div class="msg-content">
									<a href="./HomeServlet?id=<%=messageBean.getMember().getId() %>"><%=messageBean.getMember().getFullname() %></a>   
									评论了你在
									<a href="./QuestionDetails?id=<%=messageBean.getQuestion().getId() %>"><%=messageBean.getQuestion().getQuestion_title() %></a> 下的回答
								</div>
								<hr style="margin-top:10px; margin-bottom:10px;"/>
								<%
										}else if(messageBean.getMessageLog().getMessage_type().equals("CommentQuestionMsg")) {
								%>
								<div class="msg-content">
									<a href="./HomeServlet?id=<%=messageBean.getMember().getId() %>"><%=messageBean.getMember().getFullname() %></a>   
									评论了你的问题
									<a href="./QuestionDetails?id=<%=messageBean.getQuestion().getId() %>"><%=messageBean.getQuestion().getQuestion_title() %></a>
								</div>
								<hr style="margin-top:10px; margin-bottom:10px;"/>
								<%
										}else if(messageBean.getMessageLog().getMessage_type().equals("AgreeAnswerMsg")) {
								%>
								<div class="msg-content">
									<a href="./HomeServlet?id=<%=messageBean.getMember().getId() %>"><%=messageBean.getMember().getFullname() %></a>   
									赞同了你在问题
									<a href="./QuestionDetails?id=<%=messageBean.getQuestion().getId() %>"><%=messageBean.getQuestion().getQuestion_title() %></a> 下的回答
								</div>
								<hr style="margin-top:10px; margin-bottom:10px;"/>
								<%
										}
									}
								%>
							</div>
						</div>
					</div>
					<%
						}
					%>

					<!-- loding more btn row  -->
					<div class="row">
						<div class="loding-btn">
							<a href="#" class="btn btn-default btn-block">加载更多</a>
						</div>
					</div><!-- end loding more btn row  -->

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="list-group">
						<a href="#" class="list-group-item">
							<i class="fa fa-file-o margin-icon"></i> 我的草稿<span class="badge">14</span>
						</a> 
						<a href="" class="list-group-item">
							<i class="fa fa-bookmark-o margin-icon"></i> 我的收藏<span class="badge">8</span>
						</a> 
						<a href="./FollowingServlet" class="list-group-item">
							<i class="fa fa-check-square-o margin-icon"></i> 我关注的问题<span class="badge">164</span>
						</a> 
						<a href="#" class="list-group-item">
							<i class="fa fa-clone margin-icon"></i> 邀请我回答的问题<span class="badge">85</span>
						</a>
					</div>

					<div class="list-group">
						<a href="#" class="list-group-item"><i class="fa fa-book margin-icon"></i> 所有问题</a> 
						<a href="#" class="list-group-item"><i class="fa fa-th-large margin-icon"></i> 话题广场</a>
						<a href="#" class="list-group-item"><i class="fa fa-list margin-icon"></i> 公共编辑动态</a> 
						<a href="#" class="list-group-item"><i class="fa fa-home margin-icon"></i> 社区服务中心</a>
					</div>
	
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>