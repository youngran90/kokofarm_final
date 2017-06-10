<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
  
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
			
			var id = $("#member_id", opener.document).val();
			$("#userId").val(id);
})

 /*     function getXMLHttpRequest(){


        var httpRequest = null;
        
        // httpRequest 객체 생성
            var httpRequest = null;
        
            if(window.ActiveXObject){
                try{
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
                } catch(e) {
                    try{
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e2) { httpRequest = null; }
                }
            }
            else if(window.XMLHttpRequest){
                httpRequest = new window.XMLHttpRequest();
            }
            return httpRequest;    
} */

// 회원가입창의 아이디 입력란의 값을 가져온다.

 function idCheck(){
	
	var id = $("#userId").val();
	 var eid = /^[a-z0-9A-Z_]{4,15}$/; 
	 if(!eid.test(id)){ 
		alert("4~15글자 한글 및 특수문자는 아이디로 사용 할 수 없습니다.");
	
	 }else{
		 $.ajax({
			 type : "post",
			 url : "/member/id_check",
			 data : {userid:id},
			 dataType : "text",
			 success : function(result){
				 if(result==0){
					 alert("사용 할 수 없는 아이디 입니다.");
					 document.getElementById("cancelBtn").style.visibility='visible';
			            document.getElementById("useBtn").style.visibility='hidden';
			            document.getElementById("msg").innerHTML ="";
				 }else if(result ==1){
					 document.getElementById("cancelBtn").style.visibility='hidden';
			            document.getElementById("useBtn").style.visibility='visible';
			            document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
					 					 
				 }
				 
			 }
			 
		 })
		 
	 }
	 
	} 


// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue(){
    // 중복체크 결과인 idCheck 값을 전달한다.
    $("#idDuplication",parent.opener.document).val("idCheck")
   
    // 회원가입 화면의 ID입력란에 값을 전달
    var id = $("#userId").val();
    $("#member_id",parent.opener.document).val(id);
        
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
		<b><font size = "4" color ="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id = "chk">
			<form id = "checkForm">
				<input type = "text" name = "idinput" id ="userId">
				<input type="button" value="중복확인" onclick="idCheck()">
				
			</form>
			<div id = "msg"></div>
			<br>
			<input id = "cancelBtn" type = "button" value ="취소" onclick="window.close()"><br>
			<input id = "useBtn" type = "button" value = "사용하기" onclick="sendCheckValue()">
					
		</div>
		</div>


</body>
</html>