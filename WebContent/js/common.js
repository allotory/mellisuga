// 登录注册div切换
function loginManager() {

	// 登录div
	var register_title = document.getElementById("register_title");
	var login_btn = document.getElementById("login_btn");

	// 注册div
	var login_title = document.getElementById("login_title");
	var register_btn = document.getElementById("register_btn");

	// form
	var login_form = document.getElementById("login_form");
	var register_form = document.getElementById("register_form");

	if (register_btn.style.display == "none") {
		register_btn.style.display = "inline";
		login_title.style.display = "inline";
		login_btn.style.display = "none";
		register_title.style.display = "none";

		login_form.style.display = "inline";
		register_form.style.display = "none";

	} else {
		login_btn.style.display = "inline";
		register_title.style.display = "inline";
		register_btn.style.display = "none";
		login_title.style.display = "none";

		register_form.style.display = "inline";
		login_form.style.display = "none";
	}

}

// 校验用户姓名
function validateUsername(id) {
	var username = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){5,19}$/;
	if (!reg.test(username)) {
		return false;
	} else {
		return true;
	}
}

// 校验邮箱
function validateEmail(id) {
	var email = document.getElementById(id).value.trim();
	var reg = /^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
	if (!reg.test(email)) {
		return false;
	} else {
		return true;
	}
}

// 校验密码
function validatePass(id) {
	var password = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,127}$/;
	if (!reg.test(password)) {
		return false;
	} else {
		return true;
	}
}

// 登录提交检验
function validateLoginSubmit() {
	var isEmailChecked = validateEmail("email");
	var isPassChecked = validatePass("password");

	var error = document.getElementById("alert_error");
	var email_error = document.getElementById("email_error");
	var pass_error = document.getElementById("pass_error");

	if (!(isEmailChecked && isPassChecked)) {
		if (!isEmailChecked) {
			error.style.display = "block";
			email_error.style.display = "block";
		} else {
			email_error.style.display = "none";
		}

		if (!isPassChecked) {
			error.style.display = "block";
			pass_error.style.display = "block";
		} else {
			pass_error.style.display = "none";
		}

		return false;
	} else {
		error.style.display = "none";
		email_error.style.display = "none";
		pass_error.style.display = "none";

		return true;
	}
}

// 注册提交校验
function validateRegSubmit() {
	var isUsernameChecked = validateUsername("rusername");
	var isEmailChecked = validateEmail("remail");
	var isPassChecked = validatePass("rpassword");

	var error = document.getElementById("ralert_error");
	var username_error = document.getElementById("rusername_error");
	var email_error = document.getElementById("remail_error");
	var pass_error = document.getElementById("rpass_error");

	if (!(isEmailChecked && isPassChecked && isUsernameChecked)) {
		if (!isUsernameChecked) {
			error.style.display = "block";
			username_error.style.display = "block";
		} else {
			username_error.style.display = "none";
		}

		if (!isEmailChecked) {
			error.style.display = "block";
			email_error.style.display = "block";
		} else {
			email_error.style.display = "none";
		}

		if (!isPassChecked) {
			error.style.display = "block";
			pass_error.style.display = "block";
		} else {
			pass_error.style.display = "none";
		}

		return false;
	} else {
		error.style.display = "none";
		username_error.style.display = "none";
		email_error.style.display = "none";
		pass_error.style.display = "none";

		return true;
	}
}

// 组件显示
function showItem(id) {
	var item = document.getElementById(id);
	item.style.display = "inline";
}
function hiddenItem(id) {
	var item = document.getElementById(id);
	item.style.display = "none";
}

// 动态显示回答编辑器
function renderAnswerEditor() {
	var answerdiv = document.getElementById('answer-editor');
	answerdiv.className='editor';
	
	bacheditor = new Editor();
	bacheditor.render('#answers','edit');
}

// 动态显示提问编辑器
function renderAskEditor() {
	var askdiv = document.getElementById('ask-editor');
	askdiv.className='editor';
	
	bacheditor2 = new Editor();
	bacheditor2.render('#question_content','edit');
}
function getHtmlSubmit() {
	var askdiv = document.getElementById('ask-editor');
	
	var input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('name', 'question_original_content');
	input.setAttribute('value', bacheditor2.getHTML());
	//alert(bacheditor2.getHTML());
	
	askdiv.appendChild(input);
	
	return true;
}

