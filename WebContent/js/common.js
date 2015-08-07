/**
 * 数据校验
 */

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
	
	
//	if (login_btn.style.display=="none"){
//		login_btn.style.display="none";
//		
//	} else {
//	    target.style.display="block";
//	    clicktext.innerText='关闭详细信息信息';
//	}
	
}

function showError(id) {
	var alertDiv = document.getElementById(id);
	alertDiv.setAttribute("style", "display:block");
}

function hideError(id){
	var alertDiv = document.getElementById(id);
	alertDiv.setAttribute("style", "display:none");
}

function validateUsername() {
	
}