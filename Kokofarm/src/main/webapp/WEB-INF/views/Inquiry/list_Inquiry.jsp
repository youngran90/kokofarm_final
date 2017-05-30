<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0" width="1000px;">
				<tr align="center" style="width: 200px; height: 50px;">
					<td>글번호</td>
					<td>상품명</td>					
					<td>문의자</td>
					<td>문의일</td>
					<td>답변상태</td>
				</tr>
			
				
		<c:forEach var="inquiry" items="${inquirylist}" varStatus="status">
				<tr align="center">			
					<td>${status.count}</td>
					<td id="product">${inquiry.product_name}</td>
					<td>${inquiry.member_id}</td>
					<td><fmt:formatDate value="${inquiry.inquiry_date}" pattern="yyyy년MM월dd일"/></td>
					
					<c:choose>
						<c:when test="${inquiry.inquiry_reply eq null}">
						<td><input type="button" value="답변대기중" onclick="location.href='detailInquiry.Inquiry?inquiry_no=${inquiry.inquiry_no}'"/></td>
						</c:when>
						<c:otherwise>
						<td><input type="button" value="답변완료" onclick="location.href='detailInquiry.Inquiry?inquiry_no=${inquiry.inquiry_no}'"/></td>
						</c:otherwise>
						</c:choose>
				</tr>
		</c:forEach>	


			<tr height="30">
				<td colspan="5" align="center">
				<input type="button" value="상품리스트" onclick="location.href='golistproductAction.product'">&nbsp;&nbsp; 
				<input type="button" value="취소">&nbsp;&nbsp; 
				</td>
			</tr>
		</table>
		
</body>
</html>