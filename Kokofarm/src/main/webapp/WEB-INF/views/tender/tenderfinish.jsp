<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코팜::상품입찰완료</title>
<!-- <style type="text/css">
  #firstP{
    font-weight: bold;
    font-size: 20px;
    text-align: center;
    margin-bottom: 20px;
  }
  #secondP{
  	font-weight: bold;
    font-size: 30px;
    text-align: center;
    margin-bottom: 20px;
  }
  #firstDiv{
    margin-top: 150px;
    margin-bottom: 150px;
  }
  #btn{
    margin-left: 650px;
    background: #287a78;
	color: white;
	border: 1px solid #287a78;
	padding: 7px;
  }

</style> -->
</head>
<body>
<%-- <div id = "header">
<jsp:include page="../Kokofarm_Main/mainheader.jsp" flush="false"></jsp:include>
</div> --%>
<div id="firstDiv">

<p id="firstP">경매번호 : ${tender.auction_no } </p>
<p id="secondP">${tender.member_id }님 입찰이 완료되었습니다.</p>
<!-- <input id="btn" type="button" value="돌아가기" onclick="fn_back()"> -->
<!-- <input id="btn" type="button" value="돌아가기" onclick="location.href='reg_list.reg'"> -->
<input id="btn" type="button" value="돌아가기" onclick="location.href='tenderform'">
</div>
<%-- <div id = "footer">
   <jsp:include page="../Kokofarm_Main/mainfooter.jsp" flush="false"></jsp:include>
   </div> --%>
</body>
</html>