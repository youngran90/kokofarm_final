//모듈 추출
var express = require('express');
var app = express();
var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');

//웹 서버 만듦
var server = http.createServer(app);

server.listen("8083",function(){
	console.log("fofofarm 가동");
});

var member_id;

app.get('/', function(request, response) {
   member_id = request.param("member_id");
   name = request.param("name");
   down = request.param("down");
   unit = request.param("unit");
   img = request.param("img");
   response.sendfile(__dirname + '/rt_auction.html');
   console.log(member_id);
})


var count=0;
//소켓 서버를 만듦
var io = socketio.listen(server);
io.sockets.on('connection', function(socket) {
	
	socket.emit('user',member_id); // 세션값을 넘긴다
	socket.emit('info',{
		name : name,
		down : down,
		unit : unit,
		img : img
	}); //경매정보 전송
	
	io.sockets.emit('userlist',member_id); // 현재 참가자를 넘긴다
	
	io.sockets.emit('text',member_id+" 님 입장하셨습니다."); //환영인사

	socket.on('send',function(data){
		io.sockets.emit('receive',data); // 메세지 전달
	});
   
});