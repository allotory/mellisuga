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

<script src="../../js/jquery-1.11.2.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/popover.js"></script>
<script src="../../js/tooltip.js"></script>    
<script type="text/javascript">
$(function () {
	  $('[data-toggle="popover"]').popover()
	})
</script>
<script>
/**
 * 文本框根据输入内容自适应高度
 * @param                {HTMLElement}        输入框元素
 * @param                {Number}                设置光标与输入框保持的距离(默认0)
 * @param                {Number}                设置最大高度(可选)
 */
var autoTextarea = function (elem, extra, maxHeight) {
        extra = extra || 0;
        var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
        isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
                addEvent = function (type, callback) {
                        elem.addEventListener ?
                                elem.addEventListener(type, callback, false) :
                                elem.attachEvent('on' + type, callback);
                },
                getStyle = elem.currentStyle ? function (name) {
                        var val = elem.currentStyle[name];
                        
                        if (name === 'height' && val.search(/px/i) !== 1) {
                                var rect = elem.getBoundingClientRect();
                                return rect.bottom - rect.top -
                                        parseFloat(getStyle('paddingTop')) -
                                        parseFloat(getStyle('paddingBottom')) + 'px';        
                        };
                        
                        return val;
                } : function (name) {
                                return getComputedStyle(elem, null)[name];
                },
                minHeight = parseFloat(getStyle('height'));
        
        
        elem.style.resize = 'none';
        
        var change = function () {
                var scrollTop, height,
                        padding = 0,
                        style = elem.style;
                
                if (elem._length === elem.value.length) return;
                elem._length = elem.value.length;
                
                if (!isFirefox && !isOpera) {
                        padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
                };
                scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
                
                elem.style.height = minHeight + 'px';
                if (elem.scrollHeight > minHeight) {
                        if (maxHeight && elem.scrollHeight > maxHeight) {
                                height = maxHeight - padding;
                                style.overflowY = 'auto';
                        } else {
                                height = elem.scrollHeight - padding;
                                style.overflowY = 'hidden';
                        };
                        style.height = height + extra + 'px';
                        scrollTop += parseInt(style.height) - elem.currHeight;
                        document.body.scrollTop = scrollTop;
                        document.documentElement.scrollTop = scrollTop;
                        elem.currHeight = parseInt(style.height);
                };
        };
        
        addEvent('propertychange', change);
        addEvent('input', change);
        addEvent('focus', change);
        change();
};
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
					<input type="text" size="50" class="form-control col-lg-8" placeholder="Search">
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
							<span class="page-title-latest glyphicon glyphicon-th-list">最新动态</span>
							<span class="page-title-setting"> 
								<a href="#" class="glyphicon glyphicon-cog">设置</a>
							</span>
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
									<a href="#" class="zg-link" title="Popover title" 
										data-toggle="popover" data-placement="bottom" 
										data-trigger="focus" tabindex="0"
										data-content="Vivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrum faucibus.">
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
										<a href="#" class="meta-item glyphicon glyphicon-plus">关注问题</a>  
										<a href="#" class="meta-item glyphicon glyphicon-comment">添加评论</a>  
										<a href="#" class="meta-item glyphicon glyphicon-heart">感谢</a>
										<a href="#" class="meta-item glyphicon glyphicon-share">分享</a> 
										<a href="#" class="meta-item glyphicon glyphicon-bookmark">收藏</a>
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">没有帮助</a> 
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">举报</a> 
										<a href="#" class="meta-item-right glyphicon glyphicon-open">收起</a>
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
											<a href="#" class="meta-item glyphicon glyphicon-share-alt">回复</a>
											<a href="#" class="meta-item glyphicon glyphicon-thumbs-up">赞</a>
											<a href="#" class="meta-item glyphicon glyphicon-flag">举报</a>
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
											<a href="#" class="meta-item glyphicon glyphicon-share-alt">回复</a>
											<a href="#" class="meta-item glyphicon glyphicon-thumbs-up">赞</a>
											<a href="#" class="meta-item glyphicon glyphicon-flag">举报</a>
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
							<div class="avatar">
								<img src="../../img/avatar/b.jpg" class="avatar-img">
							</div>
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
									<a href="#" class="zg-link" title="Popover title" 
										data-toggle="popover" data-placement="top" 
										data-content="Vivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrVivamus sagittis lacus vel augue laoreet rutrum faucibus.">
										Kenneth</a> 回答了该问题 
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
										<a href="#" class="meta-item glyphicon glyphicon-plus">关注问题</a>  
										<a href="#" class="meta-item glyphicon glyphicon-comment">添加评论</a>  
										<a href="#" class="meta-item glyphicon glyphicon-heart">感谢</a>
										<a href="#" class="meta-item glyphicon glyphicon-share">分享</a> 
										<a href="#" class="meta-item glyphicon glyphicon-bookmark">收藏</a>
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">没有帮助</a> 
										<span class="zg-bull">•</span>
										<a href="#" class="meta-item">举报</a> 
										<a href="#" class="meta-item-right glyphicon glyphicon-open">收起</a>
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