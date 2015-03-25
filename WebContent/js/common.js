//div动态显示
function showDiv(id) {
	var alertDiv = document.getElementById(id);
	alertDiv.setAttribute("style","display");
}

//div动态隐藏
function hideDiv(id) {
	var alertDiv = document.getElementById(id);
	alertDiv.setAttribute("style","display:none");
}

//校验用户名
function validateUsername(id, infoId) {
	var username = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,14}$/;
	if (!reg.test(username)){
		//输出提示信息
		showDiv(infoId);
		return false;
	}else {
		//去掉提示信息
		hideDiv(infoId);
		
		//校验用户名唯一性
		//checkUsernameUniqueness();
		
		return true;
	}
}

//校验密码
function validatePassword(id, infoId) {
	var password = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,19}$/;
	if (!reg.test(password)){
		showDiv(infoId);
		return false;
	}else {
		//去掉提示信息
		hideDiv(infoId)
		return true;
	}
}

//校验密码一致性
function validateConfirmPass(pid, cpid, infoId) {
	var password = document.getElementById(pid).value.trim();
	var confirmPassword = document.getElementById(cpid).value.trim();
	if ((password != confirmPassword) | ((password == null) && (confirmPassword == null))) {
		showDiv(infoId);
		return false;
	}else {
		//去掉提示信息
		hideDiv(infoId)
		return true;
	}
}

//校验邮箱格式
function validateEmail(id, infoId) {
	var email = document.getElementById(id).value.trim();
	var reg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if(!reg.test(email)) {
		showDiv(infoId);
		return false;
	}else {
		hideDiv(infoId);
		return true;
	}
}















