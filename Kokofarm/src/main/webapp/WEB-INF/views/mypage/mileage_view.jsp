<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
마일리지 뷰
<h1>현재 포인트 : ${current} </h1>
	<table>
		<tr>
			<th>번호</th>
			<th>주문번호</th>
			<th>적립</th>
			<th>사용</th>
			<th>포인트</th>
			<th>일자</th>
		</tr>
	<c:forEach var="list" items="${list }" varStatus="status">
		<tr>
			<td>${status.count }</td>
			<td><a href="#">${list.orderfinish_no }</a></td>
			<td>${list.mileage_saving }</td>
			<td>${list.mileage_use }</td>
			<td>${list.mileage_total }</td>
			<td>
				<fmt:formatDate value="${list.mileage_date }" pattern="yyyy-MM-dd hh-mm"/>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>