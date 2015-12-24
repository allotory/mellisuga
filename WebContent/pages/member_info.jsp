<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.bean.*" %>
<%@ page import="com.mellisuga.utils.*" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.mellisuga.function.*" %>
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
	<title>Ellery - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>
	
	<% 
		Member m = (Member) request.getSession().getAttribute("member"); 
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
						<form class="form-horizontal" method="post" action="./MemberInfoUpdateServlet">
							<fieldset>
								<div class="form-group">
									<label for="inputName" class="col-lg-2 control-label">
										用户姓名： 
									</label>
									<div class="col-lg-7">
										<input type="text" class="form-control" name="fullname" id="inputName" placeholder="<%=m.getFullname()%>">
										<span class="help-block">每180天只能修改一次，默认为用户名（不建议使用）.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">
										性别：
									</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="gender" id="male" value="male" checked>
												男
											</label>
											<label class="setting-margin">
												<input type="radio" name="gender" id="female" value="female">
												女
											</label>
											<label>
												<input type="radio" name="gender" id="other" value="other">
												其他
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputName" class="col-lg-2 control-label">
										用户签名： 
									</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" name="autograph" id="autograph" placeholder="<%=m.getAutograph() %>">
									</div>
								</div>
								<div class="form-group">
									<label for="location" class="col-lg-2 control-label">
										居住地：
									</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="location" id="location" placeholder="<%=m.getLocation() %>">
									</div>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="business" id="business" placeholder="<%=m.getBusiness() %>">
									</div>
								</div>
								<div class="form-group">
									<label for="employment" class="col-lg-2 control-label">
										职业经历：
									</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="employment" id="employment" placeholder="<%=m.getEmployment() %>">
									</div>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="position" id="position" placeholder="<%=m.getPosition() %>">
									</div>
								</div>
								<div class="form-group">
									<label for="education" class="col-lg-2 control-label">
										教育经历： 
									</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="education" id="education" placeholder="<%=m.getEducation() %>">
									</div>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="major" id="major" placeholder="<%=m.getMajor() %>">
									</div>
								</div>
								<div class="form-group">
									<label for="description" class="col-lg-2 control-label">
										个人简介：
									</label>
									<div class="col-lg-10">
										<textarea class="form-control" name="description" rows="5" cols="20" placeholder="<%=m.getDescription() %>"></textarea>
										<span class="help-block">用一段话介绍你自己，会在你的个人页面显示.</span>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<a href="./HomeServlet?id=<%=m.getId() %>&pageNum=1" class="btn btn-default">不，暂不更新</a>
										<input type="submit" value="更新"  class="btn btn-primary"/>
									</div>
								</div>
							</fieldset>
						</form>
					</div><!-- end left main title row -->

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="home-sidebar">
						<strong>
							<span>关注了<a href="#">155</a> 人</span> ,
							<span>关注者<a href="#">13</a> 人</span>
						</strong>
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个话题</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个专栏</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>主页状态</strong></span>
						<div class="similar-question">
							个人主页被333人浏览
						</div>
					</div>

	
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->
	</body>
</html>