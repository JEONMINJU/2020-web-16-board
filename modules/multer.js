const multer = require('multer');
const fs = require('fs-extra');
const { v4 } = require('uuid');
const moment = require('moment');
const path = require('path');

// 허용 파일
const imgExt = ['jpg', 'jpeg', 'png', 'gif'];
const allowExt = [...imgExt, 'pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'hwp', 'md', 'zip'];

const destCb = (req, res, cb) => {
	var folder = path.join(__dirname, '../uploads', moment().format('YYMMDD_HH'));
	fs.ensureDirSync(folder); //폴더가 있는지 없는지 체그해서 없으면 만들어주는 거
	cb(null, folder); //콜백함수에 folder를 집어 넣어준다. 
}

const fileCb = (req, file, cb) => {
	var ext = path.extname(file.originalname); //.jpg //originalname은 실제 파일명을 뜻한다.
	var name = moment().format('YYMMDD_HH') + '-' + v4() + ext; //v4가 난수를 발생시키고 마지막에 확장자 ext 가 붙는다.
	cb(null, name);
}

const storage = multer.diskStorage({
	destination: destCb, //어느 폴더안에 업로드한 파일을 저장할 지를 결정
	filename: fileCb //폴더안에 저장되는 파일명을 결정하는데 사용
});

// fileFilter 는 함수다
const limits = { fileSize: 10240000 }; // 10메가
const fileFilter = (req, file, cb) => {
	// .Jpg->Jpg->jpg
	var ext = path.extname(file.originalname).substr(1).toLowerCase();//substr로 1번자리 빼고 뒤에꺼 가져오고 toLowerCase로 소문자로 바꿔가져오기.
	if(allowExt.includes(ext)) { //includes는 es6 문법-포함하고 있니?
		cb(null, true);// 에러는 없고 올려달라
	}
	else { //그게 아니면
		req.banExt = ext; //req에 banExt를 사용자가 올린 확장자명ext를 넣고
		cb(null, false);
	}
}
// 위의 const storage 가 실행되고 여기 밑에 보내준다.
const upload = multer({ storage, limits, fileFilter });
// 위의 업로드를 밑에 익스폴츠 업로드 해준다.
module.exports = { upload, imgExt, allowExt };