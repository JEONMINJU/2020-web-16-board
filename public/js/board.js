function onModal(src) {
	$(".modal-wrapper").addClass('active');
	$(".modal-wrapper .modal-img").attr('src', src);
}

function onModalClose() {
	$(".modal-wrapper").removeClass('active');
}

// form을 받아서 f.title에 value를 트리밍한 것이 빈값이라면
function onSave(f) {
	if(f.title.value.trim() == "") {
		alert('제목을 입력하세요.'); // 경고창을 띄워주고
		f.title.focus(); // 폼안에 포커스 주고
		return false; // 전송하면 안되니깐 리턴 폴스
	}
	return true; // 입력된 게 있다면 트루로 전송해라.
}

function onMobile() {
	$('.mobile-sub').stop().slideToggle(300);
}

function onResize(e) {
	if($(this).width() > 767) { //$(this)는 window
		$('.mobile-sub').stop().slideUp(0);
	}
}
$(window).resize(onResize);