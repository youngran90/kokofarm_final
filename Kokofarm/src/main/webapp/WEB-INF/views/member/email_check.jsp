<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복 체크</title>
  
 <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
   </style>
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
<script type="text/javascript"> 
$(function(){
			
			var email = $("#member_email", opener.document).val();
			$("#member_email").val(email);
})

// 회원가입창의 아이디 입력란의 값을 가져온다.

 function emailCheck(){
	
	var email = $("#member_email").val();
	var eemail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 if(!eemail.test(email)){ 
		alert("해당 형식의 이메일은 사용 할 수 없습니다.");
	
	 }else{
		 $.ajax({
			 type : "post",
			 url : "/member/email_check",
			 data : {member_email:email},
			 dataType : "text",
			 success : function(result){
				 if(result==0){
					 alert("사용 할 수 없는 이메일 입니다.");
					 document.getElementById("cancelBtn").style.visibility='visible';
			            document.getElementById("useBtn").style.visibility='hidden';
			            document.getElementById("msg").innerHTML ="사용 할 수 없는 이메일";
				 }else if(result ==1){
					 document.getElementById("cancelBtn").style.visibility='hidden';
			            document.getElementById("useBtn").style.visibility='visible';
			            document.getElementById("msg").innerHTML = "사용 가능한 이메일 입니다.";
					 					 
				 }
				 
			 }
			 
		 })
		 
	 }
	 
	} 


// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue(){
    // 중복체크 결과인 emailCheck 값을 전달한다.
    $("#emailDuplication",parent.opener.document).val("emailCheck")
   
    // 회원가입 화면의 email입력란에 값을 전달
    var email = $("#member_email").val();
    $("#member_email",parent.opener.document).val(email);
        
    if (opener != null) {
        opener.chkForm = null;
        self.close();
    }    
}    




</script>

</head>
<body>

	<div id = "wrap">
		<br>
		<b><font size = "4" color ="gray">이메일 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id = "chk">
			<form id = "checkForm">
				<input type = "text" name = "emailInput" id ="member_email">
				<input type="button" value="중복확인" onclick="emailCheck()">
				
			</form>
			<div id = "msg"></div>
			<br>
			<input id = "cancelBtn" type = "button" value ="취소" onclick="window.close()"><br>
			<input id = "useBtn" type = "button" value = "사용하기" onclick="sendCheckValue()">
					
		</div>
		</div>


</body>
</html>