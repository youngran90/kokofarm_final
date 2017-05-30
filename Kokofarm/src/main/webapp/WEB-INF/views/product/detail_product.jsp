<%@page import="java.util.List"%>
<%@page import="kokofarm.product.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"	src=http://code.jquery.com/jquery-1.10.2.js></script>
<link rel="stylesheet" href="css/product.css">
<script type="text/javascript">
jQuery("document").ready(function($){
	
	var nav = $('.nav-container');
	
	$(window).scroll(function () {
		if ($(this).scrollTop() > 136) {
			nav.addClass("f-nav");
		} else {
			nav.removeClass("f-nav");
		}
	});
 
});

	 function eaup() {
			
			var price = $('#price').val();
			
			var num = parseInt($("#ea").val());
			var ea = num + 1;
			$("#ea").val(ea);
			$("#aa").text(price * ea + "원");
		}

		function eadown() {
			
			var price = $('#price').val();
			var num = $("#ea").val();
			var ea = parseInt(num);
			
			if (ea <= 1) {
				alert("더이상 수량을 줄일수없습니다.");
				$("#aa").text(price * ea + "원");
				
			} else {
				$("#ea").val(ea - 1);
				$("#aa").text(price * (ea-1) + "원");
			}
		}
		function deletpost(post_no) {
			$.ajax({
				type : "get",
				url : "deletePost.product",
				data : {
					"post_no" : post_no
				},
				success : function(data) {
					location.reload();
					alert("댓글삭제");
				},
				error : function(data) {
					console.log('Error:', data);
					alert("오류");
				}
			})
		}

		function updatepost(post_no) {
			$("#updatePost").append('<input type="submit" name="post_content" size="50"/>');
			location.reload();

			$.ajax({
				type : "get",
				url : "updatePostAction.product",
				data : {
					"post_no" : post_no
				},
				success : function(data) {
					location.reload();
					alert("댓글수정");
				},
				error : function(data) {
					console.log('Error:', data);
					alert("오류");
				}
			})
		}
		function question(product_name, product_no, seller_no) {
			window.open("doInquiry.Inquiry?product_name=" + product_name + "&product_no=" + product_no + "&seller_no=" + seller_no, "", "width=500,height=400");
		}
		
		<%-- function cart(product_no){
			var member_id = 0;
		 <% 
		 if(member_id==null){ %>
			alert("로그인이 필요합니다.");
			return;
		 <%}else{%>
		 var num = $("#ea").val();
			var ea = parseInt(num);
			location.href="gocartAaction.product?ea=" + ea + "&product_no="+ product_no;
			<%}%>
			} --%>
	 

 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="nav-container">
    <div class="nav">
        <ul>
            <li><a href="#body">상품상세정보</a></li>
            <li><a href="#delivery">배송정보</a></li>
            <li><a href="#commentListArea">댓글</a></li>
            <li><a href="">상품문의</a></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>

	<div id="body">		
	<h2>상품상세리스트 출력</h2>
	<input type="hidden" id="price" value="${product.product_price}"/>
	<table border="1" cellpadding="0" cellspacing="0" style="margin: 10%">

		<tr>
			<td>상품명</td>
			<td id="product">${product.product_name}</td>
		</tr>


		<tr>
			<td>단위</td>
			<td>${product.product_unit}</td>
		</tr>
		<tr>
			<td>수량</td>
			<td>
				<div>
					<button type="button" onclick="eadown()"; ><img src="./css/image/minu.bt.png"  width="20px;"></button>
					<input id="ea" name="ea" value="1" readonly="" type="text" size="1"
						style="text-align: center;">
					<button type="button" onclick="eaup()"><img src="./css/image/plus_bt.png"  width="20px;"></button>
				</div>
			</td>
		</tr>
		<tr>
			<td>판매가</td>
			<td id="aa">${product.product_price}원</td>
		</tr>

		<tr>
			<td></td>
			
			<td><input type="button" value="장바구니"	 onclick="cart('${product.product_no}')" /> 
			<input type="button"
				value="즉시구매" onclick="buy('${product.product_no}')" /></td>
		</tr>

		<tr>
			<td>수확일</td>
			<td><fmt:formatDate value="${product.product_harvestdate}"
					pattern="yyyy년MM월dd일" /></td>
		</tr>

		<tr>
			<td>대표이미지</td>
			<td><img src="../upload/${product.product_mainimage}"></td>
		</tr>

		<tr>
			<td>상세이미지</td>
			<td><img src="../upload/${product.product_detailimage}"></td>
		</tr>

		<tr>
			<td>판매자이미지</td>
			<td><img src="../upload/${product.product_sellerimage}"></td>
		</tr>


		<tr height="30">
			<td colspan="4" align="center">
			<input type="button"	value="메인페이지" onclick="history.go(-1)">&nbsp;&nbsp; 
			<input	type="button" value="취소">&nbsp;&nbsp; 
			<input type="button" value="상품문의글쓰기"	onclick="question('${product.product_name}','${product.product_no}','${product.seller_no}')">
			<input type="button" value="상품문의리스트"	onclick="location.href='ListInquiryAction.Inquiry'"/>
			</td>
		</tr>
	</table>


	<h4 class="cont_tit" id="delivery">배송정보</h4>
	<div class="content_box">
		<div class="deli_img">
			<img src="./css/image/deli_content.png" alt="">
		</div>
		<div class="deli_inner">
			<div class="deli_inner_L">
				<h5>배송관련 안내</h5>
				<table class="deli_inner_table">
					<caption>배송정보 배송관련 테이블</caption>
					<tbody>
						<tr>
							<th>배송비 안내</th>
							<td>
								<p>4만원 이상 주문 시 <span>무료배송</span>
								</p>
								<p>4만원 미만 주문 시 <span>2,500 원</span> 
								</p>
							</td>
						</tr>
						<tr>
							<th>주문마감시간 <br> 및 배송일 안내
							</th>
							<td class="pd">
								<div>
									<p class="fir">
										<span>묶음배송</span> (생산자 직거래 상품을 소포장 단위로 묶음 배송)
									</p>
									<p>전국 전 지역</p>
									<p>- 주중(월~금) 자정까지 결제 시 다음날 배송 완료</p>
									<p class="last">- 주말(토,일) 결제 시 월요일 배송 완료</p>
									<p class="last">
										* 금요일의 경우, 자정마감 지역 중 <span style="font-family: YG77">경기와
											인천</span> 은 <br> 토요일 도착 주문마감시간이 자정까지이며, <br> 그 외 지역의
										주문마감시간은 오후 4시까지 입니다.
									</p>
									<p>일부 제한 지역</p>
									<p>- 주중(월~금) 오후 4시까지 결제 시 다음날 배송 완료</p>
									<p>- 금요일 오후 4시~주말(토,일) 결제 시 화요일 배송 완료</p>
									<p>
										<a href="/shop/board/view.php?id=notice&no=308">※ 제한 지역
											확인하러 가기</a>
									</p>
								</div>
								<div class="last">
									<p class="fir">
										<span>개별배송</span> (생산자 직접 배송)
									</p>
									<p>오전9시 이전 결제 시 당일 수확 후 발송(1일~2일 소요 예정)</p>
									<p>단, 정확한 배송일은 상품 상세 설명의 '발송일'필수 확인 요망</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="deli_inner_R">
				<h5>교환/환불 안내</h5>
				<table class="deli_inner_table">
					<caption>배송정보 교환/환불 테이블</caption>
					<tbody>
						<tr>
							<th>신선식품 일부 이상 시</th>
							<td><span>문제가 생긴만큼 환불</span> 해 드립니다.</td>
						</tr>
						<tr>
							<th>신선식품 전체 이상 시</th>
							<td><span> <em>100%</em> 환불
							</span> 해 드리거나 <span>재배송</span> 을 해드립니다.</td>
						</tr>
						<tr>
							<th>고객센터 안내</th>
							<td class="pd">
								<div class="run_time">
									<strong class="num"> <img
										src="./css/image/main_ico_csc_g.png" alt="">
										1644-4339
									</strong>
									<p>
										<span class="nor">평일</span> - 10:00 ~ 18:00
									</p>
									<p class="cle">점심시간 12:30 ~ 13:30</p>
									<p>
										<span class="nor">토요일</span> - 10:00 ~ 13:00
									</p>
								</div>
								<div class="last">
									<p class="last">
										• 상품 문제가 있다면 신선식품의 특성상 반드시 1~2일 이내 <span class="cle">연락을
											부탁드립니다.</span>
									</p>
									<p class="last">
										• 문제가 있는 상품의 사진을 찍어 주시면 <span class="cle">저희가 상품 상태를 쉽게
											확인하여 빠른 처리 도와드립니다.</span>
									</p>
									<p class="word_wrap">• 단순 변심에 의한 교환/ 환불 배송비 안내</p>
									<p class="word_wrap">- 교환 : 왕복배송비(5,000원) 박스 동봉 후 발송</p>
									<p class="word_wrap">- 환불 : 환불 상품 및 쿠폰 적용 금액 제외한 금액 기준으로
										차등적용</p>
									<p class="word_wrap">4만원 이상 : 3,000원</p>
									<p class="last word_wrap">4만원 미만 : 5,000원</p>
									<p class="last">
										• 단, 포장이 훼손되어 상품 가치가 현저히 상실된 경우 <span class="cle">반품지원이
											어려울 수 있습니다. 참고 부탁드립니다.</span>
									</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="deli_inner_T">
				<h6>주문상태 별 주문취소 가능 여부 안내</h6>
				<p>* 주문접수/입금확인 : 주문내역에서 사용자가 직접 취소 가능</p>
				<p>* 수확중(배송준비중) : 배송 시작 단계로 취소 불가</p>
				<p>* 자세한 상담은 고객센터(1644-4339),카카오톡(ID:헬로네이처)을 이용해주세요.</p>
			</div>
		</div>
	</div>
	
	<h2>댓글</h2>		  

	<div class="board_comment" id="commentListArea">
	
                     <table>
                        <tbody id="commentList">
               <tr>
				<td style="width: 50px;" align="center">글번호</td>
				<td style="width: 100px;" align="center">작성자</td>
				<td style="width: 500px;" >글내용</td>
				<td style="width: 145px;" align="center">작성일</td>
			</tr>
			
                        <tr>
                           <td class="comment_name"><span class="txt strong">iamkkiru(성지영)</span></td>
                           <td class="comment_txt"><span>확장자 변경은 안되고 꼭 압축해서 올려주세요</span></td>
                           <td class="comment_date">2017-03-29 16:02:00 <button type="button" class="btn re"><span class="text">답글</span></button> <button type="button" class="btn declaration"><span class="text">신고</span></button></td>
                        </tr>
                        <tr class="write">
                           <td class="comment_area" colspan="2"><textarea></textarea></td>
                           <td class="comment_write_btn"><button type="button"><span class="text">작성 완료</span></button></td>
                        </tr>
                        
                     </tbody>
                  </table>
                  
        	<form  id="commentForm" action="InsertPostAction.product" method="post">
				 <input type="hidden" name="product_no" value="${product.product_no}" ></input>
				<input type="hidden" name="member_id" size="10"></input>
		글내용:<input type="text" name="post_content" size="50" placeholder="로그인하시면 작성가능합니다"></input>
		 <input type="submit" value="작성 완료" >
	</form>
	
                     <p class="comment_input"><textarea name="comment"></textarea></p>
                     <p class="comment_input_bt"><button type="submit">댓글</button></p>
	
	
       
     <div class="board_comment" id="commentListArea">  
		<table id="commentList" style="border: solid #eaeaea 3px; ">
		
			
		
				<c:if test="${not empty postlist}">
					<c:forEach var="postlist" items="${postlist}" varStatus="status">
					<tr>
						<td>${status.count}</td>
							<td class="comment_name"><span class="txt strong" id="member_id">${postlist.member_id}</span></td>
			                  <td class="comment_txt"><span>${postlist.post_content}</span></td>
			                  <td class="comment_date"><fmt:formatDate value="${postlist.post_date}" pattern="yyyy년 MM월 dd일"/></td>
			                 
			                  <c:set var="id" value="${id}"></c:set>
			                   <c:if test="${postlist.member_id eq member_id}">
			                  <td><button id="deletePost" value="${postlist.post_no}" onclick="deletpost('${postlist.post_no}')">삭제</button></td>
			              		</c:if>
			               </tr>
			        </c:forEach>
				</c:if>
       </table>
	</div>

	<a href="listproductAction.product">리스트</a>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>
	</div>
	
		 
	
</body>

</html>