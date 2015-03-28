<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>搜索 - 解惑</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/bootstrap.css" media="screen">
<link rel="stylesheet" href="../../css/common.css" media="screen">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="./js/html5shiv.js"></script>
      <script src="./js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand">解惑</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#navbar-main">
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<form class="navbar-form navbar-left">
					<div class="form-group">
						<div class="input-group">
							<input type="text" size="50" class="form-control" placeholder="Search">
							<span class="input-group-btn">
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
		<div class="login-content">
			<div class="row">
				<div class="col-lg-8">
					<div class="form-group">
	                	<label class="control-label">搜索</label>
	                  	<div class="input-group">
	                    	<input type="text" class="form-control">
	                    	<span class="input-group-btn">
	                      		<button class="btn btn-primary" type="button">搜索</button>
	                    	</span>
	                  	</div>
                	</div>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>

	</div>

	<script src="../../js/jquery-1.11.2.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
</body>
</html>