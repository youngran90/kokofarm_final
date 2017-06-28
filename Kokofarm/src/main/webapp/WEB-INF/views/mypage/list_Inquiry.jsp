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
 function popup_register(inquiry_no){
	window.open("/mypage/Insert_inquiry_reply?inquiry_no=" + inquiry_no , "insert_inquiry_reply","width=500,height=600");
} 
 
$(function(){
	$('.tit_tr').click(function (){
		if (!$(this).data('click')){
			$(this).data('click',1).next('.txt_tr').show();
		}else{
			$(this).data('click',0).next('.txt_tr').hide();
	}
	});

	var doubleSubmitFlag = true;
	$(".update").on("click", function(){
	var index =$(this).attr("value");
		 if(doubleSubmitFlag){
				var inquiry_content = $(".inquiry_content").eq(index-1).val();
				var inquiry_no = $(".inquiry_no").eq(index-1).attr("value");
				$(".reply_user_txt").eq(index-1).html('<textarea  rows="5" cols="60" id="inquiry_contents" size="500"  style="resize:none;">'+ inquiry_content+'</textarea><button id="update_Re" class="button_in" value="'+inquiry_no+'" onclick="update_Re()">수정완료</button> ');
				doubleSubmitFlag = false;
		    }else{
		        return false;
		    }
	})
	
	
	$(".delete").on("click", function(e){
	var index =$(this).attr("value");
	var inquiry_no = $(".inquiry_no").eq(index-1).attr("value");
	if (confirm("문의글을 삭제하시겠습니까??") == true){    //확인
		
		$.ajax({
			type : "post",
			url : "/mypage/inquiry_delete",
			data : {
				"inquiry_no" : inquiry_no
			},
			success : function(data) {
				location.reload();
				alert("해당글이 삭제되었습니다.");
				},
				error : function(data) {
					console.log('Error:', data);
					alert("오류");
				}
			})
			
		}else{   //취소
		    return false;
		}//if end
	
	})//function end
		
	});//onload end
function update_Re() {
	var inquiry_content = $("#inquiry_contents").val();
	var inquiry_no = $("#update_Re").attr("value");
	if(inquiry_content == ""){
		alert("댓글내용을 입력해주세요");
		return false;
	}else{
	
	$.ajax({
		type : "post",
		url : "/mypage/inquiry_update",
		data : {
			"inquiry_no" : inquiry_no,
			"inquiry_content" : inquiry_content
		},
		success : function(data) {
			location.reload();
			alert("문의글 수정이 완료되었습니다.");
			
		},
		error : function(data) {
			console.log('Error:', data);
			alert("오류");
		}
	})
	}
}

</script>

