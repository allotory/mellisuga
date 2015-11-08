<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="./css/bootstrap.css" media="screen">
<link rel="stylesheet" href="./css/style.css" media="screen">

<script src="./js/jquery-1.11.2.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/common.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="./js/html5shiv.js"></script>
	<script src="./js/respond.min.js"></script>
<![endif]-->

<!-- Taginput -->
<script type="text/javascript" src="./plugin/Taginput/bootstrap-tagsinput.js"></script>
<link rel="stylesheet" href="./plugin/Taginput/bootstrap-tagsinput.css">

<script type="text/javascript">
	$(function() {
		$('[data-toggle="popover"]').each(function() {
			var element = $(this);
			var id = element.attr('id');
			//var txt = element.html();
			element.popover({
				trigger : 'manual',
				placement : 'auto top', //top, bottom, left or right
				//title : txt,
				html : 'true',
				content : ContentMethod(),
			}).on("mouseenter", function() {
				var _this = this;

				//alert(id);
				$(this).popover("show");
				$(this).siblings(".popover").on("mouseleave", function() {
					$(_this).popover('hide');
				});
			}).on("mouseleave", function() {
				var _this = this;
				setTimeout(function() {
					if (!$(".popover:hover").length) {
						$(_this).popover("hide")
					}
				}, 100);
			});
		});
	});
	function ContentMethod() {
		return "<div class='row' style='width:275px;'>"
			+ "<div class='panel panel-default' style='border: 1px solid white;'>"
			+ "<div class='panel-body'>"
			+ "<div class='profile-header'>"
			+ "<strong>heheheh</strong>"
			+ "</div>"
			+ "<div class='row user-infos'>"
			+ "<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>"
			+ "<img src='./images/avatar/default.jpg' class='img-responsive img-rounded'>"
			+ "</div>"
			+ "<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8'>"
						
			+ "<div class='user-info'>"
			+ "<i class='fa fa-map-marker'></i> "
			+ "<span class='location'>dsg</span>"
			+ "<span class='business'>ghj</span>"
			+ "<span class='gender'>ert</span>"
			+ "<a href='#' class='item-edit'>"
			+ "<i class='fa fa-edit'></i> 修改"
			+ "</a>"
			+ "</div>"

			+ "<div class='user-info'>"
			+ "<i class='fa fa-suitcase'></i> "
			+ "<span class='company'>gjkl</span>"
			+ "<span class='work'>uioluil</span>"
			+ "<a href='#' class='item-edit'>"
			+ "<i class='fa fa-edit'></i>  修改"
			+ "</a>"
			+ "</div>"

			+ "<div class='user-info-end'>"
			+ "<i class='fa fa-graduation-cap'></i> "
			+ "<span class='education'>jhljhkl</span>"
			+ "<span class='specialty'>uiouiol</span>"
			+ "<a href='#' class='item-edit'>"
			+ "<i class='fa fa-edit'></i> 修改"
			+ "</a>"
			+ "</div>"
			+ "<hr style='margin-top:12px;margin-bottom:12px;'/>"
						
			+ "<p>cvvvvvvvvvvvc</p>"
			+ "</div>"
			+ "</div>"


			+ "<div class='achievement'>"
			+ "<span class='achieve'>获得</span>"
			+ "<span class='achieve'>"
			+ "<i class='fa fa-thumbs-o-up'></i> "
			+ "<strong>1254</strong>赞同"
			+ "</span>"
			+ "<span class='achieve'>"
			+ "<i class='fa fa-heart-o'></i> "
			+ "<strong>52514</strong>感谢"
			+ "</span>"
			+ "</div>"
			+ "</div>"
			
			
			+ "</div>"
			+ "</div>";
	}
</script>

<!-- bacheditor -->
<link rel="stylesheet" href="./plugin/BachEditor/css/pygment_trac.css">
<link rel="stylesheet" href="./plugin/BachEditor/css/editor.css">
<link rel="stylesheet" href="./plugin/BachEditor/css/codemirror.min.css">
<link rel="stylesheet" href="./plugin/BachEditor/css/default.min.css">
<script type="text/javascript" src="./plugin/BachEditor/js/highlight.min.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/marked.min.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/codemirror.min.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/ZeroClipboard.min.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/highlight.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/fileupload.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/modal.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/MIDI.js"></script>
<script type="text/javascript" src="./plugin/BachEditor/js/bacheditor.js"></script>

<!-- font awesome -->
<link rel="stylesheet" href="./plugin/font-awesome/css/font-awesome.min.css"/>
