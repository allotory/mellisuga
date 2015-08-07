<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Mellisuga</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" href="../css/bootstrap.css" media="screen">
	<link rel="stylesheet" href="../css/style.css" media="screen">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/respond.min.js"></script>
	<![endif]-->

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
						<span id="register_title" style="display:none">注册帐号</span>
						<span id="login_title" style="display:inline">登录</span>
						<span class="sign-in-title">
							<a id="login_btn" href="#" style="display:none" onclick="loginManager()">登录</a>
							<a id="register_btn" href="#" style="display:inline" onclick="loginManager()">注册</a>
							<span class="glyphicon glyphicon-circle-arrow-right"></span>
						</span>
					</div>
					
					<form id="login_form" class="form-horizontal" style="display:inline">
						<fieldset>
							<div class="form-group">
								<input type="text" class="form-control" id="email" placeholder="邮箱" onblur="validateEmail()">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="password" placeholder="密码" onblur="validatePass()">
							</div>
							<div class="form-group">
								<div id="alert_error" class="alert alert-dismissible alert-danger" style="display:none">
									<div id="email_error" style="display:none">
										<span class="glyphicon glyphicon-warning-sign"></span> 邮箱地址不正确.
									</div>
									<div id="pass_error" style="display:none">
										<span class="glyphicon glyphicon-warning-sign"></span> 请输入6-128位的密码.
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" onClick="return validateSubmit();" class="btn btn-primary btn-block">提交</button>
								<div class="checkbox">
									<label>
										<input type="checkbox"> 记住我
									</label>
								</div>
							</div>
						</fieldset>
					</form>
					
					<form id="register_form" class="form-horizontal" style="display:none">
						<fieldset>
							<div class="form-group">
								<input type="text" class="form-control" id="inputName" placeholder="姓名">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="inputName" placeholder="邮箱">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="inputName" placeholder="密码">
							</div>
							<div class="form-group">
								<div id="alert_error" class="alert alert-dismissible alert-danger" style="display:block">
									<div id="name_null" ><span class="glyphicon glyphicon-warning-sign"></span> and try submitting again.<br></div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block">提交</button>
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

	<script src="../js/jquery-1.11.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/common.js"></script>
</body>
</html>