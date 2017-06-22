<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<script type="text/javascript">
$(function(){
	
	$("#btn_auth").on("click",function(){
		var num = $("#authnum").val();		
			$.ajax({
			type : "get",
			url : "/find/authPw",
			data : {authNum : num},
			dataType : "text",
			error : function(error){
				alert("인증번호를 입력하세요");
			},
			success : function(result){
				if (result == 1){
				document.updateForm.submit();
				
			}else{
				alert("인증번호가 다릅니다.")
				}
			}
			
		});
		
	});
		
		
	});
	
	
	function onlyNumber(obj) {
	    $(obj).keyup(function(){
	         $(this).val($(this).val().replace(/[^0-9]/g,""));
	         $(this).append();

	    }); 
	}
	
	</script>
	</head>
<body>
<form action="/update/passwordForm" name = "updateForm" method="post">
	<input type = "hidden" id = id  name ="member_id" value="${member_id }">
</form>


<form action="/sendMail/password" id="findForm" method="post">
    <fieldset>
        <legend class="screen_out">비밀번호 찾기 폼</legend>
 
        <div class="box email">
            <label for="email">이메일</label>
            <input type="text" id="member_email" name="member_email" autofocus autocomplete="off" required /></br>
            <label for ="id">아이디</label>
            <input type="text" id = "member_id" name = "member_id" autofocus autocomplete = "off" required />
        </div>
        <!-- // .box.email -->
 
         <!-- // .box.captcha -->
 
        <div class="box1 btn1">
            <button type="submit" class="btn1 join">
                 비밀번호 찾기
            </button>
            <span> ${resultMsg }</span>
        </div>
        <!-- // .box.btn -->
    </fieldset>
</form>
<div>
<h5> 인증번호를 입력하세요</h5>
		<div class="container">
				<input type = "text" name = "authnum" id = "authnum" onkeydown="onlyNumber(this)" maxlength="6"><br />
				<input type = "button" id = "btn_auth" class="btn btn-info" value = "입력" >
		</div>

</div>

</body>
</html>