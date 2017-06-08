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
    
 
    
    
    
    <div class="container">
  <ul class="breadcrumb">
    <li><a href="#">Account</a></li>
    <li><a href="login.html">Login</a></li>
  </ul>
  <div class="row">
    <div class="col-sm-3 hidden-xs column-left" id="column-left">
      <div class="column-block">
        <div class="columnblock-title">Account</div>
        <div class="account-block">
          <div class="list-group"> <a class="list-group-item" href="login.html">Login</a>
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
    </div>
    <div class="col-sm-9" id="content">
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
            <form enctype="multipart/form-data" method="post" action="/member/loginPost">
              <div class="form-group">
                <label for="input-email" class="control-label">아이디</label>
                <input type="text" class="form-control" id="member_id" placeholder="아이디" value="" name="member_id">
              </div>
              <div class="form-group">
                <label for="input-password" class="control-label">비밀번호</label>
                <input type="password" class="form-control" id="member_password" placeholder="비밀번호" value="" name="member_password">
                <a href="forgetpassword.html">암호 찾기</a></div>
                <div class = "checkbox icheck" style="float: left;">
                	<label>
                		<input type ="checkbox" name = "useCookie">아이디 저장
                   	</label>
                </div>
               	
              <input type="submit" class="btn btn-primary" id = "loginBtn" value="로그인">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    
    
    
    
    
    
    
    <%@include file="../include/footer.jsp"%>
    