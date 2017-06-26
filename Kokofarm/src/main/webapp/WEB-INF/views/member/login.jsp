<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%@include file="../include/header.jsp"%>
    <style>
    	#loginBtn{
    	
    	position : relative;
    	left: 52%;
    	}
    </style>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script>
 		var jq = $.noConflict(true);
 	</script>
 
 
 <script>
 
	function enterkey() {
        if (window.event.keyCode == 13) {
 
        	$('#loginBtn').trigger('click');
        }
}
	
 
 
 
 jq(document).ready(function(){
	 jq("#findId").on("click",function(){
		 
		 	 			
				window.name = "parentForm";
				openWin = window.open("/find/id",
						"childForm", "width =500, height = 300, resizable = no, scrollbars = no");
						
		 return false;
	 });
	 
	 jq("#findPw").on("click",function(){
		 openWin  = window.open("/find/password", "childForm","width=500, height = 300, resizable= no, scrollbars=no");
		 return false;
	 });
	 

jq("#loginBtn").on('click',function(){
 	var id = $('#member_id').val();
 	var pw = $('#member_password').val();
 	
 	if(id==""){
 		alert("아이디를 입력하세요");
 		$('#member_id').focus();
  		return false;
 	}else if(pw==""){
 		
 		alert("비밀번호를 입력하세요");
 		$('#member_password').focus();
 		return false;
 	}
  	var params=jq("#loginForm").serialize();
  	  	
  		 	 jq.ajax({
 			 type : "post",
 			 url : "/member/loginOk",
 			 data : params,
 			 dataType : "html",
 			 success : function(result){
 				 
 				  if(result==0){
 					 alert("사용 할 수 없는 아이디 입니다.");
 					return false;
 				 } else if(result ==1){
 					
 					 document.loginForm.submit();
 			    /*   location.href="/member/loginPost" */
 					 					
 			    
 				 }; 
 				 
 			 }
 			 
 		 });
	});
 });
  	
 	 
 	
 
 
 
 </script>
 
    <div class="container">
  <ul class="breadcrumb">
    <li><a href="#">Account</a></li>
    <li><a href="/member/login">Login</a></li>
  </ul>
  <div class="row">
   <!--  <div class="col-sm-3 hidden-xs column-left" id="column-left">
      <div class="column-block">
        <div class="columnblock-title">Account</div>
        <div class="account-block">
          <div class="list-group"> <a class="list-group-item" href="/member/login">Login</a>
           <a class="list-group-item" href="register.html">Register</a> 
          <a class="list-group-item" href="forgetpassword.html">Forgotten Password</a> 
          <a class="list-group-item" href="#">My Account</a> 
          <a class="list-group-item" href="#">Address Book</a>
           <a class="list-group-item" href="#">Wish List</a> 
           <a class="list-group-item" href="#">Order History</a>
			<a class="list-group-item" href="download">Downloads</a>
 			<a class="list-group-item" href="#">Reward Points</a> 
			 <a class="list-group-item" href="#">Returns</a> 
 			<a class="list-group-item" href="#">Transactions</a>
  			<a class="list-group-item" href="#">Newsletter</a>
  			<a class="list-group-item last" href="#">Recurring payments</a> 
		 </div>
        </div>
      </div>
    </div> -->
    <div class="col-sm-9" id="content" style="margin-left: 131px">
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
            <h2>회원 가입</h2>
            <p><strong>계정 등록</strong></p>
            <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
            <a class="btn btn-primary" href="/member/join">회원가입</a></div>
        </div>
        <div class="col-sm-6">
          <div class="well">
            <h2>로그인</h2>
            <p><strong>I am a returning customer</strong></p>
            <form enctype="multipart/form-data" method="post" id = "loginForm" name="loginForm" action="/member/loginPost">
              <div class="form-group">
                <label for="input-email" class="control-label">아이디</label>
                <input type="text" class="form-control" id="member_id" placeholder="아이디" value="" name="member_id" onkeyup="enterkey();">
              </div>
              <div class="form-group">
                <label for="input-password" class="control-label">비밀번호</label>
                <input type="password" class="form-control" id="member_password" placeholder="비밀번호" value="" name="member_password" onkeyup="enterkey();">
               <div style="margin-top: 5px;">
	                <a href = "javascript:fnfindId()" id = "findId">아이디</a>/
	                <a href="javascript:fnfindPw()" id ="findPw">비밀번호 찾기</a>
                </div>
                </div>
                <div class = "checkbox icheck" style="float: left;">
                	<label>
                		<input type ="checkbox" name = "useCookie">아이디 저장
                   	</label>
                </div>
               	
              <input type="button" class="btn btn-primary" id = "loginBtn"  onkeyup="enterkey();"   value="로그인">
           
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    
    
    
    
    
    
    
    <%@include file="../include/footer.jsp"%>
    