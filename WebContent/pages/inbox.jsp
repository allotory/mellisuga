<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="sitename.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>私信 - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" href="../css/bootstrap.css" media="screen">
	<link rel="stylesheet" href="../css/style.css" media="screen">

	<script src="../js/jquery-1.11.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
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

</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand">Mellisuga</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#myModal" data-backdrop="false">Go!</button>
						</span>
					</div>
				</form>

				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">提问</h4>
							</div>
							<div class="modal-body">
								<form>
									<div class="form-group">
										<label for="recipient-name" class="control-label">问题：</label>
										<input type="text" class="form-control" id="recipient-name" placeholder="写下你的问题">
									</div>
									<div class="form-group">
										<label for="message-text" class="control-label">问题说明（可选）：</label>
										
										<div class="editor">
											<textarea id="myEditor"></textarea>
										</div>

										<script>
										$(function() {
											var myEditor = new Editor();
											myEditor.render('#myEditor');
										});
										</script>
									</div>
									<div class="form-group">
										<label for="message-text" class="control-label">选择话题：</label>
										<input type="text" class="form-control" id="recipient-name" placeholder="搜索话题">
										<span class="help-block">话题越精准，越容易让相关领域专业人士看到你的问题</span>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<label style="float:left;">
									<input type="checkbox"> 匿名
								</label>
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary">发布</button>
							</div>
						</div>
					</div>
				</div>

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
						<div class="inbox-title">
							<strong>我的私信</strong>
							<span class="module-right">
								<a href="#" class="btn btn-primary btn-xs">写私信</a>
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
										<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
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
										<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
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