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
	<script src="../js/jquery-1.11.2.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

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
				<a href="../" class="navbar-brand">Mellisuga</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button">Go!</button>
						</span>
					</div>
				</form>

				<ul class="nav navbar-nav">
					<li class="active">
						<a href="#">首页 <span class="sr-only">(current)</span></a>
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
		<div class="question-main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="row">
				<div class="left-main col-lg-8 col-md-8 col-sm-12 col-xs-12">

					<!--left main title row-->
					<div class="row">
						<div class="question-detail">
							<div class="question-tag">
								<span class="label label-primary">Default</span>
								<span class="label label-primary">Primary</span>
								<span class="label label-primary">Success</span>
								<span class="label label-primary">Warning</span>
								<span class="label label-primary">Danger</span>
								<span class="label label-primary">Info</span>
								<a href="#" class="item-edit">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
									修改
								</a>
							</div>
							<div class="question-title">
								<strong>为什么腾讯这么大的公司都不提供宿舍？</strong>
								<a href="#" class="item-edit">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
									修改
								</a>
							</div>
							<div class="question-contents">
								住宿是可以产生规模化效应的，4人住一个宿舍，空调费还可以平摊。<br/>
								如果在离公司较近的地方租一幢房子，显然比员工单独租房划算吧？
								<a href="#" class="item-edit">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
									修改
								</a>
							</div>
							<div class="q-meta-panel">
								<a href="#" class="q-meta-item">
									<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 
									添加评论
								</a>
								<a href="#" class="q-meta-item">
									<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> 
									分享
								</a> 
								<span class="zg-bull">•</span> 
								<a href="#" class="q-meta-item">邀请回答</a>
								<a href="#" class="q-meta-item-right">
									<span class="glyphicon glyphicon-flag" aria-hidden="true"></span> 
									举报
								</a>
							</div>
						</div><!-- end question detail -->

						<div class="answer-info">
							<span>19个回答</span>
							<div class="btn-group answer-sort">
								<a href="#" class="btn btn-default btn-xs">按票数排序</a> 
								<a href="#" class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">按时间排序</a></li>
								</ul>
							</div>
						</div><!-- end answer info -->
					</div><!-- end question title row -->

					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								<div class="row">
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-up" style="display:block;"></span>
											<span style="display:block;">122</span>
										</a>
									</div>
									
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-down"></span>
										</a>
									</div>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">

								<div class="row">
									<div class="content-source">
										<a href="#">空明流转</a> 赞同该回答
										<span class="source-time">3小时前</span>
									</div>
								</div>

								<div class="row">
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								</div>

								<div class="row">
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								</div>

								<div class="row">
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 14:36</a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
										</div>
									</div>
								</div>

								<div class="row">
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<span class="glyphicon glyphicon-plus"></span> 关注问题
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-comment"></span> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<span class="glyphicon glyphicon-heart-empty"></span> 感谢
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-share-alt"></span> 分享
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-bookmark"></span> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
											举报
										</a>
										<span class="copyright"></span>
										<a href="#" class="answer-collapse meta-item">
											<span class="glyphicon glyphicon-open"></span> 收起
										</a>
									</div>
								</div>

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->

					<div class="row">
						<hr/>
					</div>

					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="../images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								<div class="row">
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-up" style="display:block;"></span>
											<span style="display:block;">122</span>
										</a>
									</div>
									
									<div class="vote-text-center vote-number">
										<a href="#">
											<span class="glyphicon glyphicon-chevron-down"></span>
										</a>
									</div>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-11 col-xs-11">

								<div class="row">
									<div class="content-source">
										<a href="#">空明流转</a> 赞同该回答
										<span class="source-time">3小时前</span>
									</div>
								</div>

								<div class="row">
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								</div>

								<div class="row">
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								</div>

								<div class="row">
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 14:36</a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<span class="glyphicon glyphicon-plus"></span> 关注问题
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-comment"></span> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<span class="glyphicon glyphicon-heart-empty"></span> 感谢
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-share-alt"></span> 分享
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-bookmark"></span> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
											举报
										</a>
										<span class="copyright"></span>
										<a href="#" class="answer-collapse meta-item">
											<span class="glyphicon glyphicon-open"></span> 收起
										</a>
									</div>
								</div>

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->

					<!-- loding more btn row  -->
					<div class="row">
						<div class="loding-btn">
							<a href="#" class="btn btn-default btn-block">加载更多</a>
						</div>
					</div><!-- end loding more btn row  -->

					<div class="row">
						<hr/>
					</div>

					<!-- post editor -->
					<div class="row">
						<div class="post-main">
							<div class="post-source">
								<a href="#" target="_blank">Kenneth</a>
							</div>
							<div class="content">
								<!--<textarea class="form-control" rows="5" id="editor"></textarea>-->
								<div class="editor">
									<textarea id="myEditor"></textarea>
								</div>

								<script>
								$(function() {
									var myEditor = new Editor();
									myEditor.render('#myEditor');
								});
								</script>

								<div class="checkbox post-module">
									<label> 
										<input type="checkbox">匿名
									</label>
									<button class="btn btn-default">取消</button>
									<button type="submit" class="btn btn-primary">提交</button>
								</div>
							</div>
						</div>
					</div><!-- end post editor -->

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
										
					<div class="follow-btn">
						<a href="#" class="btn btn-primary">关注问题</a>
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span class="glyphicon glyphicon-cog"></span></a> 
							<a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">使用匿名身份</a></li>
								<li><a href="#">问题重定向</a></li>
							</ul>
						</div>
					</div>

					<div class="sidebar-group">
						<span><a href="#">155</a> 人关注该问题</span>
					</div>

					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>相关问题</strong></span>
						<div class="similar-question-group">
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
						</div>
					</div>

					<hr>

					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>问题状态</strong></span>
						<div class="similar-question">
							最近活动于 10:02 • <a>查看问题日志</a><br>
							被浏览 6800 次，相关话题关注者 617946 人 9 个回答
						</div>
					</div>

				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>