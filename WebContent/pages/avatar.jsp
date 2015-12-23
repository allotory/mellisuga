<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.bean.*" %>
<%@ page import="com.mellisuga.utils.*" %>
<%@ page import="com.mellisuga.function.*" %>
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
	<title>Ellery - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
		 $("#uploadify").uploadify({
				'auto' : false,
	            'swf' : '<%=path%>/plugin/Uploadify/js/uploadify.swf',
	            'uploader' : '../UploadServlet',			// 后台处理的请求
				'queueID' : 'fileQueue',					// 与下面的id对应
				'queueSizeLimit' : 1,
				'sizeLimit' : 2048000,  					// 允许上传的文件大小(kb)  此为2M
				'fileTypeDesc' : '支持格式:jpg/jpeg/png',
				'fileTypeExts' : '*.jpg;*.jpeg;*.png', 		// 控制可上传文件的扩展名，启用本项时需同时声明fileDesc
				'multi' : false,
				'buttonText' : '选择文件',
	            'onUploadSuccess' : function(file, data, response) {	// 当单个文件上传完成后触发
	                // fileObj : 选中文件的对象，他包含的属性列表
	                // response : 服务器端返回的Response文本，我这里返回的是处理过的文件名称
	                // data : 文件队列详细信息和文件上传的一般数据
	                
	                $("#image_target").attr("src", data);
	                $("#image_preview").attr("src", data);
	                // 图片路径设置完成后，显示图片
	                $("#image_view").css("display","block");
	                
	                // 隐藏上传按钮
	                $("#uploadify_btn").css("display", "none");
	                // 显示切片保存按钮
	                $("#save_btn").css("display", "block");
	                
	                // 初始化jcrop插件
	                $("#image_src").attr("value", data);
	                jcrop_cut();
	            }
			});
		});
		
		function jcrop_cut() {
			// Create variables (in this scope) to hold the API and image size
			var jcrop_api, boundx, boundy,
	
			// Grab some information about the preview pane
			$preview = $('#preview-pane');
			$pcnt = $('#preview-pane .preview-container');
			$pimg = $('#preview-pane .preview-container img');
	
			xsize = $pcnt.width();
			ysize = $pcnt.height();
	
			console.log('init', [ xsize, ysize ]);
			$('#image_target').Jcrop({
				onChange : updatePreview,
				onSelect : updatePreview,
				aspectRatio : 1,
				onRelease : clearCoords
			}, function() {
				// Use the API to get the real image size
				var bounds = this.getBounds();
				boundx = bounds[0];
				boundy = bounds[1];
				// Store the API in the jcrop_api variable
				jcrop_api = this;
	
				// Move the preview into the jcrop container for css positioning
				$preview.appendTo(jcrop_api.ui.holder);
			});
	
			function updatePreview(c) {
				// 设置input hidden
				showCoords(c);
				
				if (parseInt(c.w) > 0) {
					var rx = xsize / c.w;
					var ry = ysize / c.h;
	
					$pimg.css({
						width : Math.round(rx * boundx) + 'px',
						height : Math.round(ry * boundy) + 'px',
						marginLeft : '-' + Math.round(rx * c.x) + 'px',
						marginTop : '-' + Math.round(ry * c.y) + 'px'
					});
				}
			};
			
	 		$('#coords').on(
				'change',
				'input',
				function(e) {
					var x1 = $('#x1').val();
					var y1 = $('#y1').val();
					jcrop_api.setSelect([x1, y1]);
				}); 
		}
		
		// Simple event handler, called from onChange and onSelect
		// event handlers, as per the Jcrop invocation above
		function showCoords(c) {
			// 左上顶点
			$('#x').val(c.x);
			$('#y').val(c.y);
			// 长度宽度
			$('#w').val(c.w);
			$('#h').val(c.h);
		};
		
		function clearCoords() {
			$('#coords input').val('');
		};
	
	</script>
	<style type="text/css">
		/* Apply these styles only when #preview-pane has
		   been placed within the Jcrop widget */
		.jcrop-holder #preview-pane {
			display: block;
			position: absolute;
			z-index: 2000;
			top: 10px;
			right: -280px;
			padding: 6px;
			border: 1px rgba(0, 0, 0, .4) solid;
			background-color: white;
			-webkit-border-radius: 6px;
			-moz-border-radius: 6px;
			border-radius: 6px;
			-webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			-moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
		}
		
		/* The Javascript code will set the aspect ratio of the crop
		   area based on the size of the thumbnail preview,
		   specified here */
		#preview-pane .preview-container {
			width: 250px;
			height: 250px;
			overflow: hidden;
		}
	</style>
	<% 
		Member m = (Member) request.getSession().getAttribute("member"); 
	%>
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
						<input type="file" name="uploadify" id="uploadify" />
						<div id="fileQueue"></div>
						
						
						<!-- image view -->
						<div id="image_view" style="display:none">
							<img src="" id="image_target" alt="[Jcrop Example]"/>
							<div id="preview-pane">
								<div class="preview-container">
									<img src="" id="image_preview" class="jcrop-preview" alt="Preview" />
								</div>
							</div>
						</div>
						
						<p id="uploadify_btn" style="display:bolck;margin-top:10px;">
							<a href="javascript:$('#uploadify').uplaodify('cancel','*')" class="btn btn-default btn-sm">取消</a>
							<a href="javascript:$('#uploadify').uploadify('upload')" class="btn btn-primary btn-sm">开始上传</a>
						</p>
						
						<!-- This is the form that our event handler fills -->
						<form id="coords" class="coords" action="CutImageServlet" method="post">
							<input type="hidden" id="image_src" name="image_src"/>
							<div class="inline-labels">
								<input type="hidden" size="6" id="x" name="x" />
								<input type="hidden" size="6" id="y" name="y" />
								<input type="hidden" size="6" id="w" name="w" />
								<input type="hidden" size="6" id="h" name="h" />
							</div>
							<P id="save_btn" style="display:none; padding-top: 10px;">
								<input type="submit" value="保存" id="crop_submit" class="btn btn-primary btn-sm"/>
							</P>
						</form>
						
					</div><!-- end left main title row -->

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="home-sidebar">
						<strong>
							<span>关注了<a href="#">155</a> 人</span> ,
							<span>关注者<a href="#">13</a> 人</span>
						</strong>
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个话题</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个专栏</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>主页状态</strong></span>
						<div class="similar-question">
							个人主页被333人浏览
						</div>
					</div>

	
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->
	</body>
</html>