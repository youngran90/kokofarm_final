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
    <li><a href="/product/product_register_list">마이페이지/상품 등록 리스트</a></li>
  </ul>
	<div class="row">
	 <%@include file="./Mypage.jsp"%>
		<div id="content" class="col-sm-9">


            <div class="cpt_product_description ">
							
							<section class="sub_top_section">
								<h2 class="cate_title"><span>상품 등록 내역&nbsp;&nbsp;</span></h2>
							</section>

							<table class="view_board_table">
								<colgroup>
									<col width="50">
									<col width="152">
									<col width="580">
									<col width="152">
									<col width="152">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>상품이미지</th>
										<th>상품 정보</th>
										<th>남은 수량</th>
										<th>등록일</th>
										
									</tr>
								</thead>

								<tbody>
									<c:forEach var="list" items="${product}" 	varStatus="status">
											<tr class="tit_tr user_tit_tr">
												<td>${pageMaker.start + status.index}</td>
												<td><a href="/product/detail_product?product_no=${list.product_no}"><img src="/resources/files/attach/${list.product_mainimage}" style="width: 100px; height: 100px;"></a></td>
												<td class="txt_td">
													<b>상품명 : </b> ${list.product_name}<br>
												    <b>단위 : </b> ${list.product_unit} ${list.unit}<br>
												<b>가격 단가 : </b><fmt:formatNumber value="${list.product_price}" pattern="###,###원" />
												<td><b>총수량 :</b> ${list.product_total}</td>
												<td><fmt:formatDate value="${list.product_uploaddate }" pattern="yyyy-MM-dd" /></td>
											</tr>
									</c:forEach>
								</tbody>
					</table>
					
		<div class="category-page-wrapper">
        <div class="pagination-in" style="margin-left: 40%">
         <ul class="pagination" >
			<li><a href="/product/product_register_list?page=1">처음</a></li>
			<c:if test="${pageMaker.prev}">
				<li><a href="/product/product_register_list?page${pageMaker.prev}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.lastPage}" var="idx">
				 <li <c:out value="${pageMaker.page == idx?'class =active':''}"/>>
					 <a href="/product/product_register_list?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="/product/product_register_list?page=${pageMaker.endPage +1}">&raquo;</a></li>
				</c:if>
				<li><a href="/product/product_register_list?page=${pageMaker.lastPage}">마지막</a></li>
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


