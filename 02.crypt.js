const crypto = require('crypto');// crypto 는 암호화 모듈(노드에서 지원)
const bcrypt = require('bcrypt');// bcrypt(노드 라이브러리)모듈을 통해 암호화를 시키면 더 안전하게 저장가능

let pass = '1111';
let salt = '1234n8sa@4912mka';
let pass2 = '1111';
let sha512 = crypto.createHash('sha512').update(pass+salt).digest('base64');
sha512 = crypto.createHash('sha512').update(sha512).digest('base64');
sha512 = crypto.createHash('sha512').update(sha512).digest('base64');
let sha5122 = crypto.createHash('sha512').update(pass2+salt).digest('base64');
sha5122 = crypto.createHash('sha512').update(sha5122).digest('base64');
sha5122 = crypto.createHash('sha512').update(sha5122).digest('base64');
console.log(sha512);
console.log(sha5122);

var hash = null;
const genPass = async (pass) => {
	hash = await bcrypt.hash(pass, 7);//hash 단방향을 만들어줘(숫자 높으면 강력해지지만 오래걸림)
	console.log(hash);
}

const comparePass = async (pass) => {
	var compare = await bcrypt.compare(pass, hash);//compare 메서드를 통해 내가 입력받은 pass와 hash를 받는다.
	console.log(compare);
}

genPass('1234');// 패스워드 만들어주는 함수
setTimeout(() => {
	comparePass('1234'); //comparePass로 1234 를 보내서 트루,폴스 확인 (같은걸 보내줘야 트루?)
}, 1000); // 1초 뒤에 비교해보기