<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코팜::상품입찰</title>
<!-- <script src="jquery.js" type="text/javascript"></script> -->
<!-- <link href="../kokofarm.tender.view/css/tender.css" rel="stylesheet" type="text/css"> -->
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

  var time=${visitingTime};
   
   function timer(){ 
	   if(time<=0){
		   clearInterval(tid);
		   document.getElementById('tend_time').innerHTML="0일0시간0분0초";
	   } 
	   m= Math.floor(time/(24*60*60))+"일"+Math.floor((time%(24*60*60)/(60*60)))+"시간"+Math.floor(((time%3600)/60))+"분"+time%60+"초";
	   document.getElementById('tend_time').innerHTML=m;
	   time--;
	   
   } 
 
 $(function(){
	 tid=setInterval(timer,1000); 
 
	 $(window).scroll(function() {        
            if ($(this).scrollTop() > 350) {
                $('#move_top').fadeIn();
            } else {
                $('#move_top').fadeOut();
            }
        });
        
        $("#move_top").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
        
        $('#locationCheck').click(function(){
   		    var popOption = "width=500, height=400,scrollbars=yes, resizable=no, status=no";
   			window.open(this.href,'제한지역확인',popOption);
   			return false;
        })
        
 })
</script>
</head>
<body>
<%-- <div id = "header">
<jsp:include page="../Kokofarm_Main/mainheader.jsp" flush="false"></jsp:include>
</div> --%>
   <section class="productView">
     <article class="photoPart">
      
      <%-- <div id="navi">
        <ul>
         <li><a href="kokofarm.tender.image/${auction.auction_file}"><img src="kokofarm.tender.image/c_t_149181142481l1_thum.jpg"></a></li>
         <li><a href="kokofarm.tender.image/17617_03.jpg"><img src="kokofarm.tender.image/17617_03_thum.jpg"></a></li>
       </ul>
       </div> --%>
       <div class="photoPart1">
         <%-- <img id="product_pic" src="kokofarm.tender.image/${auction.auction_file}" width=520px height=320px/> --%>
         <img id="product_pic" src="../${auction.auction_file}" width=520px height=290px/>
          <br>
       </div>
      
     </article>
    
    <article class="productData">
    <div class="productWhole">
     <%-- <h3 class="title"> ${seller_name}님의 ${auction.auction_name} </h3> --%>
     <h3 class="title"> ${auction.auction_name} </h3>
      <div class="product">
       <form action="tenderform" method="post">
       <input type="hidden" name="visitingTime" value="${visitingTime}">
       <input type="hidden" name="auction_no" value="${auction.auction_no}">
        <table class="product_status">
	      <tbody>
	        <tr>
	          <th>경매시작일</th>
	          <td>
	            <em>${auction.start_date }</em>
	          </td>
	        </tr>
	        <tr>
	          <th>경매종료일</th>
	          <td>
	            <em>${auction.end_date }</em>
	          </td>
	        </tr>
	        <tr>
	         <th>상한가</th>
	         <td>
	           <em>${auction.auction_up}</em>
	         </td>
	        </tr>
	        <tr>
	         <th>하한가</th>
	         <td>
	           <em>${auction.auction_down}</em>
	         </td>
	        </tr>
	        <tr>
	         <th>현재가</th>
	         <td>
	           <em>${ current_price}</em>
	           <input type="hidden" name="current_price" value="${current_price }">
	         </td>
	        </tr>
	        <tr>
	          <th>남은시간</th>
	          <td>
	            <em id="tend_time"></em>
	          </td>
	        </tr>
	       <%--  <tr>
	         <th>경매내용</th>
	         <td>
	           <em>${auction.auction_content}</em>
	         </td>
	        </tr> --%>
	       <%--  <tr>
	          <th>입찰금액</th>
	          	<c:choose>
       			<c:when test="${ current_price == auction.auction_up}">
         			<td>
         			<em>경매가 완료되었습니다.</em>
         			</td>
       			</c:when>
       			<c:when test="${visitingTime==0 }">
         			<td>
         			  <em>경매가 종료되었습니다.</em>
         			</td>
       			</c:when>
       			<c:otherwise>
          			<td>
	           		 <em><input type="number" name="tender_price" size=20>원</em>
	          		</td>
      			</c:otherwise>    
      		</c:choose>
	        	</tr>
	        	<tr>
	        	  <td><em><input type="submit" value="입찰하기" size=30 id="tender"></em></td>
	        	  </tr> --%>
      	</tbody>
      </table>
      <br>
     <div class="tenderPrice">
       <c:choose>
       <c:when test="${ current_price == auction.auction_up}">
         <p class="end">경매가 완료되었습니다.<p><br>
       </c:when>
       <c:when test="${visitingTime==0 }">
         <p class="end">경매가 종료되었습니다.</p>
       </c:when>
       <c:otherwise>
          <p id="priceP">입찰 가격 </p><input type="number" name="tender_price" size=20>원<br>
       	  <br>
         <input type="submit" value="입찰하기" size=30 id="tender">
       </c:otherwise>    
       </c:choose>
     </div>
      </form> 
     </div>
     </div>
     </article>
    </section>
    <br><br><br><br><br>
    
    <section>
      <div id="detailnav">
        <a class="tab" id="ftab" href="#detail">상품상세정보</a>
        <a class="tab" id="stab" href="#deliveryH">배송정보</a>
        <a class="tab" id="ttab">구매후기</a>
        <a class="tab" id="fotab">상품문의</a>
      </div>
      <br>
      <div id="detail">
        <p id="detailtitleP">${auction.auction_name}</p>      
        <img id="detailImg" src="../${auction.auction_file}" width="1000">
        <%-- <img src="kokofarm.tender.image/${auction.auction_file}"> --%>
        <br>
        <p id="detailcontentP">${auction.auction_content}</p>
        <div id="detailImgs">
          <img id="detail1" src="../${auction.auction_detailImg }" width="480" height="400">
          <img id="detail2" src="../${auction.auction_detailImg2 }" width="480" height="400">
        </div>
      </div>
      
      <h4 id="deliveryH">배송정보</h4>
      <!-- <img id="deliveryImg" src="kokofarm.tender.image/delivery.png" alt="delivery" width="1000"> -->
      <img id="deliveryHead" src="../kokofarm.tender.image/deliveryHead.png">
      <div id="deliveryInfo1">
      <h4 class="tableH">배송관련 안내</h4>
      <table class="deliveryTable">
        <tbody>  
          <tr class="trs">
            <th>배송비 안내</th>
            <td>
              <p class="detailTableP">4만원 이상 주문 시
                <span class="deliverySpan">무료배송</span>
              </p>
              <p class="detailTableP">4만원 미만 주문 시
                <span class="deliverySpan">2,500원</span>
              </p>
            </td>
          </tr>
         
          <tr class="trs">
            <th>주문마감시간 및 배송일 안내</th>
            <td>
              <p class="detailTableP">
              <span class="deliverySpan">묶음배송</span>
              (생상자 직거래 상품을 소포장 단위로 묶음 배송)
              </p>
              <p class="detailTableP">전국 전 지역</p>
              <p class="detailTableP">-주중(월~금) 자정까지 결제 시 다음날 배송 완료</p>
              <p class="detailTableP">-주말(토,일) 결제 시 월요일 배송 완료</p>
              <p class="detailTableP">※ 금요일의 경우, 자정마감 지역 중 <span class="deliverySpan">경기와 인천</span>은 토요일 도착 주문 마감시간이 자정까지이며,
              그 외 지역의 주문마감시간은 오후 4시까지 입니다.</p>
              <p class="detailTableP">일부 제한 지역</p>
              <p class="detailTableP">-주중(월~금) 오후 4시까지 결제 시 다음날 배송 완료</p>
              <p class="detailTableP">-금요일 오후 4시~주말(토,일) 결제 시 화요일 배송 완료</p>
              <p class="detailTableP"><a id="locationCheck" href="kokofarm.tender.view/popup.html">※ 일부 제한 지역 확인하기</a></p>
              <p class="detailTableP">
              <span class="deliverySpan">개별배송</span>
              (생산자 직접 배송)
              </p>
              <p class="detailTableP">오전 9시 이전 결제 시 당일 수확 후 발송(1~2일 소요 예정)</p>
            </td>
          </tr>
        </tbody>
      </table>
      </div>
      
      <div id="deliveryInfo2">
      <h4 class="tableH">교환/환불 안내</h4>
      <table class="deliveryTable">
        <tbody>
          <tr class="trs">
            <th>신선식품 일부 이상 시</th>
            <td>
              <p class="detailTableP">
                <span class="deliverySpan">문제가 생긴만큼 환불</span>
              해 드립니다.
              </p>
            </td>
          </tr>
          
          <tr class="trs">
            <th>신선식품 전체 이상 시</th>
            <td>
              <p class="detailTableP">
              <span class="deliverySpan">100% 환불</span>
             해 드리거나 <span class="deliverySpan">재배송</span>을 해드립니다.
              </p>
            </td>
            </tr>
  
            <tr class="trs">
            <th>고객센터 안내</th>
            <td>
              <p class="detailTableP"><img src="../kokofarm.tender.image/main_ico_csc_g.png">1644-8888</p>
              <p class="detailTableP">평일 10:00 ~ 18:00
              (점심시간 12:30 ~ 13:30)
              </p>
              <p class="detailTableP">토요일 10:00 ~ 13:00</p>
              <p class="detailTableP">상품 문제가 있다면 신선식품의 특성상 반드시 1~2일 이내 연락을 부탁드립니다.</p>
              <p class="detailTableP">문제가 있는 상품의 사진을 찍어 주시면 저희가 상품 상태를 쉽게 확인하여 빠른 처리 도와드립니다.</p>
              <p class="detailTableP">단순 변심에 의한 교환/환불 배송비 안내</p>
              <p class="detailTableP">-교환: 왕복배송비(5000원) 박스 동봉 후 발송</p>
              <p class="detailTableP">-환불: 환불 상품 및 쿠폰 적용 금액 제외한 금액 기준으로 차등적용</p>
              <p class="detailTableP">4만원 이상:3,000원</p>
              <p class="detailTableP">4만원 미만:5,000원</p>
              <p class="detailTableP">※단, 포장이 훼손되어 상품 가치가 현저히 상실된 경우 반품지원이 어려울 수 있습니다. 참고 부탁드립니다.</p>
            </td>
          </tr>
          
        </tbody>
      </table>
      </div>
      <a id="move_top" href="#">TOP ▲</a>
 
    </section>
<%-- <div id = "footer">
   <jsp:include page="../Kokofarm_Main/mainfooter.jsp" flush="false"></jsp:include>
   </div> --%>
</body>
</html>