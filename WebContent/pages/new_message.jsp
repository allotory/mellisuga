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
	<title>私信 - <%=sitename %></title>
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
						
						<div class="">
							<div class="row col-lg-9 col-md-9 col-sm-9 col-xs-12">
								<form class="form-horizontal" method="post">
								
								<div class="inbox-back">
									<a href="./pages/inbox.jsp">« 返回</a>
								</div>
									<fieldset>
										<div class="form-group">
											<label for="education" class="col-lg-2 control-label">
												发给: 
											</label>
											<div class="col-lg-10">
												<input type="text" list="member_list" oninput="autoCompleteMember(this.id);" class="form-control" name="member_name" id="member_name" placeholder="">
											</div>
											<!-- 自动补全列表 -->
											<datalist id="member_list"></datalist>
										</div>
										<div class="form-group">
											<label for="description" class="col-lg-2 control-label">
												内容:
											</label>
											<div class="col-lg-10">
												<textarea class="form-control" name="description" rows="5" cols="20" placeholder=""></textarea>
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-lg-10 col-lg-offset-2">
												<button onclick="this.form.action='../InitInfo';this.form.submit()" class="btn btn-primary">提交</button>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div><!-- end left main title -->
					</div><!-- end left main title row -->

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