//모듈 추출
var express = require('express');
var app = express();
var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');

//웹 서버 만듦
var server = http.createServer(app);

server.listen("8082",function(){
	console.log("fofofarm 가동");
});

var member_id;




app.get('/', function(request, response) {
   console.log("으아아");
   console.log("캬캬캬캬캬");
   member_id = request.param("member_id");
   response.sendfile(__dirname + '/rt_action.html');
})


//소켓 서버를 만듦
var io = socketio.listen(server);
io.sockets.on('connection', function(socket) {
	
	console.log(socket.id);
	
	socket.emit('user',member_id);
	socket.emit('text',member_id+" 님 입장하셨습니다.");

	socket.on('send',function(data){
		socket.emit('receive',{
			messeage : data.name + " :" + data.messeage
		});
	});
   
});