//모듈 추출
var express = require('express');
var app = express();
var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');
var path = require('path');


// 웹 서버 만듦
var server = http.createServer(app);

server.listen("8083", function() {
	console.log("fofofarm 가동");
});

var member_id; var seller_no;
var img; var img01; var img02;
var product_n;
var down;
var unit;
var content;
var area;

app.get('/btn_img01',function (req,res){     
    var filename = 'btn1.PNG';
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\files\\attach\\'+filename;
    fs.exists(dir, function (exists) {
        if (exists) {
            fs.readFile(dir, function (err,data){
                res.end(data);
            });
        } else {
            res.end('file is not exists');
        }
    })
});

app.get('/btn_img02',function (req,res){     
    var filename = 'btn2.PNG';
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\files\\attach\\'+filename;
    fs.exists(dir, function (exists) {
        if (exists) {
            fs.readFile(dir, function (err,data){
                res.end(data);
            });
        } else {
            res.end('file is not exists');
        }
    })
});

app.get('/img',function (req,res){     
    var filename = img;
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\files\\attach\\'+filename;
    fs.exists(dir, function (exists) {
        if (exists) {
            fs.readFile(dir, function (err,data){
                res.end(data);
            });
        } else {
            res.end('file is not exists');
        }
    })
});
app.get('/img01',function (req,res){     
    var filename = img01;
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\files\\attach\\'+filename;
    fs.exists(dir, function (exists) {
        if (exists) {
            fs.readFile(dir, function (err,data){
                res.end(data);
            });
        } else {
            res.end('file is not exists');
        }
    })
});
app.get('/img02',function (req,res){     
    var filename = img02;
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\files\\attach\\'+filename;
    fs.exists(dir, function (exists) {
        if (exists) {
            fs.readFile(dir, function (err,data){
                res.end(data);
            });
        } else {
            res.end('file is not exists');
        }
    })
});

/*app.get('/img01', function(request, response) {
	fs.readFile(img01, function(error, data) {
		response.writeHead(200, {
			'content-type' : 'text/html'
		});
		response.end(data);
	});
});*/


app.get('/', function(request, response) {
	member_id = request.param("member_id");
	product_n = request.param("name");
	down = request.param("down");
	unit = request.param("unit");
	img = request.param("img");
	img01 = request.param("img01");
	img02 = request.param("img02");
	content = request.param("content");
	area = request.param("area");
	seller_no =request.param("seller_no");
	response.sendfile(__dirname + '/rt_auction.html');
})
1
var userList = []; // 접속한 사용자를 저장할 배열
// 소켓 서버를 만듦
var io = socketio.listen(server);

io.sockets.on('connection', function(socket) {
	var joinedUser = false;
	var nickname = member_id;
	
	io.sockets.emit('info',{ 
		product_n : product_n, 
		down : down, 
		unit : unit,
		content : content,
		area : area,
		seller_no : seller_no,
		img : '/img',
		img01 : '/img01',
		img02 : '/img02'
	}); // 경매정보 전송
	
	socket.emit('user',member_id); //접속한 유저를 보낸다.
	
	//이미 접속한 유저면 .... 중단
	var count = 0;
		
	 //접속한 유저를 배열에 저장한다.
	if(userList.length == 0){
		userList.push(nickname);
	}else{
		Loop: for(var i=0; i<userList.length; i++){
			if(nickname == userList[i]){
				count++;
				break Loop;
			}
		}
		if(count == 0){
			userList.push(nickname);
		}
	}
	
	io.sockets.emit('text',{
		nickname : nickname,
		userList : userList
	});
		
	//메세지 전달 이벤트
	socket.on('send',function(data){ //클리이언트에서 보낸 메세지를 받고
		io.sockets.emit('send',{ // 보낸다
			nickname : data.name,
			msg : data.messeage
		});
	});
	
	socket.on('disconnect', function () {
	       if(nickname){
	       io.sockets.emit('exit',{
	    	   msg : nickname + " 님이 나가셨습니다."
	       }); 
	        deleteUser();
	       }
	});
	
	 var deleteUser  = function(){
	        for (var i in userList) {
	            if(userList[i] == nickname){
	                delete userList[i];
	                userList.splice(i, 1);
	            }
	        }
	        refreshUserList();
	 }
	 
	 var refreshUserList = function(){
	        io.sockets.emit('userlist',userList);
	 }
	 
	 
	 /////////////////////////////////////////
	 /* 실시간 경매 구현할 소켓 */
	 
	 //1000원
	 socket.on('1000',function(data){ //받고
		io.sockets.emit('1000',{ //전송
			 btn_1 : data.price,
			 id : data.id
		 });
	 });
	 
	 //5000원
	 socket.on('5000',function(data){ //받고
		io.sockets.emit('5000',{ //전송
			 btn_2 : data.price,
			 id : data.id
		 });
	 });
	 
	//10000원
	 socket.on('10000',function(data){ //받고
		io.sockets.emit('10000',{ //전송
			 btn_3 : data.price,
			 id : data.id
		 });
	 });
	 
	 //직접 금액을 입력
	 socket.on('rt_tender',function(data){
		io.sockets.emit('rt_tender',{
			btn_4 : data.price,
			id : data.id
		});
	 });
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
});