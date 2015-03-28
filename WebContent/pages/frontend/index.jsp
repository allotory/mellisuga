<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首页 - 解惑</title>
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
<script type="text/javascript" src="../../js/popover.js"></script>
<script type="text/javascript" src="../../js/tooltip.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>    
<script>
  $(function(){
    $('#pop_demo').popover({trigger:'click',html:'true',placement:'right',title:'hello',content:'Vivamus sagittis <a href=\'#\'>lacus</a> vel augue laoreet'});
    //$('#element').popover('show')hide toggle destroy
    //$('#pop_demo').popover('show');
    
  })
</script>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand">解惑</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#navbar-main">
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<form class="navbar-form navbar-left">
					<div class="form-group">
						<div class="input-group">
							<input type="text" size="50" class="form-control" placeholder="Search">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button">搜索</button>
							</span>
						</div>
					</div>
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
				<div class="col-lg-8 col-md-7 col-sm-6">
					<div class="page-title">
						<div>
							<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> 最新动态
							<span class="page-title-setting"> 
								<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 设置
							</span>
						</div>
					</div>
					
					<hr>
					<div class="row index-list">
						<div class="col-lg-1 col-md-1 col-sm-1">
							<div class="avatar"><img src="../../img/avatar/b.jpg" class="avatar-img"></div>
							<div>
								<span class="up-down">333</span>
							</div><!-- 
							<div>
								<span class="up-down">2</span>
							</div> -->
						</div>

						<div class="col-lg-11 col-md-11 col-sm-11">
							<div class="feed-main">
								<div class="source">
									<a href="#" class="zg-link" 
										rel="popover" id="pop_demo">
										Kenneth
									</a> 回答了该问题 
									<span class="time">42 分钟前</span>
								</div>
								<div class="content">
									<a href="" class="question-link">雨为什么是一滴一滴下的？</a>
									<div class="entry-body">
										<p>
											Nullam quis risus eget <a href="#">urna mollis ornare</a>
										</p>
									</div>
									<a class="answer-date-link" target="_blank" href="#">发布于 18:14</a>
									<div class="feed-meta">
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
											关注问题
										</a>  
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 
											添加评论
										</a>  
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 
											感谢
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-share" aria-hidden="true"></span> 
											分享
										</a> 
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> 
											收藏
										</a>
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">没有帮助</a> 
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">举报</a> 
										<a href="#" class="meta-item-right">
											<span class="glyphicon glyphicon-open" aria-hidden="true"></span> 
											收起
										</a>
									</div>
								</div>
							</div>
							<div class="comment panel panel-default">
				                <div class="panel-body" style="padding:10px 0 10px;border-bottom: 1px solid #eeeeee;">
				                	<div class="col-lg-1 col-md-1 col-sm-1">
										<img src="../../img/avatar/b.jpg" class="avatar-img-small">
									</div>
									<div class="col-lg-11 col-md-11 col-sm-11">
										<div><a href="#">Kenneth</a></div>
										<div>看到整体感本来想点赞同的，看到吐槽安卓的部分。。。
										至于安卓和苹果的操作栏谁更先进的问题可以尝试用一下就知道了。
										大屏时代使用界面内导航并安置在左上角的，如果不是苹果估计现在已经成为历史尘埃了。
										安卓完全无意识去培养逻辑，真正牛逼的是苹果，直接让你错觉了。</div>
										<div class="feed-meta">
											<a href="#" class="meta-item">14:05</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> 
												回复
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 
												赞
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-flag" aria-hidden="true"></span> 
												举报
											</a>
										</div>
									</div>
				                </div>
				                
				                <div class="panel-body" style="padding:10px 0 10px;border-bottom: 1px solid #eeeeee;">
				                	<div class="col-lg-1 col-md-1 col-sm-1">
										<img src="../../img/avatar/b.jpg" class="avatar-img-small">
									</div>
									<div class="col-lg-11 col-md-11 col-sm-11">
										<div><a href="#">Kenneth</a></div>
										<div>看到整体感本来想点赞同的，看到吐槽安卓的部分。。。
										至于安卓和苹果的操作栏谁更先进的问题可以尝试用一下就知道了。
										大屏时代使用界面内导航并安置在左上角的，如果不是苹果估计现在已经成为历史尘埃了。
										安卓完全无意识去培养逻辑，真正牛逼的是苹果，直接让你错觉了。</div>
										<div class="feed-meta">
											<a href="#" class="meta-item">14:05</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> 
												回复
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 
												赞
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-flag" aria-hidden="true"></span> 
												举报
											</a>
										</div>
									</div>
				                </div>
				                
				                <div class="panel-body" style="padding:10px 0 10px;">
									<div class="col-lg-12">
										<div class="form-group">
						                   	<textarea class="form-control" style="display: block;margin:0 auto;overflow: hidden;" rows="1" id="textArea" placeholder="请写下你的评论..."></textarea>
					                		<script> 
												var text = document.getElementById("textArea");
												autoTextarea(text);// 调用
											</script> 
					                	</div>
				                  	<div class="form-group">
				                    	<div class="col-lg-3 col-lg-offset-9">
				                      		<button class="btn btn-default btn-sm">取消</button>
				                      		<button type="submit" class="btn btn-primary btn-sm">评论</button>
				                    	</div>
				                  	</div>
									</div>
				                </div>
				            </div>
						</div>
					</div>
					
					<div class="row index-list">
						<div class="col-lg-1 col-md-1 col-sm-1">
							<div class="avatar"><img src="../../img/avatar/b.jpg" class="avatar-img"></div>
							<div>
								<span class="up-down">333</span>
							</div><!-- 
							<div>
								<span class="up-down">2</span>
							</div> -->
						</div>

						<div class="col-lg-11 col-md-11 col-sm-11">
							<div class="feed-main">
								<div class="source">
									<a href="#" class="zg-link" 
										rel="popover" id="pop_demo">
										Kenneth
									</a> 回答了该问题 
									<span class="time">42 分钟前</span>
								</div>
								<div class="content">
									<a href="" class="question-link">雨为什么是一滴一滴下的？</a>
									<div class="entry-body">
										<p>
											Nullam quis risus eget <a href="#">urna mollis ornare</a>
										</p>
									</div>
									<a class="answer-date-link" target="_blank" href="#">发布于 18:14</a>
									<div class="feed-meta">
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
											关注问题
										</a>  
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 
											添加评论
										</a>  
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 
											感谢
										</a>
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-share" aria-hidden="true"></span> 
											分享
										</a> 
										<a href="#" class="meta-item">
											<span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> 
											收藏
										</a>
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">没有帮助</a> 
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">举报</a> 
										<a href="#" class="meta-item-right">
											<span class="glyphicon glyphicon-open" aria-hidden="true"></span> 
											收起
										</a>
									</div>
								</div>
							</div>
							<div class="comment panel panel-default">
				                <div class="panel-body" style="padding:10px 0 10px;border-bottom: 1px solid #eeeeee;">
				                	<div class="col-lg-1 col-md-1 col-sm-1">
										<img src="../../img/avatar/b.jpg" class="avatar-img-small">
									</div>
									<div class="col-lg-11 col-md-11 col-sm-11">
										<div><a href="#">Kenneth</a></div>
										<div>看到整体感本来想点赞同的，看到吐槽安卓的部分。。。
										至于安卓和苹果的操作栏谁更先进的问题可以尝试用一下就知道了。
										大屏时代使用界面内导航并安置在左上角的，如果不是苹果估计现在已经成为历史尘埃了。
										安卓完全无意识去培养逻辑，真正牛逼的是苹果，直接让你错觉了。</div>
										<div class="feed-meta">
											<a href="#" class="meta-item">14:05</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> 
												回复
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 
												赞
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-flag" aria-hidden="true"></span> 
												举报
											</a>
										</div>
									</div>
				                </div>
				                
				                <div class="panel-body" style="padding:10px 0 10px;border-bottom: 1px solid #eeeeee;">
				                	<div class="col-lg-1 col-md-1 col-sm-1">
										<img src="../../img/avatar/b.jpg" class="avatar-img-small">
									</div>
									<div class="col-lg-11 col-md-11 col-sm-11">
										<div><a href="#">Kenneth</a></div>
										<div>看到整体感本来想点赞同的，看到吐槽安卓的部分。。。
										至于安卓和苹果的操作栏谁更先进的问题可以尝试用一下就知道了。
										大屏时代使用界面内导航并安置在左上角的，如果不是苹果估计现在已经成为历史尘埃了。
										安卓完全无意识去培养逻辑，真正牛逼的是苹果，直接让你错觉了。</div>
										<div class="feed-meta">
											<a href="#" class="meta-item">14:05</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> 
												回复
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 
												赞
											</a>
											<a href="#" class="meta-item">
												<span class="glyphicon glyphicon-flag" aria-hidden="true"></span> 
												举报
											</a>
										</div>
									</div>
				                </div>
				                
				                <div class="panel-body" style="padding:10px 0 10px;">
									<div class="col-lg-12">
										<div class="form-group">
						                   	<textarea class="form-control" style="display: block;margin:0 auto;overflow: hidden;" rows="1" id="textArea" placeholder="请写下你的评论..."></textarea>
					                		<script> 
												var text = document.getElementById("textArea");
												autoTextarea(text);// 调用
											</script> 
					                	</div>
				                  	<div class="form-group">
				                    	<div class="col-lg-3 col-lg-offset-9">
				                      		<button class="btn btn-default btn-sm">取消</button>
				                      		<button type="submit" class="btn btn-primary btn-sm">评论</button>
				                    	</div>
				                  	</div>
									</div>
				                </div>
				            </div>
						</div>
					</div>
					

				</div>

				<div class="col-lg-3 col-md-4 col-sm-5  col-md-offset-1">
					<div class="list-group">
						<a href="#" class="list-group-item glyphicon glyphicon-file">
							我的草稿 </a> <a href="#"
							class="list-group-item glyphicon glyphicon-bookmark"> 我的收藏 </a> <a
							href="#" class="list-group-item glyphicon glyphicon-heart">
							我关注的问题 </a> <a href="#"
							class="list-group-item glyphicon glyphicon-check"> 邀请我回答的问题 </a>
					</div>

					<div class="list-group">
						<a href="#" class="list-group-item glyphicon glyphicon-duplicate">
							所有问题 </a> <a href="#"
							class="list-group-item glyphicon glyphicon-th-large"> 话题广场 </a> <a
							href="#" class="list-group-item glyphicon glyphicon-book">
							首场秀 </a> <a href="#" class="list-group-item glyphicon glyphicon-edit">
							公共编辑动态 </a> <a href="#"
							class="list-group-item glyphicon glyphicon-home"> 社区服务中心 </a>
					</div>

				</div>
			</div>
		</div>
		
	</div>
</body>
</html>