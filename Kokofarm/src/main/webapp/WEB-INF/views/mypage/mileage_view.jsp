<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/mileage/css/mileage.css">

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<script type="text/javascript">
var jq = jQuery.noConflict();
jq(function(){
	
	 jq.datepicker.setDefaults(jq.datepicker.regional['ko']); 

	  jq('#start_date').datepicker({
          showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
          buttonImage: "/resources/files/attach/cal.png", // 버튼 이미지
          buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
          buttonText: "날짜선택",             // 버튼의 대체 텍스트
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
          monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          dateFormat: "yy-mm-dd",             // 날짜의 형식
          changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
          //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
          onClose: function( selectedDate ) {    
              // 시작일(fromDate) datepicker가 닫힐때
              // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
              jq("#toDate").datepicker( "option", "minDate", selectedDate );
          }                
      });


	jq("#end_date").datepicker({
		showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
        buttonImage: "/resources/files/attach/cal.png", // 버튼 이미지
        buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
        buttonText: "날짜선택",             // 버튼의 대체 텍스트
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dateFormat: "yy-mm-dd",             // 날짜의 형식
        changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
        //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
        onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            jq("#toDate").datepicker( "option", "minDate", selectedDate );
    	}     
	});
	
	jq("#search").on('click',function(e){
		e.preventDefault();
		var start = parseInt(jq("#start_date").val().replace(/-/g,""));
		var end = parseInt(jq("#end_date").val().replace(/-/g,""));
		
		var now = new Date();
		now = finish_auction(now);
		
		//시작일  > 오늘일자
		if(now <= start && now < end){
			alert("미래를 조회하겠다고?");
		//끝나는일 < 시작일
		}else if(end < start){
			alert("시간지배자?");
		}else if(end > now){
			alert("끝나는 날이 오늘을 못 넘어요~");
		}else{
			jq("#search_form").submit();
		}
			
	});
	
	
	//날짜 포멧 함수
	function finish_auction(now){
		var now = leadingZeros(now.getFullYear(),4) +
				  leadingZeros(now.getMonth()+1,2) +
				  leadingZeros(now.getDate(),2);
		return parseInt(now);
	}
	
	//날짜 포멧 형식 고정
	function leadingZeros(n, digits) {
		var zero = "";
		n = n.toString();
		if(n.length < digits){
			for(var i=0; i < digits - n.length; i++){
				zero += 0;
			}
		}
		return zero + n;
	}
	
	
	jq("button[class=order_detail]").each(function(i){
		
		jq(this).hover(function(){
			jq(this).css('background-color','#38a9a5').css('color','white');
		},function(){
			jq(this).css('background-color','white').css('color','#38a9a5');
		});
		
		jq(this).on('click',function(e){
			e.preventDefault();
			
			window.open('/orderproduct/order_detailview?order_finish_no='+jq(this).val(), "주문 내역 상세", "width=800, height=700");
			
		});
	});
		
	
});
	
</script>
<div class="container">
	<div class="row">
		<%@include file="./Mypage.jsp"%>
		
		<div class="current_box">
					<strong id="current_t">현재 포인트 <strong id="current_m"><fmt:formatNumber value="${current}" type="number"/></strong>P</strong>
				</div>
				
				<form action="/orderproduct/mileage_view" id="search_form" method="POST">
				<div class="date_search">
					<div class="date_s">
                    <input type="text" class="start" id="start_date" name="start_date"> 
                    </div>
                    <div class="hyphen"></div>
                    <div class="date_e">
                    <input type="text" class="end" id="end_date" name="end_date">
                    </div>
                    <button class="search" id="search">조회하기</button>
				</div>
				</form>
                    
		<div id="content" class="col-sm-9">
		
            <div class="cpt_product_description ">
				
				<table id="mileage_tb">
				<colgroup>
					<col width="100">
					<col width="230">
					<col width="230">
					<col width="230">
					<col width="230">
					<col width="230">
				</colgroup>
					<tr  class="tit_tr user_tit_tr">
						<th>번호</th>
						<th>거래일</th>
						<th>적립</th>
						<th>사용</th>
						<th>포인트</th>
						<th>이용정보</th>
					</tr>
					<c:forEach var="list" items="${list }" varStatus="status">
					<tr class="txt_tr reply_txt_tr">
						<td>${pageMaker.start+status.index }</td>
						<td><fmt:formatDate value="${list.mileage_date }" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatNumber value="${list.mileage_saving }" type="number"/></td>
						<td><fmt:formatNumber value="${list.mileage_use }" type="number"/></td>
						<td><fmt:formatNumber value="${list.mileage_total }" type="number"/></td>
						<td><button class="order_detail" id="${status.index}" value="${list.orderfinish_no}">구매내역 보기</button></td>
					</tr>
					</c:forEach>
				</table>
				
				<div class="category-page-wrapper">
		        	<div class="pagination-in" style="margin-left: 40%">
		         		<ul class="pagination" >
							<li><a href="/orderproduct/mileage_view?page=${pageMaker.startPage}">처음</a></li>
							<c:if test="${pageMaker.prev}">
								<li><a href="/orderproduct/mileage_view${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.lastPage}" var="idx">
						 		<li <c:out value="${pageMaker.page == idx?'class =active':''}"/>>
							 	<a href="/orderproduct/mileage_view?page=${idx}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="/orderproduct/mileage_view${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
								<li><a href="/orderproduct/mileage_view?page=${pageMaker.endPage}">마지막</a></li></ul>
		        	</div>
		      	</div>
      
      		</div>
      	</div>
    </div>  
</div>
<%@include file="../include/footer.jsp"%>