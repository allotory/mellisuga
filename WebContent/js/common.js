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

// 赞成
function voteUp() {

}

//动态显示回答编辑器
function renderAnswerEditor() {
	var answerdiv = document.getElementById('answer-editor');
	answerdiv.className='editor';
	
	bacheditor = new Editor();
	bacheditor.render('#answers','edit');
}

//动态显示提问编辑器
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

//提交答案
function newAnswer(question_id) {
	var answers = bacheditor.getHTML();
	var is_anonymous = document.getElementById('is_anonymous');
	if(answers == "") {
		alert("答案不能为空！");
	} else {
		loadXMLDoc("AnswerServlet?question_id=" + question_id + "&answers=" + answers + "&is_anonymous=" + is_anonymous, function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("newAnswer").innerHTML = xmlhttp.responseText;
			}
		});
		bacheditor.setVal('');
	}
}

// 添加问题评论
function newQuestionComment(question_id) {
	var qcomment = document.getElementById('qcomment');
	loadXMLDoc("CommentQuestionServlet?question_id=" + question_id + "&&comment_content=" + qcomment.value, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var commentDiv = document.createElement('div');
			commentDiv.id = "newQuestionComment";
			document.getElementById("newQuestionComments").appendChild(commentDiv);
			commentDiv.innerHTML = xmlhttp.responseText;
		}
	});
	qcomment.value = "";
}

