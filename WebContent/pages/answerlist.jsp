<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.bean.*" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
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
		HomeBean homeBean = (HomeBean) request.getAttribute("homeBean");
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
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="profile-header">
									<strong><%=m.getFullname() %></strong>
								</div>
								<div class="row user-infos">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<img src="<%=m.getAvatar_path() %>" class="img-responsive img-rounded">
									</div>
									<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
										
										<div class="user-info">
											<i class="fa fa-map-marker"></i> 
											<span class="location"><%=m.getLocation() %></span>
											<span class="business"><%=m.getBusiness() %></span>
											<span class="gender"><%=m.getGender() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info">
											<i class="fa fa-suitcase"></i> 
											<span class="company"><%=m.getEmployment() %></span>
											<span class="work"><%=m.getPosition() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info-end">
											<i class="fa fa-graduation-cap"></i> 
											<span class="education"><%=m.getEducation() %></span>
											<span class="specialty"><%=m.getMajor() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
											<span class="user-info-detail">
												<i class="fa fa-arrow-right"></i> 查看详细资料
											</span>
										</div>
										<hr style="margin-top:12px;margin-bottom:12px;"/>
										
										<p><%=m.getDescription() %></p>
									</div>
								</div>


								<div class="achievement">
									<span class="achieve">获得</span>
									<span class="achieve">
										<i class="fa fa-thumbs-o-up"></i> 
										<strong><%=m.getApprove_num() %></strong>赞同
									</span>
									<span class="achieve">
										<i class="fa fa-heart-o"></i> 
										<strong><%=m.getThank_num() %></strong>感谢
									</span>
									<a href="#" class="achieve-right info-edit"><i class="fa fa-edit"></i> 编辑我的资料</a>
								</div>

							</div>
							<div class="panel-footer user-info-foot">
								<a href="" class="info-item"><i class="fa fa-home"></i> </a>
								<a href="" class="info-item"><strong>提问</strong><span> <%=m.getQuestion_num() %></span></a>
								<a href="" class="info-item"><strong>回答</strong><span> <%=m.getAnswer_num() %></span></a>
								<a href="" class="info-item"><strong>专栏文章</strong><span> 0</span></a>
								<a href="" class="info-item"><strong>收藏</strong><span> <%=m.getCollect_num() %></span></a>
								<a href="" class="info-item"><strong>公共编辑</strong><span> 0</span></a>
							</div>
						</div>
					</div><!-- end left main title row -->

					<!-- answer list -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>回答</strong>
							</div>
							<div class="panel-body">
								<%
									// 答案列表
									String split2 = "";
									for(AnswerBean answerBean : homeBean.getAnswerBeanList()) {								
								%>
								<%=split2 %>
								<div class="answer-list">
									<a href="" class="answer-question"><%=answerBean.getQuestion().getQuestion_title() %></a>
									<div class="user-answer">
										<% 
											if(answerBean.getAnswer().getAnswers().length() <= 120) {
												out.print(answerBean.getAnswer().getAnswers());
											} else {
												out.print(answerBean.getAnswer().getAnswers().substring(0, 120) + " ...");
											}
										%>
									</div>
								</div>
								<%
										split2 = "<hr style='margin-top:0px;margin-bottom:8px;'/>";
									}
								%>
								<ul class="pagination" style="margin-left: 25px;">
									<%
										PageInfo<Answers> pageInfo = homeBean.getAnswerPageInfo();
										// 判断当前是否是第一页
										if(pageInfo.isIsFirstPage()) {
									%>
										<li class="disabled"><a href="#">&laquo;</a></li>
									<%
										} else {
									%>
										<li><a href="./AllAnswersServlet?pageNum=<%=pageInfo.getFirstPage() %>">&laquo;</a></li>
									<%
										}
										
										// 判断总页数是否大于10
										if(pageInfo.getPages() <= 10) {
											for(int i = pageInfo.getFirstPage(); i<=pageInfo.getLastPage(); i++) {
												// 判断是否是当前页
												if(i == pageInfo.getPageNum()) {
									%>
										<li class="active"><a href="./AllAnswersServlet?pageNum=<%=i %>"><%=i %></a></li>
									<%
												} else {
									%>
										<li><a href="./AllAnswersServlet?pageNum=<%=i %>"><%=i %></a></li>
									<%
												}
											}
										} else {
									%>
										<li class="active"><a href="#">共 <%=pageInfo.getPages() %> 页</a></li>
									<%	
										}
										
										// 判断是否是最后一页
										if(pageInfo.isIsLastPage()) {
									%>
										<li class="disabled"><a href="#">&raquo;</a></li>
									<%		
										} else {
									%>
										<li><a href="./AllAnswersServlet?pageNum=<%=pageInfo.getLastPage() %>">&raquo;</a></li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
					</div><!-- end answer list -->

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