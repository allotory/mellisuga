
//登录注册div切换
function loginManager() {
	
	//登录div
	var register_title = document.getElementById("register_title");
	var login_btn = document.getElementById("login_btn");
	
	//注册div
	var login_title = document.getElementById("login_title");
	var register_btn = document.getElementById("register_btn");
	
	//form
	var login_form = document.getElementById("login_form");
	var register_form = document.getElementById("register_form");
	
	if(register_btn.style.display == "none") {
		register_btn.style.display = "inline";
		login_title.style.display = "inline";
		login_btn.style.display = "none";
		register_title.style.display = "none";
		
		login_form.style.display = "inline";
		register_form.style.display = "none";
		
	}else {
		login_btn.style.display = "inline";
		register_title.style.display = "inline";
		register_btn.style.display = "none";
		login_title.style.display = "none";

		register_form.style.display = "inline";
		login_form.style.display = "none";
	}
	
}

//校验用户姓名
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

//登录提交检验
function validateLoginSubmit() {
	var isEmailChecked = validateEmail("email");
	var isPassChecked = validatePass("password");
	
	var error = document.getElementById("alert_error");
	var email_error = document.getElementById("email_error");
	var pass_error = document.getElementById("pass_error");
	
	if(!(isEmailChecked && isPassChecked)) {
		if(!isEmailChecked) {
			error.style.display = "block";
			email_error.style.display = "block";
		}else {
			email_error.style.display = "none";
		}
		
		if(!isPassChecked) {
			error.style.display = "block";
			pass_error.style.display = "block";
		}else {
			pass_error.style.display = "none";
		}
		
		return false;
	}else {
		error.style.display = "none";
		email_error.style.display = "none";
		pass_error.style.display = "none";
		
		return true;
	}
}

//注册提交校验
function validateRegSubmit() {
	var isUsernameChecked = validateUsername("rusername");
	var isEmailChecked = validateEmail("remail");
	var isPassChecked = validatePass("rpassword");
	
	var error = document.getElementById("ralert_error");
	var username_error = document.getElementById("rusername_error");
	var email_error = document.getElementById("remail_error");
	var pass_error = document.getElementById("rpass_error");
	
	if(!(isEmailChecked && isPassChecked && isUsernameChecked)) {
		if(!isUsernameChecked) {
			error.style.display = "block";
			username_error.style.display = "block";
		}else {
			username_error.style.display = "none";
		}
		
		if(!isEmailChecked) {
			error.style.display = "block";
			email_error.style.display = "block";
		}else {
			email_error.style.display = "none";
		}
		
		if(!isPassChecked) {
			error.style.display = "block";
			pass_error.style.display = "block";
		}else {
			pass_error.style.display = "none";
		}
		
		return false;
	}else {
		error.style.display = "none";
		username_error.style.display = "none";
		email_error.style.display = "none";
		pass_error.style.display = "none";
		
		return true;
	}
}

//组件显示
function showItem(id) {
	var item = document.getElementById(id);
	item.style.display = "inline";
}
function hiddenItem(id) {
	var item = document.getElementById(id);
	item.style.display = "none";
}

//赞成
function voteUp() {
	
}





