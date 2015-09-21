<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.remote.model.User" %>
<%@include file="sitename.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>完善个人信息 - <%=sitename %></title>
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
<%
	User u = (User) request.getSession().getAttribute("user"); 
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
		</div>
	</div>

    <div class="container">
		<div class="row question-main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="row">
				<div class="alert alert-dismissible alert-warning">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<p>哦？您还没有添加任何个人信息，完善的个人信息，可以找到更多志同道合的朋友，信息可在<a href="home.jsp" class="alert-link">个人主页</a>进行修改.</p>
				</div>
			</div>
			<div class="row col-lg-8 col-md-8 col-sm-8 col-xs-12">
				<form class="form-horizontal" method="post">
					
					<fieldset>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">
								<span class="glyphicon glyphicon-user"></span>
							</label>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="fullname" id="inputName" placeholder="<%=u.getUsername() %>">
								<span class="help-block">每180天只能修改一次，默认为用户名（不建议使用）.</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							</label>
							<div class="col-lg-10">
								<div class="radio">
									<label class="setting-margin">
										<input type="radio" name="male" id="male" value="male" checked>
										男
									</label>
									<label class="setting-margin">
										<input type="radio" name="female" id="female" value="female">
										女
									</label>
									<label>
										<input type="radio" name="other" id="other" value="other">
										其他
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="location" class="col-lg-2 control-label">
								<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
							</label>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="location" id="location" placeholder="居住地">
							</div>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="business" id="business" placeholder="行业">
							</div>
						</div>
						<div class="form-group">
							<label for="employment" class="col-lg-2 control-label">
								<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>
							</label>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="employment" id="employment" placeholder="公司或组织名称">
							</div>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="position" id="position" placeholder="职位">
							</div>
						</div>
						<div class="form-group">
							<label for="education" class="col-lg-2 control-label">
								<span class="glyphicon glyphicon-education" aria-hidden="true"></span>
							</label>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="education" id="education" placeholder="学校或教育机构">
							</div>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="major" id="major" placeholder="专业">
							</div>
						</div>
						<div class="form-group">
							<label for="education" class="col-lg-2 control-label">
								<span class="glyphicon glyphicon-pencil"></span>
							</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="5" cols="20" placeholder="描述"></textarea>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button onclick="this.form.action='../InitServlet';this.form.submit()" class="btn btn-default">不，暂不添加</button>
								<button onclick="this.form.action='../InitInfo';this.form.submit()" class="btn btn-primary">提交</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div><!-- end container -->

	</body>
</html>