<div class="container">
<ul class="breadcrumb">
    <li><a href="/"><i class="fa fa-home"></i></a></li>
    <li><a href="/mypage//list_Inquiry">마이페이지/1:1문의</a></li>
  </ul>
	<div class="row">
	 <%@include file="./Mypage.jsp"%>
		<div id="content" class="col-sm-9">


            <div class="cpt_product_description ">
							<div class="caption_box">
								<p class="caption">* 교환/환불/배송관련 문의는 고객센터 전화 또는 카카오톡으로 연락주시기 바랍니다. (상품문의 게시판에서는 제 때에 원활한 처리가 이뤄지지 않을 수 있습니다.)</p>
								<p class="caption">* 상품과 관련없는 광고성, 욕설, 비방, 허위정보, 도배 등은 예고없이 삭제될 수 있습니다.</p>
								<p class="caption">* 고객센터 근무시간(평일 오전10시~오후6시) 이 외의 시간에는 답변이 다소 지연될 수 있습니다.</p>
							</div>
							<!-- 구매자용 -->
							<section class="sub_top_section">
								<h2 class="cate_title"><span>1:1문의&nbsp;&nbsp;</span></h2>
							</section>

							<table class="view_board_table">
								<colgroup>
									<col width="84">
									<col width="140">
									<col width="630">
									<col width="162">
									<col width="152">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>답변</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="inquiry" items="${inquirylist}" 	varStatus="status">
									<input type="hidden" id="inquiry_content" class="inquiry_content" value="${inquiry.inquiry_content}">
									<input type="hidden" id="inquiry_no" class="inquiry_no" value="${inquiry.inquiry_no}">
									
											<tr class="tit_tr user_tit_tr">
												<td>${pageMaker.start + status.index}</td>
												<c:choose>
													<c:when test="${inquiry.inquiry_reply eq null}">
														<td><div class="reply_check comp">대기</div></td>
													</c:when>
													<c:otherwise>
														<td><div class="reply_check comp">완료</div></td>
													</c:otherwise>
												</c:choose>
												<td id="product" class="tit_td" >${inquiry.product_name}</td>
												<td>${inquiry.member_id}</td>
												<td><fmt:formatDate value="${inquiry.inquiry_date}" pattern="yyyy-MM-dd" /></td>
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
							<div class="category-page-wrapper">
        <div class="pagination-in" style="margin-left: 40%">
         <ul class="pagination" >
			<li><a href="/mypage/list_Inquiry?page1=${pageMaker.startPage}">처음</a></li>
			<c:if test="${pageMaker.prev}">
				<li><a href="/mypage/list_Inquiry${pageMaker.startPage}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.lastPage}" var="idx">
				 <li <c:out value="${pageMaker.page == idx?'class =active':''}"/>>
					 <a href="/mypage/list_Inquiry?page1=${idx}">${idx}</a>
				</li>
			</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="/mypage/list_Inquiry${pageMaker.endPage}">&raquo;</a></li>
				</c:if>
				<li><a href="/mypage/list_Inquiry?page1=${pageMaker.lastPage}">마지막</a></li></ul>
        </div>
      </div>
	</div>
	
							<!-- 판매자용 -->
							<c:if test="${login.seller_no ne null || login.seller_no == ''}">
								<section class="sub_top_section">
									<h2 class="cate_title">
										<span>1:1문의(판매자용)&nbsp;&nbsp;</span>
									</h2>
								</section>
								<table class="view_board_table">
									<colgroup>
									<col width="84">
									<col width="140">
									<col width="630">
									<col width="162">
									<col width="152">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>답변</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="inquiry_s" items="${inquirylist_s}" varStatus="status">
											<tr  class="tit_tr user_tit_tr">
											<c:set var="index" value="1"></c:set>
												<td>${pageMaker_s.start + status.index}</td>
												<c:choose>
													<c:when test="${inquiry_s.inquiry_reply eq null}">
														<td><a class="reply_check comp">대기</a></td>
													</c:when>
													<c:otherwise>
														<td><div class="reply_check comp">완료</div></td>
													</c:otherwise>
												</c:choose>
												<td id="product"  class="tit_td" >${inquiry_s.product_name}</td>
												<td>${inquiry_s.member_id}</td>
												<td><fmt:formatDate value="${inquiry_s.inquiry_date}" pattern="yyyy-MM-dd" /></td>
												
											</tr>
											<tr class="txt_tr reply_txt_tr">
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
							
						
	<div class="category-page-wrapper">
        <div class="pagination-in" style="margin-left: 40%">
         <ul class="pagination" >
			<li><a href="/mypage/list_Inquiry?page2=1">처음</a></li>
			<c:if test="${pageMaker_s.prev}">
				<li><a href="/mypage/list_Inquiry?psge=${pageMaker_s.startPage - 1}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker_s.startPage}" end="${pageMaker_s.lastPage}" var="idx">
				 <li <c:out value="${pageMaker_s.page == idx?'class =active':''}"/>>
					<a href="/mypage/list_Inquiry?page2=${idx}">${idx}</a>
				</li>
			</c:forEach>
				<c:if test="${pageMaker_s.next && pageMaker_s.endPage > 0}">
					<li><a href="/mypage/list_Inquiry?page2=${pageMaker_s.endPage +1 }">&raquo;</a></li>
				</c:if>
				<li><a href="/mypage/list_Inquiry?page2=${pageMaker_s.lastPage}">마지막</a></li>
			</ul>
        </div>
      </div>
      </c:if>
   
	
	
	
	
	
	
	
	
						<div>
							<!--  tab1 -->
						</div>
					</div>
					<!-- cpt_container_end -->
	</div>
	</div>
		
		
		

  <%@include file="../include/footer.jsp"%>


