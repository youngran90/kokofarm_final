var fs = require('fs');
var http = require('http');
var socketio = require('socket.io');
var express = require('express');
var app = express();


//웹 서버를 만든다
var server = http.createServer(app);

server.listen("8082",function(){
	console.log("코코팜 노드 서버 실행");
});

var member_id; //멤버 id

app.get('/', function(request, response) {
	   member_id = request.param("member_id");
	   response.sendfile(__dirname + '/rt_action.html');
})

var users = [];
var io = socketio.listen(server);
io.sockets.on('connection', function(socket){ //sockets => 서버소켓에 접속한 모든 소켓
	
	//접속자 수를 클라이언트에 보낸다
	users.push(member_id);
	socket.emit('user',users);
	
	socket.on('message', function(data){
		io.socket.emit('message', data);
	});
	
	
});

