var xmlhttp;
function loadXMLDoc(url, callback) {
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = callback;
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
}
function loadXMLDoc2(url, parameter, callback) {
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = callback;
	xmlhttp.open("POST", url, true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(parameter);
}
function loadXMLDoc3(url, callback) {
	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = callback;
	xmlhttp.open("GET", url, false);
	xmlhttp.send();
}

// 提交答案
function newAnswer(question_id) {
	
	// 将AJAX从GET改为POST总结：
	// 1. 客户端改动后，服务端也要相应改动（至少应该看一下吗）
	// 2. 一个浏览器错误提示莫名其妙看不懂找不到，不要在一棵树上吊死，到旁边那棵上试试
	// 3. firefox是个好浏览器
	
	var answers = bacheditor.getHTML();
	var is_anonymous = document.getElementById('is_anonymous');
	var parameter = "question_id=" + question_id + "&answers=" + answers 
		+ "&is_anonymous=" + is_anonymous.value;
	
	if(answers == "") {
		alert("答案不能为空！");
	} else {
		
		loadXMLDoc2("AnswerServlet", parameter, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var obj = JSON.parse(xmlhttp.responseText);

				var answerDiv = document.createElement('div');
				answerDiv.id = "newAnswer" + obj.answerBeanList[0].answer.id;
				document.getElementById("newAnswers").appendChild(answerDiv);
				
				var str = '<!-- left main content wrap  -->'
						+ '<div class="row left-main-content-wrap" onmouseenter="showItem(\'hidden-item-' + obj.answerBeanList[0].answer.id + '\')" '
						+ 'onmouseleave="hiddenItem(\'hidden-item-' + obj.answerBeanList[0].answer.id + '\')">'
						+ '<div class="left-main-content">'
		
						+ '<!-- avatar and upvote col -->'
						+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
						+ '<div class="row">'
						+ '<a href="./HomeServlet?id='+ obj.answerBeanList[0].member.id +'">'
						+ '<img src="' + obj.answerBeanList[0].member.avatar_path + '" class="img-responsive img-rounded" alt="Responsive image">'
						+ '</a>'
						+ '</div>'
						+ '<div class="row">'
						+ '<div class="vote-text-center vote-number">'
						+ '<a href="#">'
						+ '<i class="fa fa-caret-up"></i>'
						+ '<span style="display:block;">122</span>'
						+ '</a>'
						+ '</div>'
										
						+ '<div class="vote-text-center vote-number">'
						+ '<a href="#">'
						+ '<i class="fa fa-caret-down"></i>'
						+ '</a>'
						+ '</div>'
						+ '</div>'
						+ '</div><!-- end avatar and upvote col -->'
		
						+ '<!-- content-details -->'
						+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
		
						+ '<div class="row">'
						+ '<div class="author-info">'
						+ '<a href="./HomeServlet?id='+ obj.answerBeanList[0].member.id +'"><strong>' + obj.answerBeanList[0].member.fullname + '</strong></a>,'
						+ '<span>' + obj.answerBeanList[0].member.autograph + '</span>'
						+ '</div>'
						+ '</div>'
		
						+ '<div class="row">'
						+ '<div class="question-content">'
						+ '<div class="editable-content" style="display: block;">'
						+ '<div style="margin-top:12px; margin-bottom:12px;">'
						+ obj.answerBeanList[0].answer.answers
						+ '</div>'
						+ '<span class="answer-date" style="display: block;">'
						+ '<a target="_blank" href="#">发布于 ' + obj.answerBeanList[0].answer.answer_date + '</a>'
						+ '</span>'
						+ '</div>'
						+ '<div class="summary-content clearfix" style="display: none;">'
						+ obj.answerBeanList[0].answer.answers
						+ '</div>'
						+ '</div>'
						+ '</div>'
		
						+ '<div class="row">'
						+ '<div class="meta-panel">'
						+ '<a class="meta-item" href="javascript:;">'
						+ '<i class="fa fa-plus"></i> 关注问题'
						+ '</a>'
						+ '<a href="#comment-' + obj.answerBeanList[0].answer.id + '" '
						+ 'onclick="queryACommentList(' + obj.answerBeanList[0].answer.id + ');"  '
						+ 'data-toggle="collapse" class="meta-item">'
						+ '<i class="fa fa-comment-o"></i> 添加评论'
						+ '</a>'
						+ '<div id="hidden-item-' + obj.answerBeanList[0].answer.id + '" style="display:none">'
						+ '<a href="#" class="meta-item" data-thanked="false">'
						+ '<i class="fa fa-heart-o"></i> 感谢'
						+ '</a>'
						+ '<a href="#" class="meta-item">'
						+ '<i class="fa fa-share"></i> 分享'
						+ '</a>'
						+ '<a href="#" class="meta-item">'
						+ '<i class="fa fa-bookmark-o"></i> 收藏'
						+ '</a>'
						+ '<span class="bull">•</span>'
						+ '<a href="#" class="meta-item">没有帮助</a>'
						+ '<span class="bull">•</span>'
						+ '<div class="btn-group">'
						+ '<a onclick="reportList(1, this, 1, ' + obj.answerBeanList[0].answer.id + ');" class="meta-item dropdown-toggle" data-toggle="dropdown">'
						+ '<i class="fa fa-flag-o"></i> ' 
						+ '举报'
						+ '</a>'
						+ '<ul class="dropdown-menu">'
						+ '</ul>'
						+ '</div>'
						+ '<span class="bull">•</span>'
						+ '<a href="#" class="meta-item">作者保留权利</a>'
						+ '<span class="copyright"></span>'
						+ '</div>'
						+ '<a href="#" class="answer-collapse meta-item">'
						+ '<i class="fa fa-angle-double-up"></i> 收起'
						+ '</a>'
						+ '</div>'
						+ '</div>'
									
						+ '<!-- comment -->'
						+ '<div id="comment-' + obj.answerBeanList[0].answer.id + '" class="row comment collapse">'
						+ '<div class="panel panel-default">'
						+ '<div id="newAnswerComments">'
											
						+ '</div>'
						+ '<div class="panel-body">'
						+ '<div class="form-group">'
						+ '<textarea class="form-control" id="acomment" name="acomment" rows="1" placeholder="请写下你的评论..."></textarea>'
						+ '</div>'
						+ '<div class="form-group module-right">'
						+ '<button class="btn btn-default btn-sm">取消</button>'
						+ '<button type="button" onclick="newAnswerComment(' + obj.answerBeanList[0].answer.id + ');" class="btn btn-primary btn-sm">评论</button>'
						+ '</div>'
						+ '</div>'
											
						+ '</div>'
						+ '</div><!--end comment -->'
		
						+ '</div><!-- end content-details -->'
															
						+ '</div><!-- end left main content -->'
						+ '</div><!--end left main content wrap  -->'
						
						+ '<div class="row">'
						+ '<hr style="margin-top:12px;margin-bottom:12px;"/>'
						+ '</div>'
						
				answerDiv.innerHTML = str;
			}
		});
		bacheditor.setVal('');
	}
}

