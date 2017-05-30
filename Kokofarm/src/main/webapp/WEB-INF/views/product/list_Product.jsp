<%@page import="kokofarm.product.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.10.2.js></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		

<div id="body" style="margin-top: 50px; margin-left: 5%;">
	<h2>상품리스트 출력</h2>
				<div style="margin-left: 60%; margin-bottom: 50px; margin-bottom: 50px;">
				<form action="listproductAction.product" method="post" name="searchForm">
					 <input type="hidden" name="temp" value="temp"></input>
					 <select id="searchOption" name="searchOption" style="height: 20px; width: 80px;" s>
					 	<option  value="product_name">제목</option>
					 	<option  value="seller_no">작성자</option>
					 </select>
					 <input type="text" id="searchText" name="searchText" size="20" value="${listModel.searchText }">
					 <input type="submit" value="검색">
					<!--  <input type="button" value="전체보기"> -->
				</form>
			</div>
			
	<div style="clear: both;">
		<ul>
			<c:forEach var="product" items="${list}">
			<li style="margin: 5px 10px 5px 10px; display: inline-block;  float: left;list-style: none">
				<table style="border: solid #eaeaea 3px; width: 300px; height: 400px;">
					<tr >
						<td><c:if test="${product.product_mainimage != null }">
							<c:set var="pattern" value="${fn:substring(product.product_mainimage, fn:length(product.product_mainimage)-4, fn:length(product.product_mainimage))}"></c:set>
							<c:choose>
								<c:when test="${pattern eq '.jpg' or pattern eq '.gif'}">
									<a href ="detailProdutAction.product?product_no=${product.product_no}" style="text-decoration: none"" ><img style="width: 90%; height: 220px; margin-left:5%; border:solid black 1px;"  src="../upload/small_${product.product_mainimage}"></a>
								</c:when>
								<c:otherwise>
									<c:out value="NO IMAGE"></c:out>
								</c:otherwise>
							</c:choose>
						</c:if></td>
					</tr>
					<tr>
						<td><a href="detailProdutAction.product?product_no=${product.product_no}" style="text-decoration: none; margin-left: 10px; color: #352f29;font-size: 19px; font-family: Tahoma; ">${product.product_name}</a></td>
					</tr>
					<tr>
						<td><span style="margin-left: 10px;color: #38a9a5; font-weight: bold;font-size: 19px; font-family: Tahoma;">★★★★★  65건</span></td>
					</tr>
					<tr>
						<td><span style="margin-left: 10px;color: #403324; font-weight: bold;font-size: 13px; font-family: Tahoma;">${product.product_unit}</span></td>
					</tr>
					<tr>
						<td><span style="margin-left: 10px;color: #403324; font-weight: bold;font-size: 13px; font-family: Tahoma;">
						<fmt:formatNumber value="${product.product_price}" pattern="###,###,###"/>원</span></td>
					</tr>
				</table>
			</c:forEach>
		</ul>
	</div>
	
			<div style="clear: both; margin-left: 50%; margin-top: 36%; " >
					
				
				
				<a href="listproductAction.product">리스트</a>		
		</div>
		
		  
		</body>
				
</html>

