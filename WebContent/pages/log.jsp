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
	<title>问题日志 - 有哪些免费的游戏可用IP？ - <%=sitename %></title>
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
						<div class="question-detail">
							<div class="question-tag">
								<span class="label label-primary">Default</span>
								<span class="label label-primary">Primary</span>
								<span class="label label-primary">Success</span>
								<span class="label label-primary">Warning</span>
								<span class="label label-primary">Danger</span>
								<span class="label label-primary">Info</span>
							</div>
							<div class="question-title">
								<strong>为什么腾讯这么大的公司都不提供宿舍？</strong>
							</div>
						</div><!-- end question detail -->

						<div class="answer-info">
							<span><strong>问题编辑日志</strong></span>
						</div><!-- end answer info -->
					</div><!-- end question title row -->

					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap">
						<div class="left-main-content">

							<!-- content-details -->
							<div class="content-details col-lg-12 col-md-12 col-sm-12 col-xs-12">

								<div class="row">
									<div class="content-source">
										<a href="#">空明流转</a> 编辑了补充说明/添加（移除）了话题
									</div>
								</div>

								<div class="row">
									<div class="question-content">
										<blockquote>
											<p>Lorem ipsum <ins>dolor</ins> sit amet, <del>consectetur</del> adipiscing elit. Integer posuere erat a ante.</p>
											<small>Someone famous in <cite title="Source Title">Source Title</cite></small>
										</blockquote>

										<span class="answer-date" style="display: block;">
											<a target="_blank" href="#"><strong>修改理由：</strong> 补充必要的信息</a>
										</span>
									</div>
								</div>

								<div class="row">
									<div class="meta-panel">
										<a href="#" class="meta-item">
											#56674165
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">撤消</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
											举报恶意编辑
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">2015-07-26 14:01:55</a>
									</div>
								</div>

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->

					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div>


				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
										
					<div class="follow-btn">
						<a href="#" class="btn btn-primary">关注问题</a>
					</div>

					<div class="sidebar-group">
						<span><a href="#">155</a> 人关注该问题</span>
					</div>

					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>相关问题</strong></span>
						<div class="similar-question-group">
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
						</div>
					</div>

					<hr style="margin-top:12px;margin-bottom:12px;"/>

					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>问题状态</strong></span>
						<div class="similar-question">
							最近活动于 10:02 • <a>查看问题日志</a><br>
							被浏览 6800 次，相关话题关注者 617946 人 9 个回答
						</div>
					</div>

				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->
	</body>
</html>