// 添加问题评论
function newQuestionComment(question_id) {
	var qcomment = document.getElementById('qcomment-' + question_id);
	
	var parameter = "question_id=" + question_id + "&&comment_content=" + qcomment.value;
	
	if(qcomment.value == "") {
		alert("评论不能为空！");
	} else {
		loadXMLDoc2("CommentQuestionServlet", parameter, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var obj = JSON.parse(xmlhttp.responseText);
	
				var commentDiv = document.createElement('div');
				commentDiv.id = "newQuestionComment" + obj.commentBeanList[0].comment.id;
				document.getElementById("newQuestionComments-" + question_id).appendChild(commentDiv);
	
				var str = '<div class="panel-body q-comment"'
						+ 'onmouseenter="showItem(\'comment-hidden' + obj.commentBeanList[0].comment.id + '\')"'
						+ 'onmouseleave="hiddenItem(\'comment-hidden' + obj.commentBeanList[0].comment.id + '\')">'
						+ '<!-- avatar and upvote col -->'
						+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
						+ '<div class="row">'
						+ '<a href="./HomeServlet?id='+ obj.commentBeanList[0].member.id +'">'
						+ '<img src="'+ obj.commentBeanList[0].member.avatar_path +'" class="img-responsive img-rounded" alt="Responsive image">'
						+ '</a>'
						+ '</div>'
						+ '</div><!-- end avatar and upvote col -->'
					
						+ '<!-- comment-details -->'
						+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
						+ '<div class="row">'
						+ '<div class="author-info">'
						+ '<a href="./HomeServlet?id='+ obj.commentBeanList[0].member.id +'"><strong>' + obj.commentBeanList[0].member.fullname + '</strong></a>'
						+ '</div>'
						+ '</div>'
	
						+ '<div class="row">'
						+ '<div class="question-content">'
						+ '<div class="editable-content" style="display: block;">'
						+ obj.commentBeanList[0].comment.content
						+ '<span class="answer-date" style="display: block;">'
						+ '<a target="_blank" href="#">发布于 ' + obj.commentBeanList[0].comment.comment_date + '</a>'
						+ '<div id="comment-hidden' + obj.commentBeanList[0].comment.id + '" style="display:none; margin-left: 5px;">'
						+ '<a href="#" class="split"><i class="fa fa-reply"></i> 回复</a>'
						+ '<a href="#" class="split"><i class="fa fa-thumbs-o-up"></i> 赞</a>'

						+ '<div class="btn-group">'
						+ '<a onclick="reportList(1, this, 2, ' + obj.commentBeanList[0].comment.id + ');" class="meta-item dropdown-toggle" data-toggle="dropdown">'
						+ '<i class="fa fa-flag-o"></i> ' 
						+ '举报'
						+ '</a>'
						+ '<ul class="dropdown-menu">'
						+ '</ul>'
						+ '</div>'
						
						+ '</div>'
						+ '<a href="#" class="split module-right">' + obj.commentBeanList[0].comment.favour_num + '赞</a>'
						+ '</span>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '</div><!-- end comment-details -->'
						+ '</div>';
				
				commentDiv.innerHTML = str;
			}
		});
	}
	qcomment.value = "";
}

// 查询问题评论
function queryQCommentList() {
	var paramlength = arguments.length;
	if (paramlength == 1) {
		var question_id = arguments[0];
	} else if (paramlength == 2){    
        var question_id = arguments[0];
        var trends_id = arguments[1];
    }
	
	loadXMLDoc("QuestionCommentDetailsServlet?question_id=" + question_id, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = JSON.parse(xmlhttp.responseText);
			
			for(var i = 0; i< obj.commentBeanList.length; i++) {
				
				var commentDiv = document.createElement('div');
				commentDiv.id = "questionComment-" + obj.commentBeanList[i].comment.id;
				if(paramlength == 1) {
					document.getElementById("newQuestionComments-" + question_id).appendChild(commentDiv);
				} else if(paramlength == 2) {
					document.getElementById("newQuestionComments-" + trends_id).appendChild(commentDiv);
				}
				
				var str = '<div class="panel-body q-comment"'
						+ 'onmouseenter="showItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')"'
						+ 'onmouseleave="hiddenItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')">'
						+ '<!-- avatar and upvote col -->'
						+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
						+ '<div class="row">'
						+ '<a href="./HomeServlet?id='+ obj.commentBeanList[i].member.id +'">'
						+ '<img src="'+ obj.commentBeanList[i].member.avatar_path +'" class="img-responsive img-rounded" alt="Responsive image">'
						+ '</a>'
						+ '</div>'
						+ '</div><!-- end avatar and upvote col -->'
					
						+ '<!-- comment-details -->'
						+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
						+ '<div class="row">'
						+ '<div class="author-info">'
						+ '<a href="./HomeServlet?id='+ obj.commentBeanList[i].member.id +'"><strong>' + obj.commentBeanList[i].member.fullname + '</strong></a>'
						+ '</div>'
						+ '</div>'

						+ '<div class="row">'
						+ '<div class="question-content">'
						+ '<div class="editable-content" style="display: block;">'
						+ obj.commentBeanList[i].comment.content
						+ '<span class="answer-date" style="display: block;">'
						+ '<a target="_blank" href="#">发布于 ' + obj.commentBeanList[i].comment.comment_date + '</a>'
						+ '<div id="comment-hidden' + obj.commentBeanList[i].comment.id + '" style="display:none; margin-left: 5px;">'
						+ '<a href="#" class="split"><i class="fa fa-reply"></i> 回复</a>'
						+ '<a href="#" class="split"><i class="fa fa-thumbs-o-up"></i> 赞</a>'

						+ '<div class="btn-group">'
						+ '<a onclick="reportList(1, this, 2, ' + obj.commentBeanList[0].comment.id + ');" class="meta-item dropdown-toggle" data-toggle="dropdown">'
						+ '<i class="fa fa-flag-o"></i> ' 
						+ '举报'
						+ '</a>'
						+ '<ul class="dropdown-menu">'
						+ '</ul>'
						+ '</div>'
						
						+ '</div>'
						+ '<a href="#" class="split module-right">' + obj.commentBeanList[i].comment.favour_num + '赞</a>'
						+ '</span>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '</div><!-- end comment-details -->'
						+ '</div>';
				
				commentDiv.innerHTML = str;
			}
		}
	});
}

