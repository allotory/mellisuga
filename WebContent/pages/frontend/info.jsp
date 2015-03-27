<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>消息 - 解惑</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/bootstrap.css" media="screen">
<link rel="stylesheet" href="../../css/common.css" media="screen">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../js/html5shiv.js"></script>
      <script src="../../js/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" src="../../js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand">解惑</a>
				<button class="navbar-toggle" type="button" 
					data-toggle="collapse" data-target="#navbar-main"></button>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="info-content">
			<div class="row">
				<div class="col-lg-8 col-md-offset-2">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">注册成功</h3>
						</div>
						<div class="panel-body">
							<div class="col-lg-8 col-md-offset-2">
								<div class="col-lg-9 col-md-offset-3">
									<span style="font-size:2em">
										恭喜您注册成功
									</span>
								</div>
								<div class="col-lg-8 col-md-offset-4">
									<span id="time">5</span>秒钟之后自动跳转
								</div>
								<div class="col-lg-9 col-md-offset-3">
									如不跳转，请点击链接 
									<a href="index.jsp">跳转页面</a>
								</div>
								<script type="text/javascript"> 
									delayURL("index.jsp"); 
								</script> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>