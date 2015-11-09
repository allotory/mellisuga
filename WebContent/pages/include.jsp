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
//个人资料框
$(function() {
	$('[data-toggle="popover"]').each(function() {
		var element = $(this);
		var id = element.attr('id');
		//var txt = element.html();
		element.popover({
			trigger : 'manual',
			placement : 'auto', //top, bottom, left or right
			//title : txt,
			html : 'true',
			content : popContent(id),
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
