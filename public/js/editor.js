var toolbar = 'undo redo styleselect bold italic alignleft aligncenter alignright bullist numlist outdent indent code';
//문서가 다 로드되면 이걸 실행해주세요.
$(document).ready(function(){
	tinymce.init({
		selector:'#content',
		min_height: 300,
		plugins: 'code',
		toolbar: toolbar,
	});
});