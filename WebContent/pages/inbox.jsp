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
	<title>私信 - <%=sitename %></title>
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
						<div class="inbox-title">
							<strong>我的私信</strong>
							<span class="module-right">
								<a href="./pages/new_message.jsp" class="btn btn-primary btn-xs">写私信</a>
							</span>
						</div><!-- end left main title -->
					</div><!-- end left main title row -->

					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap2">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="./images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">

								<div class="row">
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											<a href="#">知乎管理员</a>：
											你举报的 <a href="#">sdfsdfsdf</a> 在问题 
											<a href="#">律助该怎样跟公检法打交道，不被刁难？</a> 中 
											<a href="#">徐斌</a> 的回答下的评论已被删除，
											感谢你的举报。如果该作者有更多违规内容被处理，我们会对其帐号进行处罚。
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">7月16日 12:01</a>
												<a href="#" class="module-right">共6条对话</a>
												<span class="bull module-right"> | </span>
												<a href="#" class="module-right">回复</a>
												<span class="bull module-right"> | </span>
												<a href="#" class="module-right">删除</a>
											</span>
										</div>
									</div>
								</div>

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->
					
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap2">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="./images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">

								<div class="row">
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											<a href="#">知乎管理员</a>：
											你举报的 <a href="#">sdfsdfsdf</a> 在问题 
											<a href="#">律助该怎样跟公检法打交道，不被刁难？</a> 中 
											<a href="#">徐斌</a> 的回答下的评论已被删除，
											感谢你的举报。如果该作者有更多违规内容被处理，我们会对其帐号进行处罚。
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">7月16日 12:01</a>
												<a href="#" class="module-right">共6条对话</a>
												<span class="bull module-right"> | </span>
												<a href="#" class="module-right">回复</a>
												<span class="bull module-right"> | </span>
												<a href="#" class="module-right">删除</a>
											</span>
										</div>
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
				
				<div class="alert alert-dismissible alert-success">
					担心骚扰？可以 <a href="#" class="alert-link">设置</a> 为「只允许我关注的人给我发私信」。
				</div>
					
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>