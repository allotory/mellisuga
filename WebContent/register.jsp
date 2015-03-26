<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册 - 解惑</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/bootstrap.css" media="screen">
<link rel="stylesheet" href="./css/common.css" media="screen">
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
					data-target="#navbar-main"></button>
			</div>
		</div>
	</div>
                      
	<div class="container">
		<div class="login-content">
			<div class="row">
				<div class="col-lg-10 col-md-offset-2">
					<form class="form-horizontal setting-form" action="RegisterServlet" method="post">
						<fieldset>
							<div id="usernameGroup" class="form-group">
								<label class="col-lg-2 control-label">用户名:</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" id="inputUsername" name="username"
										placeholder="用户名" onBlur="validateUsername('inputUsername','usernameGroup','usernameDiv');">
								</div>
								<div id="usernameDiv" class="alert alert-dismissable alert-danger col-lg-6" style="display:none">
					                <button type="button" class="close" data-dismiss="alert">&times;</button>
					                           用户名必须为6-15个以字母开头，可带数字、“_”的字符串
					            </div>
								<div id="userUniqueDiv" class="alert alert-dismissable alert-danger col-lg-6" style="display:none">
					                <button type="button" class="close" data-dismiss="alert">&times;</button>
					                           当前用户名已存在，请选择其他可用用户名
					            </div>
							</div>
							<div id="passGroup" class="form-group">
								<label class="col-lg-2 control-label">密码:</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" id="inputPassword" name="password"
										placeholder="密码" onblur="validatePassword('inputPassword','passGroup','passwordDiv')">
								</div>
								<div id="passwordDiv" class="alert alert-dismissable alert-danger col-lg-6" style="display:none">
					                <button type="button" class="close" data-dismiss="alert">&times;</button>
					                                密码必须为6-20个以字母开头，可带数字、“_”的字符串
					            </div>
							</div>
							<div id="confirmPassGroup" class="form-group">
								<label class="col-lg-2 control-label">确认密码:</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" id="inputConfirmPass" name="confirmpsw"
										placeholder="确认密码" onblur="validateConfirmPass('inputPassword', 'inputConfirmPass','confirmPassGroup', 'confirmPassDiv')">
								</div>
								<div id="confirmPassDiv" class="alert alert-dismissable alert-danger col-lg-6" style="display:none">
					                <button type="button" class="close" data-dismiss="alert">&times;</button>
					                                两次密码输入不一致
					            </div>
							</div>
							<div id="emailGroup" class="form-group">
								<label class="col-lg-2 control-label">注册邮箱:</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" id="inputEmail" name="email"
										placeholder="邮箱" onblur="validateEmail('inputEmail','emailGroup', 'emailDiv')">
								</div>
								<div id="emailDiv" class="alert alert-dismissable alert-danger col-lg-6" style="display:none">
					                <button type="button" class="close" data-dismiss="alert">&times;</button>
					                                邮箱格式输入错误
					            </div>
							</div>
		                  	<div class="form-group">
		                    	<div class="col-lg-10 col-lg-offset-2">
		                      		<button type="reset" class="btn btn-default">重置</button>
		                      		<button onClick="return validateSubmit();" type="submit" class="btn btn-primary">注册</button>
		                    	</div>
		                  	</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript" src="./js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./js/common.js"></script>
</body>
</html>