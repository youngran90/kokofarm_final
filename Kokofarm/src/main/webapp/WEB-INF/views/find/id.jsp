<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/sendMail/id" id="findForm" method="post">
    <fieldset>
        <legend class="screen_out">아이디 찾기 폼</legend>
 
        <div class="box email">
            <label for="email">이메일</label>
            <input type="text" id="member_email" name="member_email" autofocus autocomplete="off" required />
        </div>
        <!-- // .box.email -->
 
         <!-- // .box.captcha -->
 
        <div class="box btn">
            <button type="submit" class="btn join">
                <i class="fa fa-envelope"></i>
                이메일 전송
            </button>
            <span> ${resultMsg }</span>
        </div>
        <!-- // .box.btn -->
    </fieldset>
</form>
</body>
</html>