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
	loadXMLDoc("CommentQuestionServlet?question_id=" + question_id, function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("newQuestionComment").innerHTML = xmlhttp.responseText;
		}
	});
}