// 添加答案评论
function newAnswerComment(answer_id) {
	var acomment = document.getElementById('acomment-' + answer_id);
	
	var parameter = "answer_id=" + answer_id + "&&comment_content=" + acomment.value;
	
	if(acomment.value == "") {
		alert("评论不能为空");
	} else {
		loadXMLDoc2("CommentAnswerServlet", parameter, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var obj = JSON.parse(xmlhttp.responseText);
				
				var commentDiv = document.createElement('div');
				commentDiv.id = "answerComment-" + obj.acommentBeanList[0].comment.id;
				document.getElementById("newAnswerComments-" + answer_id).appendChild(commentDiv);
				
				var str = '<div class="panel-body q-comment"'
						+ 'onmouseenter="showItem(\'comment-hidden' + obj.acommentBeanList[0].comment.id + '\')"'
						+ 'onmouseleave="hiddenItem(\'comment-hidden' + obj.acommentBeanList[0].comment.id + '\')">'
						+ '<!-- avatar and upvote col -->'
						+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
						+ '<div class="row">'
						+ '<a href="./HomeServlet?id='+ obj.acommentBeanList[0].member.id +'">'
						+ '<img src="'+ obj.acommentBeanList[0].member.avatar_path +'" class="img-responsive img-rounded" alt="Responsive image">'
						+ '</a>'
						+ '</div>'
						+ '</div><!-- end avatar and upvote col -->'
					
						+ '<!-- comment-details -->'
						+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
						+ '<div class="row">'
						+ '<div class="author-info">'
						+ '<a href="./HomeServlet?id='+ obj.acommentBeanList[0].member.id +'"><strong>' + obj.acommentBeanList[0].member.fullname + '</strong></a>'
						+ '</div>'
						+ '</div>'
	
						+ '<div class="row">'
						+ '<div class="question-content">'
						+ '<div class="editable-content" style="display: block;">'
						+ obj.acommentBeanList[0].comment.content
						+ '<span class="answer-date" style="display: block;">'
						+ '<a target="_blank" href="#">发布于 ' + obj.acommentBeanList[0].comment.comment_date + '</a>'
						+ '<div id="comment-hidden' + obj.acommentBeanList[0].comment.id + '" style="display:none; margin-left: 5px;">'
						+ '<a href="#" class="split"><i class="fa fa-reply"></i> 回复</a>'
						+ '<a href="#" class="split"><i class="fa fa-thumbs-o-up"></i> 赞</a>'

						+ '<div class="btn-group">'
						+ '<a onclick="reportList(1, this, 2, ' + obj.acommentBeanList[0].comment.id + ');" class="meta-item dropdown-toggle" data-toggle="dropdown">'
						+ '<i class="fa fa-flag-o"></i> ' 
						+ '举报'
						+ '</a>'
						+ '<ul class="dropdown-menu">'
						+ '</ul>'
						+ '</div>'
						
						+ '</div>'
						+ '<a href="#" class="split module-right">' + obj.acommentBeanList[0].comment.favour_num + '赞</a>'
						+ '</span>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '</div><!-- end comment-details -->'
						+ '</div>';
				
				commentDiv.innerHTML = str;
			}
		});
	}
	acomment.value = "";
}

// 查询答案评论
function queryACommentList() {

	var paramlength = arguments.length;
	
	if (paramlength == 1) {
		var answer_id = arguments[0];
	} else if (paramlength == 2){    
        var answer_id = arguments[0];
        var trends_id = arguments[1];
    }
	
	loadXMLDoc("AnswerCommentDetailsServlet?answer_id=" + answer_id, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = JSON.parse(xmlhttp.responseText);
			
			for(var i = 0; i< obj.commentBeanList.length; i++) {
				
				var commentDiv = document.createElement('div');
				commentDiv.id = "answerComment-" + obj.commentBeanList[i].comment.id;
				if(paramlength == 1) {
					document.getElementById("newAnswerComments-" + answer_id).appendChild(commentDiv);
				} else if (paramlength == 2) {
					document.getElementById("newAnswerComments-" + trends_id).appendChild(commentDiv);
				}
				
				
				var str = '<div class="panel-body q-comment"'
						+ 'onmouseenter="showItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')"'
						+ 'onmouseleave="hiddenItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')">'
						+ '<!-- avatar and upvote col -->'
						+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
						+ '<div class="row">'
						+ '<a href="./HomeServlet?id='+ obj.commentBeanList[i].member.id +'">'
						+ '<img src="'+ obj.commentBeanList[i].member.avatar_path +'" class="img-responsive img-rounded" alt="Responsive image">'
						+ '</a>'
						+ '</div>'
						+ '</div><!-- end avatar and upvote col -->'
					
						+ '<!-- comment-details -->'
						+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
						+ '<div class="row">'
						+ '<div class="author-info">'
						+ '<a href="./HomeServlet?id='+ obj.commentBeanList[i].member.id +'"><strong>' + obj.commentBeanList[i].member.fullname + '</strong></a>'
						+ '</div>'
						+ '</div>'

						+ '<div class="row">'
						+ '<div class="question-content">'
						+ '<div class="editable-content" style="display: block;">'
						+ obj.commentBeanList[i].comment.content
						+ '<span class="answer-date" style="display: block;">'
						+ '<a target="_blank" href="#">发布于 ' + obj.commentBeanList[i].comment.comment_date + '</a>'
						+ '<div id="comment-hidden' + obj.commentBeanList[i].comment.id + '" style="display:none; margin-left: 5px;">'
						+ '<a href="#" class="split"><i class="fa fa-reply"></i> 回复</a>'
						+ '<a href="#" class="split"><i class="fa fa-thumbs-o-up"></i> 赞</a>'

						+ '<div class="btn-group">'
						+ '<a onclick="reportList(1, this, 2, ' + obj.commentBeanList[i].comment.id + ');" class="meta-item dropdown-toggle" data-toggle="dropdown">'
						+ '<i class="fa fa-flag-o"></i> ' 
						+ '举报'
						+ '</a>'
						+ '<ul class="dropdown-menu">'
						+ '</ul>'
						+ '</div>'
						
						+ '</div>'
						+ '<a href="#" class="split module-right">' + obj.commentBeanList[i].comment.favour_num + '赞</a>'
						+ '</span>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '</div><!-- end comment-details -->'
						+ '</div>';
				
				commentDiv.innerHTML = str;
			}
		}
	});
}

