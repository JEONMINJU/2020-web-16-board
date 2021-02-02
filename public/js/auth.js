function onLogon(f) {
	if(f.userid.value.trim() == "") {
		f.userid.focus();
		return false;
	}
	if(f.userpw.value.trim() == "") {
		f.userpw.focus();
		return false;
	}
	return true; // 로그인페이지에서 id, pw 둘다 입력돼야 전송!!
}


function comment(el, cmt, cls) {
	$(el).next().html(cmt);
	$(el).next().removeClass('active danger');
	$(el).next().addClass(cls);
}
//전역변수 선언 해놓기
var idChk = false; 
var passChk = false;
var nameChk = false;
var emailChk = false;
function onBlurId(el) {
	function onResponse(r) {
		if(r.result) {
			comment(el, '멋진 아이디입니다! 사용가능합니다.', 'active');//통신을 해서 나온 결과값
			idChk = true;
			return true;
		}
		else {
			comment(el, '존재하는 아이디입니다. 사용할 수 없습니다.', 'danger');
			idChk = false;
			return false;
		}
	}
	var userid = $(el).val().trim();	// el.value
	if(userid.length < 8) {
		comment(el, '아이디는 8자 이상입니다.', 'danger');
		idChk = false;
		return false;
	}
	else {
		$.get('/auth/userid', { userid: userid }, onResponse);
	}
}

function onBlurPw(el) {
	var pw = $(el).val().trim();
	var len = pw.length;
	var num = pw.search(/[0-9]/g);	// >= 0
	var eng = pw.search(/[a-z]/ig);	// >= 0
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);	// >= 0
	if(len < 8 || len > 20) {
		comment(el, '비밀번호는 8자 이상 20자 이하입니다.', 'danger');
		passChk = false;
		return false;
	}
	if(num < 0 || eng < 0 || spe < 0) {
		comment(el, '비밀번호는 영문자, 숫자, 특수문자를 포함하여야 합니다.', 'danger');
		passChk = false;
		return false;
	}
	comment(el, '비밀번호를 사용할 수 있습니다.', 'active');
	passChk = true; //위에꺼 다 통과하면 여기서 트루 
	return true;
}

function onBlurPw2(el) {
	var f = document.joinForm;//join.pug에 있는 joinForm
	if(f.userpw.value.trim() !== f.userpw2.value.trim()) {
		comment(el, '비밀번호가 일치하지 않습니다.', 'danger');
		passChk = false;
		return false;// 보내면 안되니깐.
	}
	comment(el, '비밀번호를 사용할 수 있습니다.', 'active');
	passChk = true;
	return true;
}

function onBlurName(el) {
	if($(el).val().trim().length == 0) {
		comment(el, '이름을 입력하세요.', 'danger');
		nameChk = false;
		return false;
	}
	comment(el, '', 'active');
	nameChk = true;
	return true;
}

function onBlurEmail(el) {
	var emailVal = $(el).val().trim();
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규표현식
	if(emailVal.match(regExp) == null) {
		comment(el, '올바른 이메일이 아닙니다.', 'danger');
		emailChk = false;
		return false;
	}
	comment(el, '사용할 수 있는 이메일 입니다.', 'active');
	emailChk = true;
	return true;
}
// 마지막 검증은 join.pug의 input안의 submit 에서 제출
function onJoin(f) {
	if(!idChk) {//idChk가 트루가 아니라면
		alert('아이디를 확인하세요.');
		f.userid.focus();
		return false;
	}
	if(!passChk) {
		alert('패스워드를 확인하세요.');
		f.userpw.focus();
		return false;
	}
	if(!nameChk) {
		alert('이름을 확인하세요.');
		f.username.focus();
		return false;
	}
	if(!emailChk) {
		alert('이메일을 확인하세요.');
		f.email.focus();
		return false;
	}
	return true;// 위의 모든 검증을 끝내고 나면 true
}