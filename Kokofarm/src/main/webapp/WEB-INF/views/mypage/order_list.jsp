<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/detail.css">

<style>
h2 {
	display: block;
	font-size: 1.5em;
	font-weight: bold;
}
	
</style>
<script>
 

</script>

<div class="container">
<ul class="breadcrumb">
    <li><a href="/"><i class="fa fa-home"></i></a></li>
    <li><a href="/mypage/order_list">마이페이지/주문배송정보</a></li>
  </ul>
	<div class="row">
	 <%@include file="./Mypage.jsp"%>
		<div id="content" class="col-sm-9">


            <div class="cpt_product_description ">
							
							<section class="sub_top_section">
								<h2 class="cate_title"><span>구매내역&nbsp;&nbsp;</span></h2>
							</section>

							<table class="view_board_table">
								<colgroup>
									<col width="50">
									<col width="152">
									<col width="630">
									<col width="162">
									<col width="140">
									<col width="100">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>상품이미지</th>
										<th>주문 정보</th>
										<th>주문 날짜</th>
										<th>상태</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="list" items="${list}" 	varStatus="status">
											<tr class="tit_tr user_tit_tr">
												<td>${pageMaker.start + status.index}</td>
												<td><img src="/resources/files/attach/${list.product_mainimage}" style="width: 100px; height: 100px;"></td>
												<td class="txt_td">
													<b>주문상품 : </b> ${list.orderfinish_product_name}<br>
												    <b> 주문수량 : </b> ${list.orderfinish_product_amount}<br>
												<b>결제금액 : </b><fmt:formatNumber value="${list.orderfinish_total_price}" pattern="###,###원" />
												<td><fmt:formatDate value="${list.orderfinish_date}" pattern="yyyy-MM-dd" /></td>
												<td>배송완료</td>
											</tr>
									</c:forEach>
								</tbody>
					</table>
					
      
      <div class="category-page-wrapper">
        <div class="pagination-in" style="margin-left: 40%">
         <ul class="pagination" >
         <c:if test="${pageMaker.page eq 0}">
			<li><a href="/mypage/order_list?page=1">처음</a></li>
			</c:if>
			<c:if test="${pageMaker.prev}">
				<li><a href="/mypage/order_list?page${pageMaker.prev}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.lastPage}" var="idx">
				 <li <c:out value="${pageMaker.page == idx?'class =active':''}"/>>
					 <a href="/mypage/order_list?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="/mypage/order_list?page=${pageMaker.endPage +1}">&raquo;</a></li>
				</c:if>
				         <c:if test="${pageMaker.page eq 0}">
				<li><a href="/mypage/order_list?page=${pageMaker.lastPage}">마지막</a></li>
				</c:if>
			</ul>
        </div>
      </div>
	
					</div>						
	
						<div>
							<!--  tab1 -->
						</div>
					</div>
					<!-- cpt_container_end -->
	</div>
	</div>
		
		

  <%@include file="../include/footer.jsp"%>


