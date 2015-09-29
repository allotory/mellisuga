<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>Ellery关注的人 - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>
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
				<div class="left-main col-lg-8 col-md-8 col-sm-12 col-xs-12">

					<!--left main title row-->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="profile-header">
									<strong>Ellery</strong>
								</div>
								<div class="row user-infos">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<img src="./images/avatar/310d85e8d.jpg" class="img-responsive img-rounded">
									</div>
									<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
										
										<div class="user-info">
											<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 
											<span class="location">HaiLin</span>
											<span class="business">互联网</span>
											<span class="gender">男</span>
											<a href="#" class="item-edit">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
												修改
											</a>
										</div>

										<div class="user-info">
											<span class="glyphicon glyphicon-lock" aria-hidden="true"></span> 
											<span class="company">公司</span>
											<span class="work">程序猿</span>
											<a href="#" class="item-edit">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
												修改
											</a>
										</div>

										<div class="user-info-end">
											<span class="glyphicon glyphicon-education" aria-hidden="true"></span> 
											<span class="education">大学</span>
											<span class="specialty">专业</span>
											<a href="#" class="item-edit">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
												修改
											</a>
											<span class="user-info-detail">
												<span class="glyphicon glyphicon-arrow-right"></span> 查看详细资料
											</span>
										</div>
										<hr>
										
										<p>从前有一只北极熊买了一副墨镜，他戴了墨镜之后沉思一会儿，说到：突然好想吃竹子哦～</p>
									</div>
								</div>


								<div class="achievement">
									<span class="achieve">获得</span>
									<span class="achieve">
										<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 
										<strong>133</strong>赞同
									</span>
									<span class="achieve">
										<span class="glyphicon glyphicon-heart-empty"  aria-hidden="true"></span>  
										<strong>52</strong>感谢
									</span>
									<a href="#" class="achieve-right glyphicon glyphicon-pencil info-edit">编辑我的资料</a>
								</div>

							</div>
							<div class="panel-footer user-info-foot">
								<a href="" class="info-item glyphicon glyphicon-home"></a>
								<a href="" class="info-item"><strong>提问</strong><span> 0</span></a>
								<a href="" class="info-item"><strong>回答</strong><span> 0</span></a>
								<a href="" class="info-item"><strong>专栏文章</strong><span> 0</span></a>
								<a href="" class="info-item"><strong>收藏</strong><span> 0</span></a>
								<a href="" class="info-item"><strong>公共编辑</strong><span> 0</span></a>
							</div>
						</div>
					</div><!-- end left main title row -->

					<!-- ask list -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong><a href="#">Ellery</a> 关注的人</strong>
								<a href="#" class="back-home">返回个人主页</a>
							</div>
							<div class="panel-body">
								<div class="ask-list">
									<div class="ask-list-content">
										<a href="" class="question-list">Tim Chen</a>
										<a href="#" class="follow btn btn-primary btn-xs">取消关注</a>
										<div class="feed-meta">
											<a href="#" class="meta-item">4847关注者</a>
											<span class="bull">•</span> <a href="#" class="meta-item">975提问</a>
											<span class="bull">•</span> <a href="#" class="meta-item">4回答</a>
											<span class="bull">•</span> <a href="#" class="meta-item">28赞同</a>
										</div>
									</div>
								</div>
								<hr>
								<div class="ask-list">
									<div class="ask-list-content">
										<a href="" class="question-list">Tim Chen</a>
										<a href="#" class="follow btn btn-primary btn-xs">取消关注</a>
										<div class="feed-meta">
											<a href="#" class="meta-item">4847关注者</a>
											<span class="bull">•</span> <a href="#" class="meta-item">975提问</a>
											<span class="bull">•</span> <a href="#" class="meta-item">4回答</a>
											<span class="bull">•</span> <a href="#" class="meta-item">28赞同</a>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div><!-- end ask list -->

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="home-sidebar">
						<strong>
							<span>关注了<a href="#">155</a> 人</span> ,
							<span>关注者<a href="#">13</a> 人</span>
						</strong>
					</div>
					<hr>
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
					<hr>
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
					<hr>
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