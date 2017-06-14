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
   response.sendfile(__dirname + '/rt_action.html');
})


//소켓 서버를 만듦
var io = socketio.listen(server);
io.sockets.on('connection', function(socket) {
	
	console.log(socket.id);
	
	io.sockets.emit('user',member_id);
	io.sockets.emit('text',member_id+" 님 입장하셨습니다.");

	socket.on('send',function(data){
		io.sockets.emit('receive',{
			messeage : data.name + " :" + data.messeage
		});
	});
   
});