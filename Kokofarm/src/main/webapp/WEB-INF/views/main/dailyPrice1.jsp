<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/detail.css">
<title>Insert title here</title>
</head>
<body>

<img alt="" src="/resources/css/m_tab05_o.gif">
<table class="view_board_table" style="font-size: 14px;">
<colgroup>
			<col width="60">
			<col width="100">
			<col width="50">
			<col width="70">
			<col width="70">
			<col width="70">
		</colgroup>
  	<thead>
  		<tr>
	  		<th>품목명</th>
	  		<th>품종명</th>
	  		<th>상태</th>
	  		<th>일자 <span style="font-size: 10px">(${today})</span></th>
	  		<th>1일전 일자</th>
	  		<th>1주일전 일자</th>
  		</tr>
  	</thead>
  	</table>

<marquee id="scroller" direction="up" scrollamount="2" height="84"  onmouseover="this.stop();" onmouseout="this.start();">
<table class="view_board_table" style="font-size: 14px;">
  		<colgroup>
			<col width="60">
			<col width="100">
			<col width="50">
			<col width="70">
			<col width="70">
			<col width="70">
		</colgroup>
  	<tbody>
  		<c:forEach var="list" items="${price_list}" >
  		<tr class="tit_tr user_tit_tr">
  				<td>${list.item_name} </td>
  				<td>${list.kind_name} </td>
  				<td>${list.rank} </td>
  				<td>${list.dpr1} </td>
  				<td>${list.dpr2} </td>
  				<td>${list.dpr3} </td>
  				</tr>
  		</c:forEach>
  	</tbody>
  </table>
  </marquee>

</body>
</html>