<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/order_detailview/css/order_detailview.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		$(".confirm_btn").hover(function(){
			$(".confirm_btn").css('background-color','white').css('color','#38a9a5');
		},function(){
			$(".confirm_btn").css('background-color','#38a9a5').css('color','white');
		});
		
		$(".confirm_btn").on('click',function(){
			window.close();
		});
		
	})
</script>	
<body>
	<div class="container">
		<div class="title_container">
			<strong id="order_date">주문일</strong><strong id="order_date_info">${date}</strong>
			<strong id="order_no">주문번호</strong><strong id="order_no_info">${order_finish_no}</strong>
			<span class="confirm_btn">닫기</span>
		</div>
		<div class="tb_container">
			<table class="order_detail">
			<colgroup>
				<col width="104">
				<col width="100">
				<col width="350">
				<col width="100">
			</colgroup>
			<tr>
				<th>번호</th>
				<th colspan="2">제품<span id="comment">(이미지를 클릭하면 해당 제품으로 이동합니다.)</span></th>
				<th>배송비</th>
			</tr>
			<c:forEach var="detail" items="${list}" varStatus="status">	
			<tr>
				<td id="count">${status.count }</td>
				<td><a href="#" onclick="javascript:opener.location.href='/product/detail_product?product_no=${detail.product_no}'; self.close();" >
					<img src="/resources/files/attach/${detail.product_mainimage}" alt="/resources/files/attach/${detail.product_mainimage}" id="img"></a>
				</td>
				<td>
					<strong id="product_name">제품명</strong><strong id="product_name_info">${detail.orderfinish_product_name}</strong><br>
					<strong id="product_amount">총 수량</strong><strong id="product_amount_info">${detail.orderfinish_product_amount}</strong><br>
					<strong id="product_price">총 가격</strong><strong id="product_price_info"><fmt:formatNumber value="${detail.orderfinish_total_price}" type="number"/>원</strong>
				</td>
				<td id="product_delivery">
					<strong><fmt:formatNumber value="${detail.orderfinish_delivery_price}" type="number"/>원</strong>
				</td>
			</tr>
			</c:forEach>
			</table>
		</div>	
		
		<strong id="customer">받는사람 정보</strong>
		<div class="customer_container">
			<strong id="member_name">수령인</strong>
			<span id="member_name_info">${membername}</span><br>
			<strong id="member_phone">핸드폰</strong>
			<span id="member_phone_info">${phonenumber}</span><br>
			<strong id="member_addr">주소</strong>
			<span id="member_addr_info">${memberaddr}</span><br>
		</div>
		
		<strong id="pay">결제정보</strong>
		<div class="pay_container">
			<div class="pay_info">
				<strong id="paysort">결제수단</strong><br>
				<span id="payment">${payment}</span>
			</div>
			<div class="price_info">
				<strong>총상품가격</strong>
				<strong id="pay_t"><fmt:formatNumber value="${total}" type="number"/>원</strong><br>
				<strong>배송비</strong>
				<strong id="pay_d"><fmt:formatNumber value="${delivery}" type="number"/>원</strong><br>
				<strong>할인내역</strong>
				<strong id="pay_m"><fmt:formatNumber value="${mileage}" type="number"/>원</strong><br>
				<strong>총가격</strong>
				<strong id="pay_f"><fmt:formatNumber value="${finish}" type="number"/>원</strong><br>
			</div>
		</div>
		
	</div>
</body>
</html>