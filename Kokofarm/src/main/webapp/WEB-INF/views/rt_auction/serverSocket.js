//모듈 추출
var express = require('express');
var app = express();
var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');
var path = require('path');

//웹 서버 만듦
var server = http.createServer(app);

server.listen("8083",function(){
	console.log("fofofarm 가동");
});

var member_id;
var img;
var product_n;
var down;
var unit;

app.get('/img', function (request, response) {
    fs.readFile(img, function (error, data) {
        response.writeHead(200, { 'content-type': 'text/html' });
        response.end(data);
    });
});

app.get('/', function(request, response) {
   member_id = request.param("member_id");
   product_n = request.param("name");
   down = request.param("down");
   unit = request.param("unit");
   img = request.param("img");
   response.sendfile(__dirname + '/rt_auction.html');
})

var userlist=[]; //접속한 사용자를 저장할 배열
//소켓 서버를 만듦
var io = socketio.listen(server);
io.sockets.on('connection', function(socket) {
	
	io.sockets.emit('info',{
		product_n : product_n,
		down : down,
		unit : unit,
		img : '/img'
	}); //경매정보 전송
	
	io.to(socket.id).emit('user',member_id); // 세션값을 넘긴다
	
	socket.member_id = member_id;
	userlist[member_id] = member_id;
	var users = new Array();
	
	for(var name in userlist){
		users.push(userlist[name]);
	}
	
	io.sockets.emit('userlist',users); // 현재 참가자를 넘긴다
	
	io.sockets.emit('text',member_id+" 님 입장하셨습니다."); //환영인사

	socket.on('send',function(data){
		io.sockets.emit('receive',data); // 메세지 전달
	});
	
	socket.on('disconnect', function(){
		delete userlist[socket.member_id];
		io.sockets.emit('userlist',userlist);
		io.sockets.emit('disconnected',member_id+" 님이 퇴장하셨습니다.");
	});
   
});