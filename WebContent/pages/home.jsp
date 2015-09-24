<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="sitename.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Ellery - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" href="../css/bootstrap.css" media="screen">
	<link rel="stylesheet" href="../css/style.css" media="screen">

	<script src="../js/jquery-1.11.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/common.js"></script>
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/respond.min.js"></script>
	<![endif]-->

	<!-- Taginput -->
	<script type="text/javascript" src="../plugin/Taginput/bootstrap-tagsinput.js"></script>
	<link rel="stylesheet" href="../plugin/Taginput/bootstrap-tagsinput.css">
	
	<!-- modal -->
	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		})
	</script>
	
	<!-- bacheditor -->
	<link rel="stylesheet" href="../plugin/BachEditor/css/pygment_trac.css">
	<link rel="stylesheet" href="../plugin/BachEditor/css/editor.css">
	<link rel="stylesheet" href="../plugin/BachEditor/css/codemirror.min.css">
	<link rel="stylesheet" href="../plugin/BachEditor/css/default.min.css">
	<script type="text/javascript" src="../plugin/BachEditor/js/highlight.min.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/marked.min.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/codemirror.min.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/ZeroClipboard.min.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/highlight.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/fileupload.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/modal.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/MIDI.js"></script>
	<script type="text/javascript" src="../plugin/BachEditor/js/bacheditor.js"></script>

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

				<ul class="nav navbar-nav">
					<li>
						<a href="#">首页</a>
					</li>
					<li>
						<a href="#">话题</a>
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Ellery <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#" class="glyphicon glyphicon-user"> 我的主页</a></li>
							<li><a href="#" class="glyphicon glyphicon-envelope"> 私信</a></li>
							<li><a href="#" class="glyphicon glyphicon-cog"> 设置</a></li>
							<li class="divider"></li>
							<li><a href="#" class="glyphicon glyphicon-off"> 退出</a></li>
						</ul>
					</li>
				</ul>
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
										<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded">
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
											<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> 
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
								<strong>提问</strong>
								<a href="#" class="more"><span class="glyphicon glyphicon-chevron-right"></span></a>
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
								<hr>
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
								<a href="#" class="more"><span class="glyphicon glyphicon-chevron-right"></span></a>
							</div>
							<div class="panel-body">
								<div class="answer-list">
									<div class="answer-list-content">
										<a href="" class="answer-question">雨为什么是一滴一滴下的？</a>
										<p class="user-answer">雨为什么是一滴一滴下的？雨为什么是一滴一滴下的？雨为什么是一滴一滴下的？</p>
									</div>
								</div>
								<hr>
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
								<a href="#" class="more"><span class="glyphicon glyphicon-chevron-right"></span></a>
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
											<span class="glyphicon glyphicon-plus"></span> 关注问题
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-comment"></span> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<span class="glyphicon glyphicon-heart-empty"></span> 感谢
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-share-alt"></span> 分享
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-bookmark"></span> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
											举报
										</a>
										<span class="copyright"></span>
										<a href="#" class="answer-collapse meta-item">
											<span class="glyphicon glyphicon-open"></span> 收起
										</a>
									</div>
									
								</div><!-- end content-details -->

								<hr>

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
									
								<hr>

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
											<span class="glyphicon glyphicon-plus"></span> 关注问题
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-comment"></span> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<span class="glyphicon glyphicon-heart-empty"></span> 感谢
										</a>
										<a href="#" class="meta-item" >
											<span class="glyphicon glyphicon-share-alt"></span> 分享
										</a>
										<a href="#" class="meta-item" >
											<span class="glyphicon glyphicon-bookmark"></span> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
											举报
										</a>
										<span class="copyright"></span>
										<a href="#" class="answer-collapse meta-item">
											<span class="glyphicon glyphicon-open"></span> 收起
										</a>
									</div>
									
								</div><!-- end content-details -->

								<hr>

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

								<hr>

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
					<hr>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个话题</strong>
						</span><br>

						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
					</div>
					<hr>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个专栏</strong>
						</span><br>

						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
						<img src="../images/topic/zh.jpg" class="topic-img">
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