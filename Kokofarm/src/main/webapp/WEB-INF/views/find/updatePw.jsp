<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	

$('#btn_update').on('click',function(){
	var p_pw =/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{5,20}$/;
	 var m_pw1 = $('#member_password').val();
	 var m_pw2 = $("#member_password2").val();
	 if(m_pw1!=m_pw2){
		 alert("입력한 비밀 번호가 다릅니다.");
	 }else if(!p_pw.test(m_pw1)){
		 alert("5~20자 영문, 숫자 섞어서 입력해주세요")
	 }
	 
	 alert("비밀번호가 변경 되었습니다.")
	document.updatePw.submit();
	  self.close();
})
})

</script>
</head>
<body>

<form action="/update/password" name = "updatePw" id="updatePw" method="post">
     <fieldset>
        <legend class="screen_out">새 비밀번호 수정</legend>
  
       <div class="box email">
            <label for="email">비밀번호 입력1</label>
            <input type="password" id="member_password" name="member_password" placeholder="5~20자 영문, 숫자포함 입력" size="40" />
            <br>
            <label for ="id">비밀번호 입력2</label>
            <input type="password" id = "member_password2" name = "member_password2" size="40"/>
        	<input type="hidden" name = "member_id" value="${member_id }">
        </div>
         
         <%-- <fieldset>
                    <legend>새 비밀번호 입력</legend>
                    <div class="form-group required">
                        <label for="input-password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="member_password" placeholder="5~20자 영문, 숫자 포함 입력." value="" name="member_password" size="40">
	                        	
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-confirm" class="col-sm-2 control-label">Password Confirm</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="member_password2" placeholder="암호확인" value="" name="member_password2" size="40">
                       		<input type="hidden" name="member_id" value="${member_id }">
                        </div>
                    </div>
                </fieldset> --%>
                
        <div class="box btn">
            <button type="button" id="btn_update">
                <i class="fa fa-envelope"></i>
                비밀번호 수정
            </button>
            <span> ${resultMsg }</span>
        </div>
        <!-- // .box.btn -->
    </fieldset>
</form>

</body>
</html>