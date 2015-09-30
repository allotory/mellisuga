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
	<title>提问 - <%=sitename %></title>
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
									data-target="#myModal" data-backdrop="false">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form>

				<!-- navbar -->
				<%@include file="navbar.jsp" %>
			</div>
		</div>
	</div>

    <div class="container">

      	<!-- main content -->
		<div class="question-main-content col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<div class="row">
				<form class="form-horizontal" action="./AskServlet" method="post">
					<fieldset>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2 col-md-offset-2">
								<input type="text" class="form-control" name="question_title" id="question_title" placeholder="写下你的问题">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2 col-md-offset-2">
								<label for="inputName" class="control-label">问题说明（可选）：</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2 col-md-offset-2">
								<div class="editor">
									<textarea id="myEditor" name="question_content"></textarea>
								</div>

								<script>
								$(function() {
									var myEditor = new Editor();
									myEditor.render('#myEditor');
								});
								</script>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2 col-md-offset-2">
								<label for="inputName" class="control-label">选择话题：</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2 col-md-offset-2">
								<input type="text" class="form-control" name="tags" id="tokenfield" data-role="tagsinput" placeholder="搜索话题">
								<span class="help-block">话题越精准，越容易让相关领域专业人士看到你的问题</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2 col-md-offset-2">
								<div class="checkbox">
									<label>
										<input type="checkbox" name="is_anonymous" value="0">匿名
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2 col-md-offset-2">
								<button type="reset" class="btn btn-default">取消</button>
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>