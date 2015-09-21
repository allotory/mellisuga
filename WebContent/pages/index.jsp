<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.model.*" %>
<%@include file="sitename.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>首页 - <%=sitename %></title>
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=m.getFullname() %> <span class="caret"></span></a>
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
						<div class="left-main-title">
							<span class="recent-news glyphicon glyphicon-th-list"></span>最新动态
							<span class="news-setting">
								<a href="#">
									<span class="glyphicon glyphicon-cog"></span>设置
								</a>
							</span>
						</div><!-- end left main title -->
					</div><!-- end left main title row -->

					<!-- loding btn row  -->
					<div class="row">
						<div class="loding-btn">
							<a href="#" class="btn btn-default btn-block">15条新动态</a>
						</div>
					</div><!-- end loding btn row  -->

					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap" onmouseenter="showItem('hidden-item')" onmouseleave="hiddenItem('hidden-item')">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								<div class="row">
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-up" style="display:block;"></span>
											<span id="voteupnum" style="display:block;">123</span>
										</a>
									</div>
									
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-down"></span>
										</a>
									</div>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">

								<div class="row">
									<div class="content-source">
										<a href="#">空明流转</a> 赞同该回答
										<span class="source-time">3小时前</span>
									</div>
								</div>

								<div class="row">
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								</div>

								<div class="row">
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								</div>

								<div class="row">
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
								</div>

								<div class="row">
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<span class="glyphicon glyphicon-plus"></span> 关注问题
										</a>
										<a href="#comment" data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<span class="glyphicon glyphicon-comment"></span> 12条评论
										</a>
										<span id="hidden-item" style="display:none">
											<a href="#" class="meta-item" data-thanked="false">
												<span class="glyphicon glyphicon-heart-empty"></span> 感谢
											</a>
											<a href="#" class="meta-item" >
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
										</span>
										<a href="#" class="answer-collapse meta-item" style="display:none">
											<span class="glyphicon glyphicon-open"></span> 收起
										</a>
									</div>
								</div>
								
								<!-- comment -->
								<div id="comment" class="row comment collapse">
									<div class="panel panel-default">
										<div class="panel-body">
											<!-- avatar and upvote col -->
											<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
												<div class="row">
													<a href="#">
														<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
													</a>
												</div>
											</div><!-- end avatar and upvote col -->
											
											<!-- comment-details -->
											<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">
												<div class="row">
													<div class="author-info">
														<a href="#"><strong>空明</strong></a>
													</div>
												</div>
				
												<div class="row">
													<div class="question-content">
														<div class="editable-content" style="display: block;">
															这个廉价的东西不能退、不能改签应该是常识啊
															这个廉价的东西不能退、不能改签应该是常识啊
															<span class="answer-date" style="display: block;">
																<a target="_blank" href="#">发布于 14:36</a>
															</span>
														</div>
													</div>
												</div>
											</div><!-- end comment-details -->
										</div>
										<div class="panel-body">
											<!-- avatar and upvote col -->
											<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
												<div class="row">
													<a href="#">
														<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
													</a>
												</div>
											</div><!-- end avatar and upvote col -->
											
											<!-- comment-details -->
											<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">
												<div class="row">
													<div class="author-info">
														<a href="#"><strong>空明</strong></a>
													</div>
												</div>
				
												<div class="row">
													<div class="question-content">
														<div class="editable-content" style="display: block;">
															这个廉价的东西不能退、不能改签应该是常识啊
															这个廉价的东西不能退、不能改签应该是常识啊
															<span class="answer-date" style="display: block;">
																<a target="_blank" href="#">发布于 14:36</a>
															</span>
														</div>
													</div>
												</div>
											</div><!-- end comment-details -->
										</div>
										<div class="panel-body">
											<div class="form-group">
												<textarea class="form-control" rows="1" id="textArea" placeholder="请写下你的评论..."></textarea>
											</div>
											<div class="form-group module-right">
												<button class="btn btn-default btn-sm">取消</button>
												<button type="submit" class="btn btn-primary btn-sm">评论</button>
											</div>
										</div>
										
									</div>
								</div><!--end comment -->

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->
					<div class="row">
						<hr/>
					</div>
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								<div class="row">
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-up" style="display:block;"></span>
											<span style="display:block;">122</span>
										</a>
									</div>
									
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-down"></span>
										</a>
									</div>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">

								<div class="row">
									<div class="content-source">
										<a href="#">空明流转</a> 赞同该回答
										<span class="source-time">3小时前</span>
									</div>
								</div>

								<div class="row">
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								</div>

								<div class="row">
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								</div>

								<div class="row">
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
								</div>
								
								<div class="row">
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
								</div>

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->

					<!-- loding more btn row  -->
					<div class="row">
						<div class="loding-btn">
							<a href="#" class="btn btn-default btn-block">加载更多</a>
						</div>
					</div><!-- end loding more btn row  -->

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="list-group">
						<a href="#" class="list-group-item glyphicon glyphicon-file">
							我的草稿<span class="badge">14</span>
						</a> 
						<a href="#" class="list-group-item glyphicon glyphicon-bookmark">
							我的收藏<span class="badge">8</span>
						</a> 
						<a href="#" class="list-group-item glyphicon glyphicon-heart">
							我关注的问题<span class="badge">164</span>
						</a> 
						<a href="#" class="list-group-item glyphicon glyphicon-check">
							邀请我回答的问题<span class="badge">85</span>
						</a>
					</div>

					<div class="list-group">
						<a href="#" class="list-group-item glyphicon glyphicon-duplicate"> 所有问题</a> 
						<a href="#" class="list-group-item glyphicon glyphicon-th-large"> 话题广场</a> 
						<a href="#" class="list-group-item glyphicon glyphicon-book"> 首场秀</a> 
						<a href="#" class="list-group-item glyphicon glyphicon-edit"> 公共编辑动态</a> 
						<a href="#" class="list-group-item glyphicon glyphicon-home"> 社区服务中心</a>
					</div>
	
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>