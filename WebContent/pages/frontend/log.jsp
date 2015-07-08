<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>问题日志 - 程序员工作中的 80/20 法则如何体现？</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/bootstrap.css" media="screen">
<link rel="stylesheet" href="../../css/common.css" media="screen">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="./js/html5shiv.js"></script>
      <script src="./js/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet" type="text/css"
	href="../../plugin/simditor/styles/font-awesome.css" />
<link rel="stylesheet" type="text/css"
	href="../../plugin/simditor/styles/simditor.css" />

<script type="text/javascript"
	src="../../plugin/simditor/scripts/jquery.min.js"></script>
<script type="text/javascript"
	src="../../plugin/simditor/scripts/module.js"></script>
<script type="text/javascript"
	src="../../plugin/simditor/scripts/hotkeys.js"></script>
<script type="text/javascript"
	src="../../plugin/simditor/scripts/uploader.js"></script>
<script type="text/javascript"
	src="../../plugin/simditor/scripts/simditor.js"></script>
<script type="text/javascript">
$(function(){ 
	 toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent' ]; 
	 var editor = new Simditor( { textarea : $('#editor'), placeholder : '这里输入内容...', 
		 	toolbar : toolbar //工具栏 
		 	});
	 })
</script>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand">解惑</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#navbar-main"></button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<form class="navbar-form navbar-left">
					<div class="form-group">
						<div class="input-group">
							<input type="text" size="50" class="form-control"
								placeholder="Search"> <span class="input-group-btn">
								<button class="btn btn-primary" type="button">搜索</button>
							</span>
						</div>
					</div>
				</form>

				<ul class="nav navbar-nav">
					<li><a href="#">首页</a></li>
					<li><a href="#">话题</a></li>
					<li><a href="#">发现</a></li>
					<li><a href="#">提问</a></li>
					<li><a href="#">消息</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Ellery<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#" class="glyphicon glyphicon-user"> 我的主页</a></li>
							<li><a href="#" class="glyphicon glyphicon-envelope"> 私信</a></li>
							<li><a href="#" class="glyphicon glyphicon-cog"> 设置</a></li>
							<li class="divider"></li>
							<li><a href="#" class="glyphicon glyphicon-off"> 退出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="page-content">
			<div class="row">
				<div class="col-lg-8 col-md-7 col-sm-6">
					<div>
						<div class="q-tag">
							<span class="label label-primary">程序员</span> <span
								class="label label-primary">前端</span> <span
								class="label label-primary">Web</span> <a href="#"
								class="meta-item-edit"> <span
								class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改
							</a>
						</div>
						<div class="q-title">
							<a href="" class="question-link">程序员工作中的 80/20 法则如何体现？</a>
						</div>
					</div>
					<hr>
					<div class="answer-info">
						<span>问题编辑日志</span>
					</div>
					<hr>
					<div class="answer-main">
						<div class="row index-list">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="feed-main">
									<div class="source">
										<a href="#" target="_blank" class="zg-link">Kenneth</a> ,移除/添加了话题/编辑了问题/编辑了补充说明
									</div>
									<div class="content">
										<blockquote><small>请问<span class="delquote">历史上</span><span class="insquote">那些巨头商业公司发生过比较</span>有<span class="delquote">些影响较大</span>意思的「官方打脸」事件？</small></blockquote>
										<div>
											<b>修改理由：</b>补充必要的信息
										</div>
										#1157684 • <a>撤消</a> • <a>举报恶意编辑</a> • 2013-08-05 15:23:45
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-offset-1">
					<div class="follow-btn col-lg-12">
						<a href="#" class="btn btn-primary">关注问题</a>
					</div>

					<div class="sidebar-group">
						<span><a href="#">155</a> 人关注该问题</span>
					</div>

					<div class="sidebar-group">
						<span class="sidebar-title">问题状态</span>
						<div class="similar-q">
							最近活动于 10:02 • <a>查看问题日志</a><br> 被浏览 6800 次，相关话题关注者 617946 人
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<script src="../../js/jquery-1.11.2.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
</body>
</html>