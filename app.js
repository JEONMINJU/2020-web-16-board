/************* Import **************/
require('dotenv').config();
const express = require('express');
const app = express();
const path = require('path');
const { err } = require('./modules/util');
const session = require('./modules/session');
const local = require('./modules/local');

/************* Server **************/
app.listen(process.env.PORT, () => {
	console.log('=====================');
	console.log('http://localhost:'+process.env.PORT);
	console.log('=====================');
});

/************* View/pug **************/
app.set('view engine', 'pug');//view engine이라는 변수에 pug를 넣고
app.set('views', path.join(__dirname, 'views'));//views라는 변수에 views를 집어 넣은거
app.locals.pretty = true;

/************* Post/Body **************/
app.use(express.json());
app.use(express.urlencoded({extended: false}));

/************* SESSION **************/
app.use(session());
app.use(local());

/************* Router **************/
const authRouter = require('./routes/auth-route');
const boardRouter = require('./routes/board-route');
const apiRouter = require('./routes/api-route');
const galleryRouter = require('./routes/gallery-route');

app.use('/', express.static(path.join(__dirname, 'public')));
app.use('/storages', express.static(path.join(__dirname, 'uploads')));
app.use('/auth', authRouter);// '/auth'로 들어온다면 authRouter로 보내기
app.use('/board', boardRouter);
app.use('/api', apiRouter);
app.use('/gallery', galleryRouter);


/************* Error **************/
app.use((req, res, next) => {
	next(err(404));
});

app.use((err, req, res, next) => {
	console.log(err);
	res.render('error', err);//뷰스 안에 있는 error를 보여주고 내가 전달받은 err를 보여달라.
});