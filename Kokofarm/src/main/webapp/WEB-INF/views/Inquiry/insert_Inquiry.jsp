<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.10.2.js></script>
<script type="text/javascript">
function send(){
	var product_no = $("#product_no").val();
	var product_name = $("#product_name").val();
	var member_id = $("#member_id").val();
	var inquiry_content = $("#inquiry_content").val();
	var seller_no = $("#seller_no").val();
	
	if(inquiry_content == '' || product_no == ''){
		alert("빈칸을 입력해주세요");
	}else{
		$.ajax({
			type: "post",
			url:   "InsertInquiryAction.Inquiry",
	        data: {"product_no":product_no,
	        		   "product_name":product_name,
	        		   "member_id":member_id,
	        		   "inquiry_content":inquiry_content,
	        		   "seller_no":seller_no
	        		},
	        success: function (data) {
	        	alert("상품문의가 정상적으로 요청되었습니다.");
	        	window.close();
	        },
	        error: function (data) {
	            console.log('Error:', data);
	            alert("오류");
	        }
		})
	}
	
}
</script>
</head>
<body>

<form action="InsertInquiryAction.Inquiry">
<input type="hidden" name="product_no" id="product_no" value="${product_no }">
<input type="hidden" name="seller_no" id="seller_no" value="${seller_no}">
<table border="1" cellpadding="0" cellspacing="0" style="border: solid #eaeaea 1px;">
			<tr height="30" align="center">
				<td width="200">문의자</td>
				<td width="170">
				<input type="text" name="member_id" id="member_id"
					size="10" value="${member_id }" disabled></td>
			</tr>

			<tr height="30" align="center">
				<td width="200">문의상품</td>
				<td width="170">
				<input type="text" name="product_name" size="10" id="product_name" value="${product_name }" disabled></td>
			</tr>

			<tr height="30" align="center">
				<td width="200">문의글</td>
				<td width="170"> <textarea name="inquiry_content" id="inquiry_content" cols="40" rows="8"></textarea></td>
			</tr>


			<tr height="30">
				<td colspan="4" align="center">
				<input type="button"value="문의글보내기" onclick="send();">&nbsp;&nbsp; 
				<input type="button" value="취소" onclick="self.close();">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>