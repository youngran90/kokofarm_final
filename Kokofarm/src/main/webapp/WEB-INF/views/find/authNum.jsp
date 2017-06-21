<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnum.value){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(form.authnum.value !=authNum){
			alert("인증번호가 맞지 않습니다. 다시 입력해주세요");
			form.authnum.value="";
			return false;
		}else if(form.authnum.value ==authNum) {
			alert("인증완료");
			//부모창에 인증완료 띄우기
			self.close();
		}
		
	}

</script>

</head>
<body>
	<h5> 인증번호를 입력하세요.</h5>
		<div class="container">
			<form method="post" name ="authenform" onsubmit="return check();"> 
				<input type = "text" name = "authnum"><br /><br />
				<input type = "submit" class="btn btn-info" value = "submit">
			</form>
		</div>

</body>
</html>