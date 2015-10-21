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
	<title>Ellery - <%=sitename %></title>
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
									<strong>Ellery</strong>
								</div>
								<div class="row user-infos">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<img src="./images/avatar/310d85e8d.jpg" class="img-responsive img-rounded">
									</div>
									<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
										
										<div class="user-info">
											<i class="fa fa-map-marker"></i> 
											<span class="location">HaiLin</span>
											<span class="business">互联网</span>
											<span class="gender">男</span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info">
											<i class="fa fa-suitcase"></i> 
											<span class="company">公司</span>
											<span class="work">程序猿</span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info-end">
											<i class="fa fa-graduation-cap"></i> 
											<span class="education">大学</span>
											<span class="specialty">专业</span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
											<span class="user-info-detail">
												<i class="fa fa-arrow-right"></i> 查看详细资料
											</span>
										</div>
										<hr style="margin-top:12px;margin-bottom:12px;"/>
										
										<p>从前有一只北极熊买了一副墨镜，他戴了墨镜之后沉思一会儿，说到：突然好想吃竹子哦～</p>
									</div>
								</div>


								<div class="achievement">
									<span class="achieve">获得</span>
									<span class="achieve">
										<i class="fa fa-thumbs-o-up"></i> 
										<strong>133</strong>赞同
									</span>
									<span class="achieve">
										<i class="fa fa-heart-o"></i> 
										<strong>52</strong>感谢
									</span>
									<a href="#" class="achieve-right info-edit"><i class="fa fa-edit"></i> 编辑我的资料</a>
								</div>

							</div>
							<div class="panel-footer user-info-foot">
								<a href="" class="info-item"><i class="fa fa-home"></i> </a>
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
								<strong>提问</strong>
								<a href="#" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								<div class="ask-list">
									<div class="ask-list-content">
										<a href="" class="question-list">雨为什么是一滴一滴下的？</a>
										<div class="feed-meta">
											<a href="#" class="answer-date">发布于 18:14 </a> 
											<span class="bull">•</span> <a href="#" class="meta-item">4847赞</a>
											<span class="bull">•</span> <a href="#" class="meta-item">975浏览</a>
											<span class="bull">•</span> <a href="#" class="meta-item">4回答</a>
											<span class="bull">•</span> <a href="#" class="meta-item">28关注</a>
										</div>
									</div>
								</div>
								<hr style="margin-top:12px;margin-bottom:12px;"/>
								<div class="ask-list">
									<div class="ask-list-content">
										<a href="" class="question-list">雨为什么是一滴一滴下的？</a>
										<div class="feed-meta">
											<a href="#" class="answer-date">发布于 18:14 </a> 
											<span class="bull">•</span> <a href="#" class="meta-item">4847赞</a>
											<span class="bull">•</span> <a href="#" class="meta-item">975浏览</a>
											<span class="bull">•</span> <a href="#" class="meta-item">4回答</a>
											<span class="bull">•</span> <a href="#" class="meta-item">28关注</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!-- end ask list -->

					<!-- answer list -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>回答</strong>
								<a href="#" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								<div class="answer-list">
									<div class="answer-list-content">
										<a href="" class="answer-question">雨为什么是一滴一滴下的？</a>
										<p class="user-answer">雨为什么是一滴一滴下的？雨为什么是一滴一滴下的？雨为什么是一滴一滴下的？</p>
									</div>
								</div>
								<hr style="margin-top:12px;margin-bottom:12px;"/>
								<div class="answer-list">
									<div class="answer-list-content">
										<a href="" class="answer-question">雨为什么是一滴一滴下的？</a>
										<p class="user-answer">雨为什么是一滴一滴下的？雨为什么是一滴一滴下的？雨为什么是一滴一滴下的？</p>
									</div>
								</div>
							</div>
						</div>
					</div><!-- end answer list -->

					<!-- recent news -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>最新动态</strong>
								<a href="#" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								
								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">赞同该回答</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 14:36</a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
										</div>
									</div>
								
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<i class="fa fa-heart-o"></i> 感谢
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-share"></i> 分享
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-bookmark-o"></i> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block">
											举报
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">作者保留权利</a>
										<a href="#" class="answer-collapse meta-item">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
									
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">关注了问题</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
								</div><!-- end content-details -->
									
								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">赞同该回答</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 14:36</a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
										</div>
									</div>
									
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<i class="fa fa-heart-o"></i> 感谢
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-share"></i> 分享
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-bookmark-o"></i> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block">
											举报
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">作者保留权利</a>
										<a href="#" class="answer-collapse meta-item">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
									
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">关注了话题</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">BAT</a></h5>
									</div>
								
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">提出了问题</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
								</div><!-- end content-details -->

								<div class="loding-btn">
									<a href="#" class="btn btn-default btn-block">加载更多</a>
								</div>
								
							</div><!-- end panel body-->
						</div><!-- end panel -->
					</div><!-- end recent news -->


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