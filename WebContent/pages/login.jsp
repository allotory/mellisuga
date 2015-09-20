<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="sitename.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><%=sitename %> - 与世界分享你的知识、经验和见解</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" href="../css/bootstrap.css" media="screen">
	<link rel="stylesheet" href="../css/style.css" media="screen">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/respond.min.js"></script>
	<![endif]-->

	<script src="../js/jquery-1.11.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/common.js"></script>

<%
	String flag = (String) request.getSession().getAttribute("flag");
	if("regsuccess".equals(flag) || "notexist".equals(flag)) {
%>
	<script type="text/javascript">
		window.onload = loginManager;
	</script>
<%
	}
%>
</head>
<body style="background: #f1f5f8">
	<div class="container-fluid login-main">
		<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<!-- left main content wrap  -->

			<div class="login-logo col-lg-6 col-md-6 col-sm-12 col-xs-12 col-md-offset-2">
				<img src="../images/logo.png">
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				
				<div class="col-lg-8 col-md-8 col-sm-4 col-xs-8">
					<div class="sign-in-up">
						<span id="register_title" style="display:inline">注册帐号</span>
						<span id="login_title" style="display:none">登录</span>
						<span class="sign-in-title">
							<a id="login_btn" href="#" style="display:inline" onclick="loginManager()">登录</a>
							<a id="register_btn" href="#" style="display:none" onclick="loginManager()">注册</a>
							<span class="glyphicon glyphicon-circle-arrow-right"></span>
						</span>
					</div>
					
					<form id="login_form" class="form-horizontal" action="../LoginServlet" method="post" style="display:none">
						<fieldset>
							<div class="form-group">
								<input type="text" class="form-control" name="email" id="email" placeholder="邮箱">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password" id="password" placeholder="密码">
							</div>
							<div class="form-group">
								<div id="alert_error" class="alert alert-dismissible alert-danger" style="display:none">
									<div id="email_error" style="display:none">
										<span class="glyphicon glyphicon-exclamation-sign"></span> 邮箱地址不正确.
									</div>
									<div id="pass_error" style="display:none">
										<span class="glyphicon glyphicon-exclamation-sign"></span> 请输入6-128位的密码.
									</div>
								</div>
								<%
									if("notexist".equals(flag)) {
								%>
								<div id="login_info" class="alert alert-dismissible alert-danger">
									<div id="login_infos">
										<span class="glyphicon glyphicon-exclamation-sign"></span> 用户名或密码错误.
									</div>
								</div>
								<%
									}
								%>
							</div>
							<div class="form-group">
								<button type="submit" onClick="return validateLoginSubmit();" class="btn btn-primary btn-block">提交</button>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="remember_me" value="yes"> 记住我
									</label>
								</div>
							</div>
						</fieldset>
					</form>
					
					<form id="register_form" action="../RemoteRegisterServlet" method="post" class="form-horizontal" style="display:inline">
						<fieldset>
							<div class="form-group">
								<input type="text" class="form-control" id="rusername" name="rusername" placeholder="用户名">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="remail" name="remail" placeholder="邮箱">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="rpassword" name="rpassword" placeholder="密码（不少于6位）">
							</div>
							<div class="form-group">
								<div id="ralert_error" class="alert alert-dismissible alert-danger" style="display:none">
									<div id="rusername_error" style="display:none">
										<span class="glyphicon glyphicon-exclamation-sign"></span> 用户名需在6-20个字符之间.
									</div>
									<div id="remail_error" style="display:none">
										<span class="glyphicon glyphicon-exclamation-sign"></span> 邮箱地址不正确.
									</div>
									<div id="rpass_error" style="display:none">
										<span class="glyphicon glyphicon-exclamation-sign"></span> 请输入6-128位的密码.
									</div>
								</div>
								<%
									if("regsuccess".equals(flag)) {
								%>
								<div id="login_info" class="alert alert-dismissible alert-danger">
									<div id="login_infos">
										<span class="glyphicon glyphicon-exclamation-sign"></span> 注册成功，请登录.
									</div>
								</div>
								<%
									}
								%>
							</div>
							<div class="form-group">
								<button type="submit" onClick="return validateRegSubmit();" class="btn btn-primary btn-block">注册</button>
							</div>
						</fieldset>
					</form>
					
				</div>
			</div>

		</div>

	</div><!-- end container -->	

	<div class="container-fluid">
		<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<!-- TODO nothing -->
		</div>
	</div><!-- end container -->
</body>
</html>