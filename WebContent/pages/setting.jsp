<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="sitename.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>帐号设置 - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" href="../css/bootstrap.css" media="screen">
	<link rel="stylesheet" href="../css/style.css" media="screen">
	<link rel="stylesheet" href="../css/bootswatch.min.css">
	
	<script src="../js/jquery-1.11.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/common.js"></script>
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/respond.min.js"></script>
	<![endif]-->

	<!-- Taginput -->
	<script type="text/javascript" src="../plugin/Taginput/bootstrap-tagsinput.js"></script>
	<link rel="stylesheet" href="../plugin/Taginput/bootstrap-tagsinput.css">

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
				<a href="../" class="navbar-brand"><%=sitename %></a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<!-- search modal -->
				<%@include file="modal.jsp"%>

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
		<div class="main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="row">
				<ul class="nav nav-tabs">
					<li><a href="#account" data-toggle="tab">帐号</a></li>
					<li><a href="#password" data-toggle="tab">帐号和密码</a></li>
					<li><a href="#notification" data-toggle="tab">消息和邮件</a></li>
					<li><a href="#filter" data-toggle="tab">屏蔽</a></li>
					<li class="active"><a href="#lab" data-toggle="tab">实验室</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade col-lg-6 col-md-6 col-sm-12 col-xs-12" id="account">
						<form class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label for="inputName" class="col-lg-2 control-label">姓名</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="inputName" placeholder="Ellery">
										<span class="help-block">137 天后可以修改姓名.</span>
									</div>
								</div>
								<div class="form-group">
									<label for="inputUrl" class="col-lg-2 control-label">个性网址</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="inputUrl" placeholder="allotory">
										<span class="help-block">localhost/people/allotory</span>
									</div>
								</div>
								<div class="form-group">
									<label for="checkboxPrivate" class="col-lg-2 control-label">隐私保护</label>
									<div class="col-lg-10">
										<div class="checkbox">
											<label>
												<input type="checkbox">  在站外搜到我在知乎创作的内容时，我的姓名将不会被显示
											</label>
										</div>
										<span class="help-block">什么情况下应该使用这个选项？.</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="reset" class="btn btn-default">取消</button>
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
					<div class="tab-pane fade col-lg-6 col-md-6 col-sm-12 col-xs-12" id="password">
						<form class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label for="inputEmail" class="col-lg-2 control-label">邮箱</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="inputEmail" placeholder="all****@msn.com">
										<span class="help-block">修改邮箱需要输入原密码.</span>
									</div>
								</div>
								<div class="form-group">
									<label for="inputOriginPass" class="col-lg-2 control-label">原密码</label>
									<div class="col-lg-10">
										<input type="password" class="form-control" id="inputOriginPass" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputNewPass" class="col-lg-2 control-label">新密码</label>
									<div class="col-lg-10">
										<input type="password" class="form-control" id="inputNewPass" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputConfirmPass" class="col-lg-2 control-label">确认密码</label>
									<div class="col-lg-10">
										<input type="password" class="form-control" id="inputConfirmPass" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="reset" class="btn btn-default">取消</button>
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</div>
							</fieldset>
						</form>	
					</div>
					<div class="tab-pane fade col-lg-12 col-md-12 col-sm-12 col-xs-12" id="notification">
						<form class="form-horizontal">
							<fieldset>
								<legend>私信设置</legend>
								<div class="form-group">
									<label class="col-lg-2 control-label">有人给我发了私信</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
												允许所有人给我发私信
											</label>
											<label>
												<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
												只允许我关注的人给我发私信
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有私信时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<legend>消息设置</legend>
								<span class="help-block">你可以在这里设置接收的消息类型。「邀请我回答问题」和「关注的问题有了新回答」不支持关闭消息。</span>
								<div class="form-group">
									<label class="col-lg-2 control-label">邀请我回答的问题</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios2" id="optionsRadios3" value="option3" checked>
												接收所有人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios2" id="optionsRadios4" value="option4">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">关注的问题有了新答案</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios3" id="optionsRadios5" value="option5" checked>
												接收所有人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios3" id="optionsRadios6" value="option6">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox"checked> 获取你接收消息范围内的全部新回答通知，即便这些回答质量可能不够高。<a href="#">选中这个会发生什么？</a>
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">@/评论我的</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios4" id="optionsRadios7" value="option7" checked>
												接收所有人的消息
											</label>
											<label class="setting-margin">
												<input type="radio" name="optionsRadios4" id="optionsRadios8" value="option8">
												只接收关注人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios4" id="optionsRadios9" value="option9">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">赞同感谢我的</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios5" id="optionsRadios7" value="option7" checked>
												接收所有人的消息
											</label>
											<label class="setting-margin">
												<input type="radio" name="optionsRadios5" id="optionsRadios8" value="option8">
												只接收关注人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios5" id="optionsRadios9" value="option9">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">赞了我的评论</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios6" id="optionsRadios7" value="option7" checked>
												接收所有人的消息
											</label>
											<label class="setting-margin">
												<input type="radio" name="optionsRadios6" id="optionsRadios8" value="option8">
												只接收关注人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios6" id="optionsRadios9" value="option9">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">赞了专栏文章</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios7" id="optionsRadios7" value="option7" checked>
												接收所有人的消息
											</label>
											<label class="setting-margin">
												<input type="radio" name="optionsRadios7" id="optionsRadios8" value="option8">
												只接收关注人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios7" id="optionsRadios9" value="option9">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">有人关注了我</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios8" id="optionsRadios7" value="option7" checked>
												接收所有人的消息
											</label>
											<label class="setting-margin">
												<input type="radio" name="optionsRadios8" id="optionsRadios8" value="option8">
												只接收关注人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios8" id="optionsRadios9" value="option9">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">有人关注了专栏文章</label>
									<div class="col-lg-10">
										<div class="radio">
											<label class="setting-margin">
												<input type="radio" name="optionsRadios9" id="optionsRadios7" value="option7" checked>
												接收所有人的消息
											</label>
											<label class="setting-margin">
												<input type="radio" name="optionsRadios9" id="optionsRadios8" value="option8">
												只接收关注人的消息
											</label>
											<label>
												<input type="radio" name="optionsRadios9" id="optionsRadios9" value="option9">
												只接收关注人的消息
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有消息时邮件提醒我
											</label>
										</div>
									</div>
								</div>

								<legend>邮件设置</legend>
								<span class="help-block">你可以在这里设置是否接收来自知乎的邮件。</span>
								<div class="form-group">
									<label for="checkboxPrivate" class="col-lg-2 control-label">知乎每周精选</label>
									<div class="col-lg-10">
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 接收每周精选邮件
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="checkboxPrivate" class="col-lg-2 control-label">新品发布和活动通知</label>
									<div class="col-lg-10">
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 有新品发布或活动举行时发邮件给我
											</label>
										</div>
									</div>
								</div>

							</fieldset>
						</form>
					</div>
					<div class="tab-pane fade" id="filter">
						<form class="form-horizontal">
							<fieldset>
								<legend>屏蔽话题设置</legend>
								<span class="help-block">在个人首页动态中屏蔽来自特定话题的内容</span>
								<div class="hidden-div">

								</div>
								<div class="form-group">
									<div class="col-lg-4">
										<input type="text" class="form-control" id="inputName" placeholder="搜索话题">
									</div>
								</div>

								<legend>受限话题</legend>
								<span class="help-block">除非主动关注，来自以下话题和它们的部分子话题的内容不会出现在你的首页动态中。</span>
								<span class="help-block">详情参见 <a href="#">哪些内容需要主动关注才会出现在首页动态中？</a></span>
								<div class="question-tag">
									<span class="label label-primary">Default</span>
									<span class="label label-primary">Default</span>
									<span class="label label-primary">Default</span>
									<span class="label label-primary">Default</span>
								</div>

								<legend>屏蔽专栏设置</legend>
								<span class="help-block">在个人首页动态中屏蔽来自特定专栏的内容</span>
								<div class="question-tag">
									<span class="label label-primary">Default</span>
									<span class="label label-primary">Default</span>
									<span class="label label-primary">Default</span>
									<span class="label label-primary">Default</span>
								</div>

								<legend>屏蔽用户设置</legend>
								<span class="help-block">在个人首页动态中屏蔽来自特定用户的内容</span>
								<table class="table table-striped table-hover ">
									<thead>
										<tr>
											<th>#</th>
											<th>用户名</th>
											<th>屏蔽原因</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<tr class="info">
											<td>3</td>
											<td>Column content</td>
											<td>Column content</td>
											<td><a href="#" class="btn btn-default btn-xs">取消屏蔽</a></td>
										</tr>
										<tr class="success">
											<td>4</td>
											<td>Column content</td>
											<td>Column content</td>
											<td><a href="#" class="btn btn-default btn-xs">取消屏蔽</a></td>
										</tr>
										<tr class="danger">
											<td>5</td>
											<td>Column content</td>
											<td>Column content</td>
											<td><a href="#" class="btn btn-default btn-xs">取消屏蔽</a></td>
										</tr>
										<tr class="warning">
											<td>6</td>
											<td>Column content</td>
											<td>Column content</td>
											<td><a href="#" class="btn btn-default btn-xs">取消屏蔽</a></td>
										</tr>
										<tr class="active">
											<td>7</td>
											<td>Column content</td>
											<td>Column content</td>
											<td><a href="#" class="btn btn-default btn-xs">取消屏蔽</a></td>
										</tr>
									</tbody>
								</table> 

							</fieldset>
						</form>
					</div>
					<div class="tab-pane fade active in" id="lab">
						<form class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label for="checkboxPrivate" class="col-lg-2 control-label">首页动态</label>
									<div class="col-lg-10">
										<div class="checkbox">
											<label>
												<input type="checkbox" checked> 开启新版首页动态体验
												<span class="help-block">可随时在设置页开启或者关闭。</span>
											</label>
										</div>
									</div>
								</div>
								<hr>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</div>
							</fieldset>
						</form>	
					</div>
				</div>
			</div>	
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>