// 赞成
function vote(answer_id, vote_type) {
	var vote_up = document.getElementById("vote-up-" + answer_id);
	var vote_down = document.getElementById("vote-down-" + answer_id);
	var vote_count = document.getElementById("vote_count-" + answer_id);
	
	if(vote_up.className == "vote-number" && vote_down.className == "vote-number") {
		// 还没有投过票
		if(vote_type == "up") {
			vote_up.className = "vote-number-pressed";
			vote_count.innerHTML = Number(vote_count.innerHTML) + 1;
		}else if(vote_type == "down") {
			vote_down.className = "vote-number-pressed";
		}
		
		// 正常添加
		loadXMLDoc("VoteAnswerServlet?answer_id=" + answer_id 
				+ "&&vote_type=" + vote_type + "&&vote_flag=newvote", function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				alert(xmlhttp.responseText);
			}
		});
		
	}else if(vote_up.className == "vote-number-pressed" && vote_down.className == "vote-number"){
		// 投过赞同票，此时不管点赞同还是反对都是取消该赞同
		vote_up.className = "vote-number";
		vote_count.innerHTML = Number(vote_count.innerHTML) - 1;
		
		// 原up状态修改为unconcer
		loadXMLDoc("VoteAnswerServlet?answer_id=" + answer_id 
				+ "&&vote_type=unconcer&&vote_flag=cancelupvote", function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				alert(xmlhttp.responseText);
			}
		});
		
	}else if(vote_up.className == "vote-number" && vote_down.className == "vote-number-pressed") {
		// 投过反对票, 取消反对
		vote_down.className = "vote-number";
		
		// 原down状态修改为unconcer
		loadXMLDoc("VoteAnswerServlet?answer_id=" + answer_id 
				+ "&&vote_type=unconcer&&vote_flag=canceldownvote", function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				alert(xmlhttp.responseText);
			}
		});
	}
}

// 问题页面关注问题
function followQuestion(question_id) {
	
	var followQuestion = document.getElementById("followQuestion-" + question_id);
	
	if(followQuestion.className == "btn btn-primary") {
		// 关注问题
		followQuestion.className = "btn btn-default";
		followQuestion.innerHTML = "取消关注";
		loadXMLDoc("FollowQuestionServlet?question_id=" + question_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("关注问题失败，请稍候重试");
					followQuestion.className = "btn btn-primary";
					followQuestion.innerHTML = "关注问题";
				}
			}
		});
	} else if(followQuestion.className == "btn btn-default") {
		// 取消关注
		followQuestion.className = "btn btn-primary";
		followQuestion.innerHTML = "关注问题";
		loadXMLDoc("UnFollowQuestionServlet?question_id=" + question_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("取消关注失败，请稍候重试");
					followQuestion.className = "btn btn-default";
					followQuestion.innerHTML = "取消关注";
				}
			}
		});
	}
}

//首页动态里关注问题
function followQuestionOnTrends(question_id, trends_id) {
	
	// 以动态id作为唯一标识啊啊啊！
	var followQuestion = document.getElementById("followQuestion-" + trends_id);
	
	if(followQuestion.title == "follow") {
		// 关注问题
		followQuestion.title = "following";
		followQuestion.innerHTML = "取消关注";
		loadXMLDoc("FollowQuestionServlet?question_id=" + question_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("关注问题失败，请稍候重试");
					followQuestion.title = "follow";
					followQuestion.innerHTML = "<i class='fa fa-plus'></i> 关注问题";
				}
			}
		});
	} else if(followQuestion.title == "following") {
		// 取消关注
		followQuestion.title = "follow";
		followQuestion.innerHTML = "<i class='fa fa-plus'></i> 关注问题";
		loadXMLDoc("UnFollowQuestionServlet?question_id=" + question_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("取消关注失败，请稍候重试");
					followQuestion.title = "following";
					followQuestion.innerHTML = "取消关注";
				}
			}
		});
	}
}

// 问题页面感谢作者
function thankAuthor() {
	
	var paramlength = arguments.length;

	if (paramlength == 1) {
		var answer_id = arguments[0];
		var thankAuthorLink = document.getElementById("thankAuthor-" + answer_id);
	} else if (paramlength == 2){    
        var answer_id = arguments[0];
        var trends_id = arguments[1];
        var thankAuthorLink = document.getElementById("thankAuthor-" + trends_id);
    }

	if(thankAuthorLink.title == "thankAuthor") {
		thankAuthorLink.title = "thankedAuthor";
		thankAuthorLink.innerHTML = "<i class='fa fa-heart-o'></i> 取消感谢";
		loadXMLDoc("ThankAuthorServlet?answer_id=" + answer_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("感谢作者失败，请稍候重试");
					thankAuthorLink.title = "thankAuthor";
					thankAuthorLink.innerHTML = "<i class='fa fa-heart-o'></i> 感谢";
				}
			}
		});
	} else if(thankAuthorLink.title == "thankedAuthor") {
		thankAuthorLink.title = "thankAuthor";
		thankAuthorLink.innerHTML = "<i class='fa fa-heart-o'></i> 感谢";
		loadXMLDoc("UnThankAuthorServlet?answer_id=" + answer_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("感谢作者失败，请稍候重试");
					thankAuthorLink.title = "thankedAuthor";
					thankAuthorLink.innerHTML = "<i class='fa fa-heart-o'></i> 取消感谢";
				}
			}
		});
	}
}

