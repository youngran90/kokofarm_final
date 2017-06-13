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
var emp_id;

app.get('/', function(request, response) {
	   emp_id = request.param("emp_id");
	   response.sendfile(__dirname + '/htmlPage.html');
	})

function Sockets(){
	this.sockets = {};
}

Sockets.prototype.set = function(id, data){
	this.sockets[id] = data;
}

Sockets.prototype.get = function(id, callback){
	if(this.sockets[id] !=  undefined){
		callback(true, this.sockets[id]);
	}else{
		callback(false, this.sockets[id]);
	}
}

/*//웹서버 생성
var server = http.createServer(function(request, response){
	fs.readFile('rt_action.html', function(error, data){
		response.writeHead('200', {'Content-Type' : 'text/html'});
		response.end(data);
	});
});
*/

//server Socket 생성
var roomList = [];
var io = socketio.listen(server);
var id = 0;
io.sockets.on('connection', function(socket){ //sockets => 서버소켓에 접속한 모든 소켓
	var sockets= new Sockets();//내가 만든것	
	console.log('connected...');
	
	socket.on('roomRequest', function(){
		io.sockets.emit('roomResponse', roomList);
	});
	
	socket.on('create', function(data){
		roomList.push(data);
		io.sockets.emit('roomResponse', roomList);
	});	
	
	socket.on('join', function(data){
		socket.join(data); //저장같은 개념...(룸을 제공해준다... 채팅방!!!) join 입장, leave 나가기
		//sockets.set('room', data);
	});
	
	socket.on('message', function(data){
		io.sockets.in(data.room).emit('message', data); //in(해당하는 방에만 접속)
		/*sockets.get('room', function(error, room){
			io.sockets.in(room).emit('message', data);
		});*/
	});
	
	
});

















