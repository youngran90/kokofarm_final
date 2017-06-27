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
	console.log("kokofarm 시스템 가동");
});

var member_id; var seller_no;
var img; var img01; var img02;
var product_n;
var down;
var content;
var area;
var unit;
var rt_auction_no;

app.get('/rt_auction',function (req,res){     
    var filename = 'rt_auction.css';
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\rt_auction\\css\\'+filename;
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

app.get('/btn_img01',function (req,res){     
    var filename = 'btn1.PNG';
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\rt_auction\\image\\'+filename;
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
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\rt_auction\\image\\'+filename;
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

app.get('/tag_img01',function (req,res){     
    var filename = 'carrot.png';
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\rt_auction\\image\\'+filename;
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
    var dir = 'C:\\Users\\김Jason\\Desktop\\Kosta\\spring_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kokofarm\\resources\\files\\attach\\'+filename;
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
    var dir = 'C:\\Users\\김Jason\\Desktop\\Kosta\\spring_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kokofarm\\resources\\files\\attach\\'+filename;
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
    var dir = 'C:\\Users\\김Jason\\Desktop\\Kosta\\spring_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kokofarm\\resources\\files\\attach\\'+filename;
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
	rt_auction_no = request.param("rt_auction_no");
	response.sendfile(__dirname + '/rt_auction.html');
	
});

var m = 100; //경매 대기 시간 카운트 (분)
var s = 10;  //경매 대기 시간 카운트 (초)

var minute = 100; //경매 진행 시간 카운트 (분)
var second = 10;//경매 진행 시간 카운트 (초)

var wait = setInterval(function(){ //setInterval 일정시간마다 반복 실행하는 함수
	if(m == 0 && s == 0 ){
		var count = setInterval(function(){ //setInterval 일정시간마다 반복 실행하는 함수
				
			if(minute == 0 && second == 0 ){
			 		
			 	clearInterval(count); //타이머 종료 
			 						
			 	}else{
			 		second--; // 초 처리
			 		
			 		// 분처리
			 	if(second < 0){
			 		minute--;
					second = 59;
		 		}
		 	}	
		}, 1000); //1초단위로 변동
			
		clearInterval(wait); //타이머 종료 
			
	 	}else{
	 		s--; // 초 처리
	 					
	 		// 분처리
	 		if(s < 0){
	 			m--;
	 			s = 59;
	 		}
	 	}	
	}, 1000); //1초단위로 변동


var userList = []; // 접속한 사용자를 저장할 배열
var socketList = {}; // 소켓 id담을 객체
// 소켓 서버를 만듦
var io = socketio.listen(server);

io.sockets.on('connection', function(socket) {
	var nickname = member_id;
	var hap_1000, hap_5000, hap_10000, input_hap;
	
	socketList[nickname] = socket.id;
	socket.member_id = member_id;
	
	// 경매 관련 정보를 넘긴다.
	io.sockets.emit('info',{ 
		product_n : product_n, 
		down : down, 
		unit : unit,
		content : content,
		area : area,
		seller_no : seller_no,
		rt_auction_no : rt_auction_no,
		img : '/img',
		img01 : '/img01',
		img02 : '/img02'
	}); // 경매정보 전송
	
	socket.emit('user',member_id); //접속한 유저를 보낸다.
	
	//이미 접속한 유저면 .... 중단
	var count = 0;
	
	 //접속한 1유저를 배열에 저장한다.
	if(userList.length == 0){
		userList.push(nickname);
		io.sockets.emit('text',{
			nickname : nickname,
			userList : userList
		});
	}else{
		Loop: for(var i=0; i<userList.length; i++){
			if(nickname == userList[i]){
				count++;
				break Loop;
			}
		}
		if(count == 0){
			userList.push(nickname);
			io.sockets.emit('text',{
				nickname : nickname,
				userList : userList
			});
		}
	}
	
		
	//메세지 전달 이벤트
	socket.on('send',function(data){ //클리이언트에서 보낸 메세지를 받고
		socket.broadcast.emit('send',{ // 보낸다
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
		hap_1000 = data.price + 1000;
		io.sockets.emit('1000',{ //전송
			 hap : hap_1000,
			 id : nickname
		});
	 });
	
	 //5000원
	 socket.on('5000',function(data){ //받고
		hap_5000 = data.price + 5000;
		io.sockets.emit('5000',{ //전송
			 hap : hap_5000,
			 id : nickname
		 });
	 });
	 
	//10000원
	 socket.on('10000',function(data){ //받고
		hap_10000 = data.price + 10000;
		io.sockets.emit('10000',{ //전송
			 hap : hap_10000,
			 id : nickname
		 });
	 });
	 
	 //직접 금액을 입력
	 socket.on('rt_tender',function(data){
		input_hap = data.price + data.input_price;
		io.sockets.emit('rt_tender',{
			hap : input_hap,
			id : nickname
		});
	 });
	 
	 //////////////////////////////////////////
	 //경매 종료시 넘어오는 소켓 넘어 오는 정보 
	 // 경매번호
	 // 낙찰자
	 // 낙찰금액
	 // 경매 종료시간
	 socket.on('finish',function(data){
		 
		 if(data.id == nickname){
			 io.sockets.sockets[socketList[data.id]].emit("finish",data);
		 }
	 });
	 
	 // 경매 대기 시간 카운터
	 var w_t = setInterval(function(){ //setInterval 일정시간마다 반복 실행하는 함수
			io.sockets.emit('wait',{
				w_m : m,
				w_s : s
			});
		 	if(m == 0 && s == 0 ){
		 		
		 		//경매 시간
		 		var timer = setInterval(function(){ //setInterval 일정시간마다 반복 실행하는 함수
		 			io.sockets.emit('time',{
		 				m : minute,
		 				s : second
		 			});
		 		 	if(minute == 0 && second == 0 ){
		 		 		clearInterval(timer); //타이머 종료
		 		 		socket.emit("end",{
				 			msg : "경매가 종료 되었습니다."
		 		 		});
		 		 	}
		 		 }, 1000); //1초단위로 변동
		 		
		 		clearInterval(w_t); //타이머 종료 
		 	}
		 }, 1000); //1초단위로 변동
	 
	
	 
	 
});














































/* 

음악파일 가져오는 코드
app.get('/mp3.01',function (req,res){     
    var filename = 'TWICE-SIGNAL.mp3';
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\rt_auction\\mp3\\'+filename;
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

app.get('/mp3.02',function (req,res){     
    var filename = 'PSY-NewFace.mp3';
    var dir = 'C:\\Users\\김Jason\\git\\kokofarm_final\\Kokofarm\\src\\main\\webapp\\resources\\rt_auction\\mp3\\'+filename;
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

자체 디렉토리에 있는 파일 불러오는 코드
app.get('/img01', function(request, response) {
	fs.readFile(img01, function(error, data) {
		response.writeHead(200, {
			'content-type' : 'text/html'
		});
		response.end(data);
	});
});
*/