// 我关注的问题页面
function followQuestionOnFollowing(question_id) {
	
	// 以动态id作为唯一标识啊啊啊！
	var followQuestion = document.getElementById("followQuestion-" + question_id);
	
	if(followQuestion.title == "follow") {
		// 关注问题
		followQuestion.title = "following";
		followQuestion.innerHTML = "取消关注";
		loadXMLDoc("FollowQuestionServlet?question_id=" + question_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("关注问题失败，请稍候重试");
					followQuestion.title = "follow";
					followQuestion.innerHTML = "<i class='fa fa-plus'></i> 关注问题";
				}
			}
		});
	} else if(followQuestion.title == "following") {
		// 取消关注
		followQuestion.title = "follow";
		followQuestion.innerHTML = "<i class='fa fa-plus'></i> 关注问题";
		loadXMLDoc("UnFollowQuestionServlet?question_id=" + question_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "error") {
					alert("取消关注失败，请稍候重试");
					followQuestion.title = "following";
					followQuestion.innerHTML = "取消关注";
				}
			}
		});
	}
}

// 创建收藏夹跳转
function newCollectionRedirect() {
	var newCollectionModal = document.getElementById("newCollectionModal");
	var collectionListModal = document.getElementById("collectionListModal");
	
	collectionListModal.style.display = "none";
	newCollectionModal.style.display = "block";
}

// 创建收藏夹并跳转到收藏夹列表
function newCollection() {
	var newCollectionModal = document.getElementById("newCollectionModal");
	var collectionListModal = document.getElementById("collectionListModal");
	
	var foldername = document.getElementById("foldername").value;
	var description = document.getElementById("description").value;
	var is_publics = document.getElementsByName("is_public");
	var is_public;
	
	if(is_publics[0].checked) {
		is_public = 1;
	} else if(is_publics[1].checked) {
		is_public = 0;
	}
	
	var parameter = "foldername=" + foldername + "&description=" + description
			+ "&is_public=" + is_public;
	
	loadXMLDoc2("CreateCollectionServlet", parameter, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = JSON.parse(xmlhttp.responseText);
			var content;
			if(obj.collectionFolderList.length == 0) {
				content = "<div class='panel-body'>"
				+ "<div style='color: #999; text-align:center;'>"
				+ "您可以创建多个收藏夹，将答案分类收藏"
				+ "</div>"
				+ "</div>";
				
				var panelDiv = document.createElement('div');
				panelDiv.className = "panel panel-default";
				panelDiv.id = "noCollectionFolder";
				panelDiv.innerHTML = content;
				document.getElementById("collectionFolderList").appendChild(panelDiv);
			} else if(obj.collectionFolderList.length > 0) {
				// 判断当前没有收藏夹提示div是否存在，并删除
				var noCollectionFolderDiv = document.getElementById("noCollectionFolder");
				if(noCollectionFolderDiv) {
					noCollectionFolderDiv.parentNode.removeChild(noCollectionFolderDiv);
				}
				
				for(var i = 0; i< obj.collectionFolderList.length; i++) {
					//alert(obj.collectionFolderList[i].foldername);

					if (obj.collectionFolderList[i].is_public == 1) {

						content = "<div class='panel-body'>"
						+ "<div class='meta-color' style='display: inline;'>"
						+ "<i class='fa fa-unlock'></i> " + obj.collectionFolderList[i].foldername
						+ "<div class='module-right collect-circle' style=''>"
						+ "<i class='fa fa-check-circle'></i>"
						+ "</div>"
						+ "</div>"
						+ "<div class='meta-color'>"
						+ obj.collectionFolderList[i].answers_num + "条答案，" + obj.collectionFolderList[i].followers_num + "人关注"
						+ "</div>"
						+ "</div>";
					} else if(obj.collectionFolderList[i].is_public == 0) {

						content = "<div class='panel-body'>"
						+ "<div class='meta-color' style='display: inline;'>"
						+ "<i class='fa fa-lock'></i> " + obj.collectionFolderList[i].foldername
						+ "<div class='module-right collect-circle' style=''>"
						+ "<i class='fa fa-check-circle'></i>"
						+ "</div>"
						+ "</div>"
						+ "<div class='meta-color'>"
						+ obj.collectionFolderList[i].answers_num + "条答案，" + obj.collectionFolderList[i].followers_num + "人关注"
						+ "</div>"
						+ "</div>";
						
					}
					var panelDiv = document.createElement('div');
					panelDiv.className = "panel panel-default";
					panelDiv.innerHTML = content;
					document.getElementById("collectionFolderList").appendChild(panelDiv);
				}
			}
		}
	});
	
	collectionListModal.style.display = "block";
	newCollectionModal.style.display = "none";
}

