<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>帐号设置 - 解惑</title>
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
					data-target="#navbar-main"></button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<form class="navbar-form navbar-left">
					<input type="text" class="form-control col-lg-8" size="50"
						placeholder="Search">
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
				<div class="col-lg-12">
					<h2 id="nav-tabs"></h2>
					<div class="bs-component">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#account" data-toggle="tab">帐号</a></li>
							<li><a href="#password" data-toggle="tab">密码</a></li>
							<li><a href="#notification" data-toggle="tab">消息和邮件</a></li>
							<li><a href="#bind" data-toggle="tab">社区绑定</a></li>
							<li><a href="#filter" data-toggle="tab">屏蔽</a></li>
							<li><a href="#lab" data-toggle="tab">实验室</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade active in" id="account">
								<form class="form-horizontal setting-form">
									<fieldset>
										<div class="form-group">
											<label class="col-lg-1 control-label">姓名:</label>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="姓">
											</div>
											<div class="col-lg-2">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="名">
											</div>
											<div class="col-lg-7">
												提示消息
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-1 control-label">个性网址:</label>
											<div class="col-lg-4">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="xxx.com/people/aaaa">
											</div>
											<div class="col-lg-7">
												提示消息
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-1 control-label">邮箱:</label>
											<div class="col-lg-4">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="Email">
											</div>
											<div class="col-lg-7">
												提示消息
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-1 control-label">隐私保护:</label>
											<div class="checkbox" class="col-lg-11">
												<label> 
													<input type="checkbox"> 有私信时邮件提醒我
												</label>
											</div>
										</div>
					                  	<div class="form-group">
					                    	<div class="col-lg-10 col-lg-offset-2">
					                      		<button class="btn btn-default">重置</button>
					                      		<button type="submit" class="btn btn-primary">保存</button>
					                    	</div>
					                  	</div>
									</fieldset>
								</form>
							</div>
							<div class="tab-pane fade" id="password">
								<form class="form-horizontal setting-form">
									<fieldset>
										<div class="form-group">
											<label class="col-lg-1 control-label">当前密码:</label>
											<div class="col-lg-4">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="当前密码">
											</div>
											<div class="col-lg-7">
												提示消息
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-1 control-label">新的密码:</label>
											<div class="col-lg-4">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="新的密码">
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-1 control-label">确认密码:</label>
											<div class="col-lg-4">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="确认密码">
											</div>
										</div>
					                  	<div class="form-group">
					                    	<div class="col-lg-10 col-lg-offset-2">
					                      		<button class="btn btn-default">重置</button>
					                      		<button type="submit" class="btn btn-primary">保存</button>
					                    	</div>
					                  	</div>
									</fieldset>
								</form>
							</div>

							<div class="tab-pane fade" id="notification">
								<br>
								<form class="form-horizontal setting-form">
									<fieldset>
										<legend>私信设置</legend>
										<div class="form-group">
											<label class="col-lg-2 control-label">有人给我发了私信</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 允许所有人给我发私信
													</label> 
													<label class="col-lg-7"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只允许我关注的人给我发私信
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有私信时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<legend>消息设置</legend>
										<div class="form-group">
											<label class="col-lg-2 control-label">邀请我回答问题</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-7"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="col-lg-2 control-label">关注的问题有了新回答</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-7"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> <input type="checkbox">
														获取你接收消息范围内的全部新回答通知，即便这些回答质量可能不够高。 <a href="">选中这个会发生什么？</a>
													</label>
												</div>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="col-lg-2 control-label">@ / 评论我</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
													<label class="col-lg-4"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 不接收任何人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="col-lg-2 control-label">赞同 / 感谢我的回答</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
													<label class="col-lg-4"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 不接收任何人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="col-lg-2 control-label">赞了我的评论</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
													<label class="col-lg-4"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 不接收任何人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="col-lg-2 control-label">赞了专栏文章</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
													<label class="col-lg-4"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 不接收任何人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="col-lg-2 control-label">有人关注了我</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
													<label class="col-lg-4"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 不接收任何人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="col-lg-2 control-label">有人关注了我的专栏</label>
											<div class="col-lg-10">
												<div class="radio">
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios1" 
															value="option1" checked="checked"> 接收所有人的消息
													</label> 
													<label class="col-lg-3"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 只接收关注人的消息
													</label>
													<label class="col-lg-4"> 
														<input type="radio" name="optionsRadios" id="optionsRadios2" 
															value="option2"> 不接收任何人的消息
													</label>
												</div>
												<div class="checkbox" class="col-lg-10">
													<label> 
														<input type="checkbox"> 有消息时邮件提醒我
													</label>
												</div>
											</div>
										</div>
										<legend>邮件设置</legend>
										<div class="form-group">
											<label class="col-lg-2 control-label">知乎每周精选</label>
											<div class="col-lg-10">
												<div class="checkbox">
													<label> 
														<input type="checkbox"> 接收每周精选邮件
													</label>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-2 control-label">新品发布和活动通知</label>
											<div class="col-lg-10">
												<div class="checkbox">
													<label> 
														<input type="checkbox"> 有新品发布或活动举行时发邮件给我
													</label>
												</div>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
							
							<div class="tab-pane fade" id="bind">
								<form class="form-horizontal setting-form">
									<fieldset>
										<span>绑定社区帐号后，你可以在知乎上找到你的好友，邀请好友加入知乎，以及把精彩问答分享到其他社区。</span>
										<div>
											<a href="">绑定新浪微博帐号</a>
										</div>
										<div>
											<a href="">绑定 QQ 帐号</a>
										</div>
									</fieldset>
								</form>
							</div>

							<div class="tab-pane fade" id="filter">
								<form class="form-horizontal setting-form">
									<fieldset>
										<legend>屏蔽话题设置</legend>
										<span class="">在个人首页动态中屏蔽来自特定话题的内容</span>
										<div class="form-group">
											<div class="col-lg-4">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="">
											</div>
											<div class="col-lg-8">
												提示消息
											</div>
										</div>
										<legend>受限话题</legend>
										<span class="">
											除非主动关注，来自以下话题和它们的部分子话题的内容不会出现在你的首页动态中。<br>
											<a href="">详情参见 知乎上的哪些内容需要主动关注才会出现在首页动态中？</a>
										</span>
										<div class="">
											<span class="label label-primary">知乎社区</span> 
											<span class="label label-primary">个人咨询</span> 
											<span class="label label-primary">调查类问题</span> 
											<span class="label label-primary">感情</span> 
										</div>
										<br>
										<legend>屏蔽专栏设置</legend>
										<span class="">
											在个人首页动态中屏蔽来自特定专栏的内容
										</span>
										<div>
											还没有被屏蔽的专栏
										</div>
										<br>
										<legend>屏蔽用户设置</legend>
										<span class="">
											在个人首页动态中屏蔽来自特定用户的内容
										</span>
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
													<td>1</td>
												  	<td>向东</td>
												  	<td>SB</td>
												  	<td>
												  		<a href="#" class="btn btn-default btn-sm">取消屏蔽</a>
												  	</td>
												</tr>
												<tr>
												  	<td>2</td>
												  	<td>向西</td>
												  	<td>SB</td>
												  	<td>
												  		<a href="#" class="btn btn-primary btn-sm">Small button</a>
												  	</td>
												</tr>
												<tr class="info">
												  	<td>3</td>
												  	<td>Column content</td>
												  	<td>Column content</td>
												  	<td>Column content</td>
												</tr>
												<tr>
												  	<td>4</td>
												  	<td>Column content</td>
												  	<td>Column content</td>
												  	<td>Column content</td>
												</tr>
							                </tbody>
							              </table> 
										  <ul class="pagination">
											  <li class="disabled"><a href="#">&laquo;</a></li>
											  <li class="active"><a href="#">1</a></li>
											  <li><a href="#">2</a></li>
											  <li><a href="#">3</a></li>
											  <li><a href="#">4</a></li>
											  <li><a href="#">5</a></li>
											  <li><a href="#">&raquo;</a></li>
										   </ul>
									</fieldset>
								</form>
							</div>
							
							<div class="tab-pane fade" id="lab">
								<form class="form-horizontal setting-form">
									<fieldset>
										<legend>首页动态</legend>
					                  	<div class="form-group">
										<div class="col-lg-6">
											<div class="checkbox">
												<label> 
													<input type="checkbox"> 有新品发布或活动举行时发邮件给我
													（可随时在设置页开启或者关闭。）
												</label>
											</div>
										</div>
				                    	<div class="col-lg-1">
				                      		<button type="submit" class="btn btn-primary">保存</button>
				                    	</div>
					                  	</div>
									</fieldset>
								</form>
							</div>
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