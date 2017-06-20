<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/detail.css">

<script>
  

 $(function(){
	 //window.location.reload();
	 
	 $('#tab-auctionview').hide();
	 $('#tab-registerview').hide();
	 
	 $('#auctionA').on('click',function(){
		 $('#tab-auction').show();
	 });
	 
	 $('#subtitleP').hide();
	/*  $('#auctionA').mouseover(function(){
		 $('#subtitleP').show();
	 }); */
	 
	 $('#successcheck').on('click',function(){
		 $('#tab-auctionview').hide();
		 $('#tab-registerview').hide();
		 $('#tab-successcheck').show();
		
	 });
	 
	 $('#auctioncheck').on('click',function(){
		 $('#tab-registerview').hide();
		 $('#tab-successcheck').hide();
		 $('#tab-auctionview').show();
		 
	 });
	 
	$('#registercheck').on('click',function(){
		$('#tab-registerview').show();
		 $('#tab-successcheck').hide();
		 $('#tab-auctionview').hide();
	});
	
 })

 function over(){
	 $('#subtitleP').show();
 }
 
 function out(){
	 $('#subtitleP').hide();
 }

</script>
<div class="container">
	<div class="row">
		<div id="content" class="col-sm-9" style="margin-left: 120px;">

			<div class="productinfo-tab">
				<div class="nav">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-inquiry" data-toggle="tab">1:1문의</a></li>
						<li class="active"><a id="auctionA" href="#" data-toggle="tab" onmouseover="over()">경매</a></li>	
					</ul>
				</div>
			   <div style="margin-top: 6px;" onmouseleave="out()">
					<div id="subtitleP">
								 <p class="caption"><a id="auctioncheck" href="#" style="float: left; margin-left: 120px; margin-right: 10px;">입찰내역조회</a></p>
								 <p class="caption"><a id="successcheck" href="#" style="float: left; margin-right: 10px;">낙찰상품조회</a></p>
								 <c:if test="${login.seller_no !=null}">
								   <p class="caption"><a id="registercheck" href="#">등록상품조회</a></p>
								 </c:if>
								 
					</div>
				</div>
				<div class="tab-content">
				  <!-- 낙찰 상품 조회  및 결제 -->
					<div class="tab-pane active" id="tab-successcheck">
						<div class="cpt_product_description ">
							<!-- <div onmouseleave="out()">
							<div class="caption_box" id="subtitleP">
								 <p class="caption"><a id="auctioncheck" href="#" style="float: left; margin-left: 90px; margin-right: 10px;">경매내역조회</a></p>
								 <p class="caption"><a id="successcheck" href="#">낙찰상품조회</a></p>
							</div>
							</div> -->
							<!-- 구매자용 -->
							<section class="sub_top_section" >
								<h2 class="cate_title"><span style="font-weight: bold;">낙찰상품 조회 및 결제&nbsp;&nbsp;</span></h2>
							</section>

							<table class="view_board_table" style="text-align: center;">
								<colgroup>
									<col width="84">
									<col width="115">
									<col width="115">
									<col width="180">
									<col width="250">
									<col width="150"> 
									<col width="180">
									<col width="150">
									
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>낙찰번호</th>
										<th>입찰번호</th>
										<th>경매상품</th>
										<th>상품명</th>
										<th>낙찰가</th>
										<th>결제상태</th>
										<th>결제번호</th>
									
									</tr>
								</thead>

								<tbody>
									<c:forEach var="SuccessViewDetailVO" items="${successViewList}" 	varStatus="status">
									<input type="hidden" id="inquiry_content" class="inquiry_content" value="${SuccessViewDetailVO.success_no}">
									<input type="hidden" id="inquiry_no" class="inquiry_no" value="${SuccessViewDetailVO.tender_no}">
									
											<tr class="tit_tr user_tit_tr">
											    <c:set var="index" value="1"></c:set>
											    <td>${status.count}</td>
											    <td>${SuccessViewDetailVO.success_no}</td>
												<td>${SuccessViewDetailVO.tender_no}</td>
												<c:choose>
												  <c:when test="${SuccessViewDetailVO.pay_state eq null}">
												    <td><a class="thumbnail" href="../tender/tenderform?auction_no=${SuccessViewDetailVO.auction_no}&pay_state=null"><img src="/resources/files/attach/${SuccessViewDetailVO.auction_title_img }"></a></td>
												    <td><a href="../tender/tenderform?auction_no=${SuccessViewDetailVO.auction_no}&pay_state=null">${SuccessViewDetailVO.auction_name}</a></td>
												  </c:when>
												  <c:otherwise>
												    <td><a class="thumbnail" href="../tender/tenderform?auction_no=${SuccessViewDetailVO.auction_no}&pay_state=${SuccessViewDetailVO.pay_state } "><img src="/resources/files/attach/${SuccessViewDetailVO.auction_title_img }"></a></td>
												    <td><a href="../tender/tenderform?auction_no=${SuccessViewDetailVO.auction_no}&pay_state=${SuccessViewDetailVO.pay_state }">${SuccessViewDetailVO.auction_name}</a></td>
												  </c:otherwise>
												</c:choose>
												
												<td>${SuccessViewDetailVO.tender_price}</td>
												<c:choose>
													<c:when test="${SuccessViewDetailVO.pay_state eq null}">
														<td><div class="reply_check comp" style="width: 100px;">결제대기중</div></td>
													</c:when>
													<c:otherwise>
														<td><div class="reply_check comp" style="width: 100px;">결제완료</div></td>
													</c:otherwise>
												</c:choose>
												<c:choose>
												  <c:when test="${SuccessViewDetailVO.pay_state eq null}">
												    <td>
												    <form action="../tender/tenderpay" method="get">
												      <input type="hidden" name="member_id" value="${member_id}">
												      <input type="hidden" name="tender_no" value="${SuccessViewDetailVO.tender_no}">
												      <input type="hidden" name="auction_title_img" value="${SuccessViewDetailVO.auction_title_img}"> 
												      <input type="submit" value="결제하기">
												    </form>
												    </td>
												  </c:when>
												  <c:otherwise>
												    <td>${SuccessViewDetailVO.pay_state }</td>
												  </c:otherwise>
												</c:choose>
												<td id="product" class="tit_td" style="display: none;">${inquiry.product_name}</td>
												<td style="display: none;">${inquiry.member_id}</td>
												<td style="display: none;"><fmt:formatDate value="${inquiry.inquiry_date}" pattern="yyyy-MM-dd" /></td>
												
											</tr>
											<tr class="txt_tr reply_txt_tr">
												<td colspan="5" class="txt_td">
													<div class="reply_txt reply_user_txt" style="background: url(/resources/image/bu_qna_q.png) no-repeat 157px 20px;">
													${inquiry.inquiry_content}
													</div>
												<c:if test="${inquiry.inquiry_reply ne null}">
													<div class="reply_txt reply_admin_txt" style="background: url(/resources/image/bu_qna_a.png) no-repeat 157px 20px;">
													${inquiry.inquiry_reply}
													<div class="admin_info">
														<span class="write_date"><fmt:formatDate value="${inquiry.inquiry_replydate}" pattern="yyyy-MM-dd" /></span>
														</div>
													</div>
												</c:if>
												<c:if test="${inquiry.inquiry_reply eq null}">
												<button id="update" value="${status.count}" class="button_in update" onclick="update_inquiry();" style="margin-left: 20%">수정</button>
												<button id="delete" value="${status.count}" class="button_in delete">삭제</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							</div>
						</div>
	
		<!-- 경매 내역 조회 -->
		<div class="tab-pane active" id="tab-auctionview">
	        <div class="cpt_product_description ">
								<section class="sub_top_section">
									<h2 class="cate_title">
										<span style="font-weight: bold;">입찰 내역 조회&nbsp;&nbsp;</span>
									</h2>
								</section>
								<table class="view_board_table">
									<colgroup>
									<col width="84">
									<col width="150">
									<col width="150">
									<col width="150">
									<col width="300">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>경매번호</th>
											<th>입찰번호</th>
											<th>입찰가격</th>
											<th>입찰일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="TenderViewVO" items="${tenderViewList}" varStatus="status">
										    <c:set var="index" value="1"></c:set>
										    <c:choose>
											<c:when test="${TenderViewVO.auction_no == TenderViewVO.auction_no}">
											<tr  class="tit_tr user_tit_tr">
												<td>${status.count}</td>
												<td>${ TenderViewVO.auction_no }</td>
												<td>${TenderViewVO.tender_no}</td>
												<td>${TenderViewVO.tender_price}</td>
												<td>${TenderViewVO.tender_date}</td>
												
											</tr>
											</c:when>
											<c:otherwise>
											 <tr class="tit_tr user_tit_tr" style="background: #EBE8FF;">
												<td>${status.count}</td>
												<td>${ TenderViewVO.auction_no }</td>
												<td>${TenderViewVO.tender_no}</td>
												<td>${TenderViewVO.tender_price}</td>
												<td>${TenderViewVO.tender_date}</td>
					
											</tr>
											
											</c:otherwise>
											</c:choose>
											<tr class="txt_tr reply_txt_tr" style="display: none;">
												<td colspan="5" class="txt_td">
													<div class="reply_txt reply_user_txt" style="background: url(/resources/image/bu_qna_q.png) no-repeat 157px 20px;">
													${inquiry_s.inquiry_content}
													</div>
												<c:if test="${inquiry_s.inquiry_reply eq null}">
													<button id="update" value="" class="button_in"  style="margin-left: 20%" onclick="popup_register('${inquiry_s.inquiry_no}')">답변</button>
												</c:if>
												
												<c:if test="${inquiry_s.inquiry_reply ne null}">
													<div class="reply_txt reply_admin_txt" style="background: url(/resources/image/bu_qna_a.png) no-repeat 157px 20px;">
													${inquiry_s.inquiry_reply}
													<div class="admin_info">
														<span class="write_date"><fmt:formatDate value="${inquiry.inquiry_replydate}" pattern="yyyy-MM-dd" /></span>
														</div>
													</div>
													<button id="popup_register" class="button_in popup_register" style="margin-left: 20%" onclick="popup_register('${inquiry_s.inquiry_no}')">답변수정</button>
											</c:if>
											</td>
										</tr>
										</c:forEach>
								</table>
	
	
	
						</div>
	
						<div>
							<!--  tab1 -->
						</div>
	
					</div>
					
					
		<!-- 등록 상품 조회-->
		<div class="tab-pane active" id="tab-registerview">
	        <div class="cpt_product_description ">
								<section class="sub_top_section">
									<h2 class="cate_title">
										<span style="font-weight: bold;">등록 상품 조회&nbsp;&nbsp;</span>
									</h2>
								</section>
								<table class="view_board_table">
									<colgroup>
									<col width="84">
									<col width="120">
									<col width="150">
									<col width="200">
									<col width="200">
									<col width="150">
									</colgroup>
									<thead>
										<tr>
										    <th>번호</th>
											<th>경매번호</th>
											<th>등록상품</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>경매결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="AuctionViewVO" items="${sellerlist}" varStatus="status">
										    <c:set var="index" value="1"></c:set>
								
											<tr  class="tit_tr user_tit_tr">
												<td>${status.count}</td>
												<td>${ AuctionViewVO.auction_no }</td>
												<td><a href="../tender/tenderform?auction_no=${AuctionViewVO.auction_no }">${AuctionViewVO.auction_name}</a></td>
												<td>${AuctionViewVO.start_date}</td>
												<td>${AuctionViewVO.end_date}</td>
												<td>${AuctionViewVO.auction_result }</td>
												
											</tr>
											
											<tr class="txt_tr reply_txt_tr" style="display: none;">
												<td colspan="5" class="txt_td">
													<div class="reply_txt reply_user_txt" style="background: url(/resources/image/bu_qna_q.png) no-repeat 157px 20px;">
													${inquiry_s.inquiry_content}
													</div>
												<c:if test="${inquiry_s.inquiry_reply eq null}">
													<button id="update" value="" class="button_in"  style="margin-left: 20%" onclick="popup_register('${inquiry_s.inquiry_no}')">답변</button>
												</c:if>
												
												<c:if test="${inquiry_s.inquiry_reply ne null}">
													<div class="reply_txt reply_admin_txt" style="background: url(/resources/image/bu_qna_a.png) no-repeat 157px 20px;">
													${inquiry_s.inquiry_reply}
													<div class="admin_info">
														<span class="write_date"><fmt:formatDate value="${inquiry.inquiry_replydate}" pattern="yyyy-MM-dd" /></span>
														</div>
													</div>
													<button id="popup_register" class="button_in popup_register" style="margin-left: 20%" onclick="popup_register('${inquiry_s.inquiry_no}')">답변수정</button>
											</c:if>
											</td>
										</tr>
										</c:forEach>
								</table>
	
	
	
						</div>
	
						<div>
							<!--  tab1 -->
						</div>
	
					</div>
					
					
					
					<!-- cpt_container_end -->
	
	
	
				</div>
			</div>
		</div>
	</div>
</div>



<%@include file="../include/footer.jsp"%>