<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	session.getAttribute("Inquiry");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	


	<div id="body">

		<form action="InsertInquiryReply.Inquiry">
			<input type="hidden" name="inquiry_no" value="${Inquiry.inquiry_no}" />
			<input type="hidden" name="product_no" value="${Inquiry.product_no}" />
			<table border="1" cellpadding="0" cellspacing="0" width="800px;"
				style="margin-left: 10%;">
				<tr>
					<td>상품명</td>
					<td>${Inquiry.product_name}</td>
				</tr>

				<tr>
					<td>문의자</td>
					<td>${Inquiry.member_id}</td>
				</tr>

				<tr>
					<td>문의일</td>
					<td><fmt:formatDate value="${Inquiry.inquiry_date}"
							pattern="yyyy년MM월dd일" /></td>
				</tr>


				<tr height="100px;">
					<td>문의내용</td>
					<td>${Inquiry.inquiry_content}</td>
				</tr>

				<tr height="500px;">
					<td>답변내용</td>
					<td><textarea name="inquiry_reply" id="inquiry_reply"
							cols="50" rows="30">[re]: ${Inquiry.inquiry_reply}</textarea></td>
				</tr>

				<tr height="30">
					<td colspan="5" align="center"><input type="submit"
						value="작성완료">&nbsp;&nbsp; <input type="button"
						value="리스트보기"
						onclick="location.href='ListInquiryAction.Inquiry?inquiry_no=${Inquiry.inquiry_no}'">&nbsp;&nbsp;
						<input type="button" value="취소">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>

	

</body>
</html>