// 获取收藏夹列表
function getCollectionList(answer_id) {
	
	// 移除collectionFolderList中的全部节点
	var div = document.getElementById("collectionFolderList");
	while(div.hasChildNodes()) {
	    div.removeChild(div.firstChild);
	}
	
	//alert(answer_id);
	loadXMLDoc("CollectionFolderListServlet?answer_id=" + answer_id, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = JSON.parse(xmlhttp.responseText);
			//alert(xmlhttp.responseText);
			var content;
			if(obj.collectionFolderBeanList.length == 0) {
				content = "<div class='panel-body'>"
				+ "<div style='color: #999; text-align:center;'>"
				+ "您可以创建多个收藏夹，将答案分类收藏"
				+ "</div>"
				+ "</div>";
				
				var panelDiv = document.createElement('div');
				panelDiv.className = "panel panel-default";
				panelDiv.id = "noCollectionFolder";
				panelDiv.innerHTML = content;
				document.getElementById("collectionFolderList").appendChild(panelDiv);
			} else if(obj.collectionFolderBeanList.length > 0) {
				// 判断当前没有收藏夹提示div是否存在，并删除
				var noCollectionFolderDiv = document.getElementById("noCollectionFolder");
				if(noCollectionFolderDiv) {
					noCollectionFolderDiv.parentNode.removeChild(noCollectionFolderDiv);
				}
				
				for(var i = 0; i< obj.collectionFolderBeanList.length; i++) {

					// 判断是否已经收藏
					var isCollected;
					if(obj.collectionFolderBeanList[i].collected) {
						isCollected = "<div id='collect_circle-" + obj.collectionFolderBeanList[i].collectionFolder.id + "' class='module-right collect-circle' style='display: block;'>";
					} else {
						isCollected = "<div id='collect_circle-" + obj.collectionFolderBeanList[i].collectionFolder.id + "' class='module-right collect-circle' style='display: none;'>";
					}

					if (obj.collectionFolderBeanList[i].collectionFolder.is_public == 1) {

						content = "<div class='panel-body mouse-hand' onclick='collect(" + answer_id + ", " + obj.collectionFolderBeanList[i].collectionFolder.id + ");'>"
						+ "<div class='meta-color' style='display: inline;'>"
						+ "<i class='fa fa-unlock'></i> " + obj.collectionFolderBeanList[i].collectionFolder.foldername
						+ isCollected
						+ "<i class='fa fa-check-circle'></i>"
						+ "</div>"
						+ "</div>"
						+ "<div class='meta-color'>"
						+ obj.collectionFolderBeanList[i].collectionFolder.answers_num + "条答案，" + obj.collectionFolderBeanList[i].collectionFolder.followers_num + "人关注"
						+ "</div>"
						+ "</div>";
					} else if(obj.collectionFolderBeanList[i].collectionFolder.is_public == 0) {

						content = "<div class='panel-body mouse-hand' onclick='collect(" + answer_id + ", " + obj.collectionFolderBeanList[i].collectionFolder.id + ");'>"
						+ "<div class='meta-color' style='display: inline;'>"
						+ "<i class='fa fa-lock'></i> " + obj.collectionFolderBeanList[i].collectionFolder.foldername
						+ isCollected
						+ "<i class='fa fa-check-circle'></i>"
						+ "</div>"
						+ "</div>"
						+ "<div class='meta-color'>"
						+ obj.collectionFolderBeanList[i].collectionFolder.answers_num + "条答案，" + obj.collectionFolderBeanList[i].collectionFolder.followers_num + "人关注"
						+ "</div>"
						+ "</div>";
						
					}
					var panelDiv = document.createElement('div');
					panelDiv.className = "panel panel-default";
					panelDiv.innerHTML = content;
					document.getElementById("collectionFolderList").appendChild(panelDiv);
				}
			}
		}
	});
}

// 收藏答案
function collect(answer_id, collection_folder_id) {
	var collect_circle = document.getElementById("collect_circle-" + collection_folder_id);

	if(collect_circle.style.display == "block") {
		// 从收藏夹删除答案
		loadXMLDoc("UnCollectAnswerServlet?answer_id=" + answer_id 
				+ "&collection_folder_id=" + collection_folder_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "delFromCollectionFolderError!") {
					alert("取消收藏失败，请稍候重试！");
				} else {
					collect_circle.style.display = "none";
				}
			}
		});
		collect_circle.style.display = "none";
	} else if(collect_circle.style.display == "none") {
		// 添加答案到收藏夹
		loadXMLDoc("CollectAnswerServlet?answer_id=" + answer_id 
				+ "&collection_folder_id=" + collection_folder_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "addToCollectionFolderError!") {
					alert("添加到收藏夹失败，请稍候重试！");
				} else {
					collect_circle.style.display = "block";
				}
			}
		});
		
		collect_circle.style.display = "block";
	}
}

// 没有帮助
function nohelp() {
	
	var paramlength = arguments.length;

	if (paramlength == 1) {
		var answer_id = arguments[0];
		var nohelp = document.getElementById("nohelp-" + answer_id);
	} else if (paramlength == 2){    
        var answer_id = arguments[0];
        var trends_id = arguments[1];
        var nohelp = document.getElementById("nohelp-" + trends_id);
    }
	
	if (nohelp.title == "nohelp") {
		nohelp.title = "unnohelp";
		nohelp.innerHTML = "撤消没有帮助";
		loadXMLDoc("NoHelpServlet?answer_id=" + answer_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "addnohelperror") {
					alert("插入没有帮助失败，请稍候重试");
					nohelp.title = "nohelp";
					nohelp.innerHTML = "没有帮助";
				}
			}
		});
	} else if(nohelp.title == "unnohelp") {
		nohelp.title = "nohelp";
		nohelp.innerHTML = "没有帮助";
		loadXMLDoc("UnNoHelpServlet?answer_id=" + answer_id, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if(xmlhttp.responseText == "delnohelperror") {
					alert("删除没有帮助失败，请稍候重试");
					nohelp.title = "nohelp";
					nohelp.innerHTML = "没有帮助";
				}
			}
		});
	}
}

// 举报列表
function reportList(is_common, this_obj, report_category, report_category_id) {
	
	/**
	 * is_common : 是否是通用类型
	 * this_obj: 当前举报对象
	 * report_category: 举报类型（0问题、1答案、2评论）
	 * report_category_id: 与举报类型相对应的id
	 */
	
	var ul = this_obj.parentNode.getElementsByTagName("ul");
	
	// 获取举报类型列表
	loadXMLDoc("ReportServlet?is_common=" + is_common, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			
			if(xmlhttp.responseText == "queryreporttypeerror") {
				alert("查询举报类型失败，请稍候重试");
			} else {
				var obj = JSON.parse(xmlhttp.responseText);
				ul[0].innerHTML = "";
				for (var i = 0; i< obj.reportTypeList.length; i++) {
					var li = document.createElement("li");
					var alink = document.createElement("a");
					alink.className = "mouse-hand";
					alink.onclick = new Function("reporting(" + obj.reportTypeList[i].id + ", " 
							+ report_category + ", " + report_category_id + ")");
					alink.innerHTML = obj.reportTypeList[i].report_type_content;
					li.appendChild(alink);
					ul[0].appendChild(li);

				}
			}
			
		}
	});
}