// 查询问题评论
function queryQCommentList(question_id) {
	
	loadXMLDoc("QuestionCommentDetailsServlet?question_id=" + question_id, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = JSON.parse(xmlhttp.responseText);
			
			for(var i = 0; i< obj.commentBeanList.length; i++) {
				
				var commentDiv = document.createElement('div');
				commentDiv.id = "questionComment-" + obj.commentBeanList[i].comment.id;
				document.getElementById("newQuestionComments").appendChild(commentDiv);
				
				var str = '<div class="panel-body q-comment"'
						+ 'onmouseenter="showItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')"'
						+ 'onmouseleave="hiddenItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')">'
						+ '<!-- avatar and upvote col -->'
						+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
						+ '<div class="row">'
						+ '<a href="#">'
						+ '<img src="'+ obj.commentBeanList[i].member.avatar_path +'" class="img-responsive img-rounded" alt="Responsive image">'
						+ '</a>'
						+ '</div>'
						+ '</div><!-- end avatar and upvote col -->'
					
						+ '<!-- comment-details -->'
						+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
						+ '<div class="row">'
						+ '<div class="author-info">'
						+ '<a href="#"><strong>' + obj.commentBeanList[i].member.fullname + '</strong></a>'
						+ '</div>'
						+ '</div>'

						+ '<div class="row">'
						+ '<div class="question-content">'
						+ '<div class="editable-content" style="display: block;">'
						+ obj.commentBeanList[i].comment.content
						+ '<span class="answer-date" style="display: block;">'
						+ '<a target="_blank" href="#">发布于 ' + obj.commentBeanList[i].comment.comment_date + '</a>'
						+ '<span id="comment-hidden' + obj.commentBeanList[i].comment.id + '" style="display:none; margin-left: 5px;">'
						+ '<a href="#" class="split"><i class="fa fa-reply"></i> 回复</a>'
						+ '<a href="#" class="split"><i class="fa fa-thumbs-o-up"></i> 赞</a>'
						+ '<a href="#" class="split"><i class="fa fa-flag-o"></i> 举报</a>'
						+ '</span>'
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

//添加答案评论
function newAnswerComment(answer_id) {
	var acomment = document.getElementById('acomment');
	loadXMLDoc("CommentAnswerServlet?answer_id=" + answer_id + "&&comment_content=" + acomment.value, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = JSON.parse(xmlhttp.responseText);
			
			var commentDiv = document.createElement('div');
			commentDiv.id = "answerComment-" + obj.acommentBeanList[0].comment.id;
			document.getElementById("newAnswerComments").appendChild(commentDiv);
			
			var str = '<div class="panel-body q-comment"'
					+ 'onmouseenter="showItem(\'comment-hidden' + obj.acommentBeanList[0].comment.id + '\')"'
					+ 'onmouseleave="hiddenItem(\'comment-hidden' + obj.acommentBeanList[0].comment.id + '\')">'
					+ '<!-- avatar and upvote col -->'
					+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
					+ '<div class="row">'
					+ '<a href="#">'
					+ '<img src="'+ obj.acommentBeanList[0].member.avatar_path +'" class="img-responsive img-rounded" alt="Responsive image">'
					+ '</a>'
					+ '</div>'
					+ '</div><!-- end avatar and upvote col -->'
				
					+ '<!-- comment-details -->'
					+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
					+ '<div class="row">'
					+ '<div class="author-info">'
					+ '<a href="#"><strong>' + obj.acommentBeanList[0].member.fullname + '</strong></a>'
					+ '</div>'
					+ '</div>'

					+ '<div class="row">'
					+ '<div class="question-content">'
					+ '<div class="editable-content" style="display: block;">'
					+ obj.acommentBeanList[0].comment.content
					+ '<span class="answer-date" style="display: block;">'
					+ '<a target="_blank" href="#">发布于 ' + obj.acommentBeanList[0].comment.comment_date + '</a>'
					+ '<span id="comment-hidden' + obj.acommentBeanList[0].comment.id + '" style="display:none; margin-left: 5px;">'
					+ '<a href="#" class="split"><i class="fa fa-reply"></i> 回复</a>'
					+ '<a href="#" class="split"><i class="fa fa-thumbs-o-up"></i> 赞</a>'
					+ '<a href="#" class="split"><i class="fa fa-flag-o"></i> 举报</a>'
					+ '</span>'
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
	acomment.value = "";
}



//查询答案评论
function queryACommentList(answer_id) {
	
	loadXMLDoc("AnswerCommentDetailsServlet?answer_id=" + answer_id, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = JSON.parse(xmlhttp.responseText);
			
			for(var i = 0; i< obj.commentBeanList.length; i++) {
				
				var commentDiv = document.createElement('div');
				commentDiv.id = "answerComment-" + obj.commentBeanList[i].comment.id;
				document.getElementById("newAnswerComments").appendChild(commentDiv);
				
				var str = '<div class="panel-body q-comment"'
						+ 'onmouseenter="showItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')"'
						+ 'onmouseleave="hiddenItem(\'comment-hidden' + obj.commentBeanList[i].comment.id + '\')">'
						+ '<!-- avatar and upvote col -->'
						+ '<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">'
						+ '<div class="row">'
						+ '<a href="#">'
						+ '<img src="'+ obj.commentBeanList[i].member.avatar_path +'" class="img-responsive img-rounded" alt="Responsive image">'
						+ '</a>'
						+ '</div>'
						+ '</div><!-- end avatar and upvote col -->'
					
						+ '<!-- comment-details -->'
						+ '<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">'
						+ '<div class="row">'
						+ '<div class="author-info">'
						+ '<a href="#"><strong>' + obj.commentBeanList[i].member.fullname + '</strong></a>'
						+ '</div>'
						+ '</div>'

						+ '<div class="row">'
						+ '<div class="question-content">'
						+ '<div class="editable-content" style="display: block;">'
						+ obj.commentBeanList[i].comment.content
						+ '<span class="answer-date" style="display: block;">'
						+ '<a target="_blank" href="#">发布于 ' + obj.commentBeanList[i].comment.comment_date + '</a>'
						+ '<span id="comment-hidden' + obj.commentBeanList[i].comment.id + '" style="display:none; margin-left: 5px;">'
						+ '<a href="#" class="split"><i class="fa fa-reply"></i> 回复</a>'
						+ '<a href="#" class="split"><i class="fa fa-thumbs-o-up"></i> 赞</a>'
						+ '<a href="#" class="split"><i class="fa fa-flag-o"></i> 举报</a>'
						+ '</span>'
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