// 举报
function reporting(report_type, report_category, report_category_id) {
	// 举报
	loadXMLDoc("ReportingServlet?report_type=" + report_type 
			+ "&report_category=" + report_category 
			+ "&report_category_id=" + report_category_id, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			
			if(xmlhttp.responseText == "insertreporterror") {
				alert("举报失败，请稍候重试!");
			} else {
				$('#reportModal').modal('show');
			}
		}
	});	
}

// 个人资料框内容
function popContent(id) {

	var content;
	
	loadXMLDoc3("MemberInfoServlet?id=" + id.substring(5), function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			
			if(xmlhttp.responseText == "querymemberinfoerror") {
				alert("查询用户信息失败，请稍候重试!");
			} else {
				var obj = JSON.parse(xmlhttp.responseText);
				//alert(obj.memberList[0]);
				content = "<div class='row' style='width:273px;'>"
					+ "<div class='panel panel-default' style='border: 1px solid white;'>"
					+ "<div class='panel-body'>"
					
					+ "<div class='profile-header'>"
					+ "<strong><a href='./HomeServlet?id=" +obj.memberList[0].id+ "'>" +obj.memberList[0].fullname+ "</a> <i class='fa fa-mars'></i></strong>"

					+ "<a href='#' class='btn btn-success btn-xs module-right'>关注他</a>"
					
					+ "</div>"
					
					+ "<div class='row user-infos' style='padding-bottom: 10px;'>"
					+ "<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>"
					+ "<img src='" +obj.memberList[0].avatar_path+ "' class='img-responsive img-rounded'>"
					+ "</div>"

					+ "<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8'>"
					+ "<div class='user-info'>"
					+ "<i class='fa fa-map-marker'></i> "
					+ "<span class='location'>" +obj.memberList[0].location+ "</span>"
					+ "<span class='business'>" +obj.memberList[0].business+ "</span>"
					+ "<span class='gender'>" +obj.memberList[0].gender+ "</span>"
					+ "</div>"

					+ "<div class='user-info'>"
					+ "<i class='fa fa-suitcase'></i> "
					+ "<span class='company'>" +obj.memberList[0].employment+ "</span>"
					+ "<span class='work'>" +obj.memberList[0].position+ "</span>"
					+ "</div>"

					+ "<div class='user-info-end'>"
					+ "<i class='fa fa-graduation-cap'></i> "
					+ "<span class='education'>" +obj.memberList[0].education+ "</span>"
					+ "<span class='specialty'>" +obj.memberList[0].major+ "</span>"
					+ "</div>"
								
					+ "</div>"
					+ "</div>"


					+ "<div class='achievement'>"
					+ "<span class='achieve'>"
					+ "<i class='fa fa-pencil'></i> "
					+ "<strong>" +obj.memberList[0].question_num+ "</strong>提问"
					+ "</span>"
					+ "<span class='achieve'>"
					+ "<i class='fa fa-file-o'></i> "
					+ "<strong>0</strong>文章"
					+ "</span>"
					+ "<span class='achieve'>"
					+ "<i class='fa fa-heart-o'></i> "
					+ "<strong>" +obj.memberList[0].answer_num+ "</strong>回答"
					+ "</span>"
					+ "</div>"
					
					+ "</div>"
					+ "</div>"
					+ "</div>";

			}
		}
	});	
	return content;
}

// 显示摘要全文
function getDigestSource(id) {
	// 全部内容
	var editable_content = document.getElementById("editable-content-" + id);
	// 摘要
	var summary_content = document.getElementById("summary-content-" + id);
	
	// 收起
	var retract = document.getElementById("retract-" + id);
	
	// 投票按钮
	var vote_detail = document.getElementById("vote-detail-" + id);
	var vote_digest = document.getElementById("vote-digest-" + id);
	
	if (editable_content.style.display == "none") {
		editable_content.style.display = "block";
		retract.style.display = "block";
		summary_content.style.display = "none";
		
		vote_detail.style.display = "block";
		vote_digest.style.display = "none";
	} 
//	else {
//		editable_content.style.display = "none";
//		summary_content.style.display = "block";
//	}
}

// 收起答案
function retract(id) {
	var editable_content = document.getElementById("editable-content-" + id);
	var summary_content = document.getElementById("summary-content-" + id);
	
	// 收起按钮
	var retract = document.getElementById("retract-" + id);
	
	// 投票按钮
	var vote_detail = document.getElementById("vote-detail-" + id);
	var vote_digest = document.getElementById("vote-digest-" + id);
	
	editable_content.style.display = "none";
	retract.style.display = "none";
	summary_content.style.display = "block";

	vote_detail.style.display = "none";
	vote_digest.style.display = "block";
}

// 显示个人主页摘要全文
function getHomeDigestSource(id) {
	// 全部内容
	var editable_content = document.getElementById("editable-content-" + id);
	// 摘要
	var summary_content = document.getElementById("summary-content-" + id);
	
	// 收起
	var retract = document.getElementById("retract-" + id);
	
	
	if (editable_content.style.display == "none") {
		editable_content.style.display = "block";
		retract.style.display = "block";
		summary_content.style.display = "none";
	} 
}

// 收起答案
function retractHome(id) {
	var editable_content = document.getElementById("editable-content-" + id);
	var summary_content = document.getElementById("summary-content-" + id);
	
	// 收起按钮
	var retract = document.getElementById("retract-" + id);
	
	editable_content.style.display = "none";
	retract.style.display = "none";
	summary_content.style.display = "block";
}

// 编辑答案
function getEditSubmit() {
	var askdiv = document.getElementById('edit_answer');
	
	var input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('name', 'answer_content');
	input.setAttribute('value', bacheditorq.getHTML());
	alert(bacheditorq.getHTML());
	
	//askdiv.appendChild(input);
	
	return true;
}




































