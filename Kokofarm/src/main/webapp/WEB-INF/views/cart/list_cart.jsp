<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KoKoFarm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/list_cart.css">
<style type="text/css">
table{table-layout:fixed;border-collapse:collapse;}

/* #top{
	border: 1px solid blue;
} */

</style>
<script type="text/javascript">
	$(function() {
		$("input:checkbox[name=order]").on("click",function(){ // 숨겨진 체크박스 같이 선택
			var size = $("input[name=order]").length;
			for(var i=1; i<=size; i++){
				if($('input:checkbox[id='+i+'ac]').is(":checked") == true){
					$("input[id="+i+"amount]").prop("checked",true);
					$("input[id="+i+"t]").prop("checked",true);
				}else if($('input:checkbox[id='+i+'ac]').is(":checked") == false){
					$("input[id="+i+"amount]").prop("checked",false);
					$("input[id="+i+"t]").prop("checked",false);
				}
			}
		}) 
	
		//체크박스 전체 선택 / 선택 해제 이벤트
		 $('#all').on('click', function(){
			var cnt = $('input[name=order]:checked').length;
			var size = $("input[name=order]").length;
			for(var i=0; i<size; i++){
				var index = i + 1;
				if(cnt == 0){
					$("input[id="+index+"ac]").prop("checked",true);
					$("input[id="+index+"amount]").prop("checked",true);
					$("input[id="+index+"t]").prop("checked",true);
				}else if(cnt >= 0){
					$("input[id="+index+"ac]").prop("checked",false);
					$("input[id="+index+"amount]").prop("checked",false);
					$("input[id="+index+"t]").prop("checked",false);
				} 
			}  
		}); // 선택 이벤트 종료 
		
		//체크박스 선택 없이 주문하기 눌렀을때...
		$('#submit_order').on('click',function() {
			var checked = $("input:checkbox[name=order]:checked").length;
			for(var i=0; i<list_cart.order.length; i++){
					if(checked > 0 ){
						return true;
					}else{
						alert("상품을 선택해주세요.");
						return false; //for문의 break;기능
					}
			}
		}); //체크박스 선택없이 주문하기... 종료 
			
	/* ============= 구분선 ============*/
		
	var size = $("label[name=total]").length; //행의 총 개수 ( 1부터 시작한다.)
	$("#cart_amount_count").text(size);
	
			// 수량 & 금액 구하기
			$(".price").each(function(i){
				var index = i+1; // 반복문 인덱스 (each메소드는 0번째부터 시작한다)
				var price = $(this).attr("value"); // 각 해당하는 제품 값 불러온다.
				var price_format = numberFormat(price); //정규화 조건으로 캐스팅
				
				$(this).text(price_format + " 원"); // 가격표 캐스팅
				$('label[class='+index+']').text(price_format + " 원"); //각 품목에 해당하는 총 금액(로딩 될때 초기 화면)
				
				///////////////////////////////////////////////////////////
				
				$(document).on("click","#up", function(){ //증가버튼
					var index_1 = i+1; // 반복문 인덱스 (each메소드는 0번째부터 시작한다)
					var cnt = $(this).attr("value"); // 각 버튼 인덱스\
					var amount = $('input[name='+cnt+']').val(); // 각 해당하는 제품수량
					if(index_1 == cnt){
						amount++;
						$('input[name='+cnt+']').val(amount); // 증가되는 수량 입력
						var product_price = price_format.replace(/[^0-9]/g,"");
						var total = product_price * amount; // 수량 적용 된 총 금액 ( 제품 가격 * 수량)
						var total_price = numberFormat(total); // 총 금액 3자리마다 , 로 다시 정규화
						$('label[class='+cnt+']').text(total_price + " 원"); // 증가할때마다 해당하는 각제품의 총합을 출력한다. (각 제품 총합)
						
						submit(index_1,total);//금액
						submit_amount(index_1,amount);//수량
						
						deliveryPrice(cnt,product_price,total);
						totalSum(size);//윈도우 로딩시 계산 되는 함수 호출
					}
				}); // 증가버튼 종료 
				
				///////////////////////////////////////////////////////////
				
				$(document).on("click","#down", function(){ //감소버튼
					var index_2 = i+1; // 반복문 인덱스 (each메소드는 0번째부터 시작한다)
					var cnt = $(this).attr("value"); // 각 버튼 인덱스
					var amount = $('input[name='+cnt+']').val(); // 각 해당하는 제품수량
					if(index_2 == cnt){ //index  = 각 행 index
						if( amount < 1){
							alert("0 이하 입력 불가");
						}else{
							amount--;
						}
						var product_price = price_format.replace(/[^0-9]/g,""); //숫자로 정규화 - 제품 가격
						$('input[name='+cnt+']').val(amount); // 감소하는 수량 입력
						var total = product_price * amount; // 총 금액 ( 제품 가격 * 수량)
						var total_price = numberFormat(total); // 총 금액 3자리마다 , 로 다시 정규화 
						
						$('label[class='+cnt+']').text(total_price + " 원"); // 감소할때마다 해당하는 각제품의 총합을 출력한다. (각 제품 총합)
						
						deliveryPrice(cnt,product_price,total);
						totalSum(size);//윈도우 로딩시 계산 되는 함수 호출
						
						submit_1(index_2,total);//금액
						submit_amount(index_2,amount);//수량
					}
				});//감소버튼 종료
				
				///////////////////////////////////////////////////////////	
				
				$(document).on("click","#change",function(){ // 수량 변경으로 값 구하기
					var index_3 = i+1; // 반복문 인덱스 (each메소드는 0번째부터 시작한다)
					var cnt = $(this).attr("value"); // 각 버튼 인덱스
					var amount = $('input[name='+cnt+']').val(); // 각 해당하는 제품수량
					var price = $('label[id='+cnt+']').text(); // 각 해당하는 제품 값 불러온다.
					
					if(index_3 == cnt ){
						if(amount <1){
							alert("0이하 입력 불가");
							$('label[class='+cnt+']').text("0 원");
						}else{
							var product_amount = parseInt(amount); //  각 제품 수량 정수형으로 캐스팅
							var num_casting = price.replace(/[^0-9]/g,""); //천 단위 제거 
							var product_price = parseInt(num_casting); // 각 제품 가격 정수형으로 캐스팅
	 
							var total = product_amount * product_price;
							var total_casting = numberFormat(total);
							$('label[class='+cnt+']').text(total_casting + " 원");
							deliveryPrice(cnt,product_price,total);
							totalSum(size); //윈도우 로딩시 계산 되는 함수 호출
							
							submit_2(index_3,total);//금액
							submit_amount(index_3,amount);//수량
						}
					}
				});//수량 변경버튼
			}); // 수량변경 & 금액 구하는거 종료 
		
		
			function numberFormat(x) { //3 자리수 마다 , 표시
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			function totalSum(size){// 윈도우 호출시 자동으로 각 제품의 합을 구해주는 함수(size는 각 행의 개수를 파라미터로 받아온다)
					var sum = 0;	// 각 제품의 총합을 담을 변수
					$("label[name=total]").each(function(i){
						var index = i + 1; // 각 행의 인덱스(0번부터 시작해서 1번으로 맞추기 위해 1을 더해준다)
						var price = $(this).text(); // 이벤트 안에서의 this는 이벤트 대상을 가르킨다 이때 this는 각 행의 제품 값을 해당한다.
						var price_casting = price.replace(/[^0-9]/g,""); 
						
						if(index <= size){
							sum += parseInt(price_casting);
						}
					})
					var sum_casting = numberFormat(sum);
					$("#result_price").text(sum_casting+" 원");
					
					var delivery = $("#result_delivery").text();
					var delivery_casting = delivery.replace(/[^0-9]/g,"");
					
					var result_total = sum + parseInt(delivery_casting);
					var result_total_casting = numberFormat(result_total);
					
					$("#result_total").text(result_total_casting+ " 원");
			}// 윈도우 호출시 자동으로 각 제품의 합을 구해주는 함수 종료
			
			function deliveryPrice(cnt,product_price,total){
 				//cnt = 버튼 인덱스 , product_price = 각 제품의 가격 ,  total = 수량 반영된 제품 가격
 				var delivery_sum = 0; // 배달비 총합을 담을 변수
 				$(".delivery_price").each(function(i){
 					var index = i + 1;
 					var price = $("label[id="+index+"a]").val();
	 				var price_casting = price.replace(/[^0-9]/g,"");
 					if(index == cnt){
	 					if(product_price >= 100000){
	 						if(total >= 500000){
	 							$(this).text("무료");
	 							$(this).val(0);
	 						}else{
	 							$(this).text(numberFormat(10000) +" 원");
	 							$(this).val(10000);
	 						}
	 					}else if(product_price >= 10000){
	 						if(total >= 50000){
	 							$(this).text("무료");
	 							$(this).val(0);
	 						}else{
	 							$(this).text(numberFormat(5000) +" 원");
	 							$(this).val(5000);
	 						}
	 					}else if(product_price >=0){
	 						if(total >= 5000){
	 							$(this).text("무료");
	 							$(this).val(0);
	 						}else{
	 							$(this).text(numberFormat(2500) +" 원");
	 							$(this).val(2500);
	 						}
	 					}
	 					
 					}
 					var price = $("label[id="+index+"a]").val();
	 				var price_casting = price.replace(/[^0-9]/g,"");
 					if(index <= size){
 						delivery_sum += parseInt(price_casting);
 					}
 					
 				})
 				var delivery_casting = numberFormat(delivery_sum);
 				$("#result_delivery").text(delivery_casting+ " 원");
		}// 윈도우 호출시 자동으로 각 제품의 합을 구해주는 함수 종료2
			
		// 배송비 총 합계 구하기 (로딩)
			var result_delivery=0; //배송비 총합 구하기 위한 변수
			$(".delivery_price").each(function(i){
				var index = i + 1;
				var product_price = $("label[id="+index+"]").text();
				var product_price_casting = product_price.replace(/[^0-9]/g,"");
				var price = $('label[id='+index+'a]').val(); // 해당하는 배송비 구해오기
				 
				if(product_price_casting >= 100000){
					$(this).text(numberFormat(10000)+ " 원");
					price = 10000;
				}else if(product_price_casting >= 10000){
					$(this).text(numberFormat(5000)+ " 원");
					price = 5000;
				}else if(product_price_casting >= 0){
					$(this).text(numberFormat(2500)+ " 원");
					price = 2500;
				}
				
				var price_casting = numberFormat(price); // 3자리로 변환
				$('label[id='+index+'a]').val(price_casting+" 원"); //  형변환한거 다시 출력하게
				
				if(index <= size){
					result_delivery +=  parseInt(price);
				}
			})
			var delivery_casting = numberFormat(result_delivery);
			$("#result_delivery").text(delivery_casting + " 원"); // 배송비 총합 출력delivery_casting
			
			// 주문금액 총 합계 구하기(로딩)
			var result_sum = 0 ; // 모든 총합을 담을 변수
			$("label[name=total]").each(function(i){
				var index = i + 1; //각 해당 인덱스 
				var total_price = $(this).text(); // 각 품목에대한 총 금액(문자열)
				var total_price_casting = total_price.replace(/[^0-9]/g,""); //각 품목 총합의 천단위를 제거한다 
				
				submit(index,total_price_casting);//금액
				
				 if(index <= size){
						result_sum += parseInt(total_price_casting); // 총합구하는 구문
					}
			});
			
			var result_sum_casting = numberFormat(result_sum); // 숫자 단위 형태로 형변환
			 $('#result_price').text(result_sum_casting+ " 원"); //주문금액 총합 출력
			 
			 var result_total = parseInt(result_delivery) + parseInt(result_sum); // 총 예상 결제금액 변수
				var total_casting = numberFormat(result_total); // 총 결제금액 변환
				$("#result_total").text(total_casting + " 원"); // 총 예상 결제금액 (로딩)
				
				
			///////////////////////////////////////////////////////////////////////////////
			var sum = 0;
			$('label[name=total]').each(function(i) {
				var index = i + 1;
				var cnt = $(this).attr("value");
				var product_price = $("label[id="+index+"]").text();
				var product_price_casting = product_price.replace(/[^0-9]/g,"");
				var price = parseInt(product_price_casting);
				
				var product_amount = $("input[name="+index+"]").val();
				var product_amount_casting = product_amount.replace(/[]^0-9]/g,"");
				var amount = parseInt(product_amount_casting);
				
				if(index == cnt){
					sum = price * amount;
					var total_price = numberFormat(sum);
					$("label[class="+index+"]").text(total_price+" 원");
				}
			})
			
			var t_sum=0;
			$('label[id=total]').each(function(i) {
				var index = i + 1;
				var cnt = $(this).attr("class");
				var total_price = $("label[class="+index+"]").text();
				var total_price_casting = total_price.replace(/[^0-9]/g,"");
				var total = parseInt(total_price_casting);
				
				if(index <= size){
					t_sum += total;
				}
			})
			
			var rt_price = numberFormat(t_sum);
			$("#result_price").text(rt_price+" 원");
			//////////////////////////////////////////////////////////////////////////////////
				
			// 각 수량 구하기(로딩)
			$(".product_amount").each(function(i){
				var index = i+1;
				var cnt = $("input[name="+index+"]").attr("name");
				var amount=0;
				if(index == cnt){
					amount = $("input[name="+index+"]").val();
					submit_amount(index,amount);
				}
			})
			
			// 각 제품 총합 구하기(로딩) (숨은 체크박스)
			$("label[name=total]").each(function(i){
				var index = i+1;
				var cnt = $("input[id="+index+"t]").attr("id");
				
				if(index+'t' == cnt){
					var price = $(this).text();
					var price_casting = price.replace(/[^0-9]/g,"");
					$('input[id='+index+'t]').val(price_casting);
				}
			})
				
				
		 	function submit(index,total){ //총합
				var cnt = $("input[id="+index+"t]").attr("id");
				if(index+"t" == cnt){
					$("input[id="+index+"t]").val(total);
				}
			}
			
			function submit_1(index,total){ // 감소
					var cnt = $("input[id="+index+"t]").attr("id");
					if(index+"t" == cnt){
						$("input[id="+index+"t]").val(total);	
					}	
			}
			
			function submit_2(index,total){ // 변경
				var cnt = $("input[id="+index+"t]").attr("id");
				if(index+"t" == cnt){
					$("input[id="+index+"t]").val(total);	
				}
			}
				
			function submit_amount(index,amount){ //수량
				var cnt = $("input[id="+index+"amount]").attr("id");
				if(index+"amount" == cnt){
					$("input[id="+index+"amount]").val(amount);
				}
			}
			
	}); //윈도우 로딩 종료 
	
</script>

</head>
<body>
	<header>
		<%-- <div id = "header">
			<jsp:include page="../Kokofarm_Main/mainheader.jsp" flush="false"></jsp:include>
		</div> --%>
	</header>
	
	<section>
		<div id="container" class="container">
			<div id="body" class="body">
			
			<section name="top_contents" id="top_contents">
				<h2 id="top_bar" name="top_bar"><em>주문하기</em></h2>
				<div id="top_location" name="top_location">
					<a class="loca_home" href="main.member"><img src="images/ico_location_home.gif"></a>
					<a class="loca_product_list" href="golistproductAction.product">제품 목록</a>
					<a class="loca_this" href="#">장바구니</a>
				</div>
			</section>
			
			<section id="top_img_box" name="top_img_box">
				<img src="images/ord_top_con_step1.jpg" alt="top_img_box" width="100%">
			</section>
			
			<section id="crat_total_amount" name="crat_total_amount">
				<div class="cart_amount" name="cart_amount">
					<span id="cart_amount_title">장바구니 상품&nbsp;&nbsp;&nbsp;<em id="cart_amount_count" name="cart_amount_count"></em>&nbsp;건</span>
				</div>	
			</section>
			<section class="order_list_section">
				<div class= "order_list_box">
					<div id="all_delete">
						<a href="ActionCartDeleteALL.cart"><img id="all_del" alt="all_del" src="images/btn_cart_del.gif" style="vertical-align:middle; margin-right: 8px">선택 상품 삭제</a>
					</div>
						<table border="1" cellpadding="3" id="cart_list_table" class="cart_table">
							<thead align="center"> 
								<tr>
									<th width="80"><button id="all" name="all" >전체 선택</button></th>
									<th width="80" style="display: none">숨길항목</th>
									<th width="150">상품명</th>
									<th width="200">배송종류</th>
									<th width="180">배송비</th>
									<th width="200">가격</th>
									<th width="180" colspan="2">수량</th>
									<th width="130">주문금액</th>
									<th width="100">삭제하기</th>
								</tr>
							</thead>
							<tbody align="center" id="cart">
								<form action="ActionRoutingCart.cart" method="post" name="list_cart">
									
									&nbsp;&nbsp;
									
								<c:forEach var="cart_list" items="${listcart }" varStatus="status">
									<tr>
											<td><input type="checkbox" id="${status.count }ac" name="order" value ="${cart_list.product_no }"></td> <!-- 체크박스 -->
											<td style="display: none"><input type="hidden" id="product_no" value="${cart_list.product_no }"></td> <!-- 상품번호(숨김) -->
											<td><label id="product_name">${cart_list.product_name }</label></td> <!-- 제품명 -->
											<td><label id="delivery">테스트용~</label></td> <!-- 배송유형 -->
											<td><label id="${status.count }a" name="delivery_price" class="delivery_price" value="0"></label></td> <!-- 배송비 -->
											<td><label id="${status.count}" value="${cart_list.product_price }" name="price" class="price">${cart_list.product_price }</label></td> <!-- 제품가격 -->
											<td ><input type="text" name="${status.count}" class="product_amount" name="product_amount" value="${cart_list.product_unit }" type="text"  style="text-align: center;"></td> <!-- 수량 -->
											<td style="display: none;"><input type="checkbox" id="${status.count}amount" name="amount" value="0"></td>
									<td>
											<span id="button_amount">
												<button id="up" name="up" type="button" value="${status.count}" alt="증가"></button>
												<button id="down" name="down"  type="button" value="${status.count}" alt="감소"></button>
											</span>
												<button id="change" name="change" type="button" value="${status.count }" alt="수량변경"></button>
									</td>
									<td>
											<label id="total" name="total" class="${status.count}" value="${status.count}"></label> <!-- 총 금액 -->
									</td>
											<td style="display: none;"><input type="checkbox" id="${status.count}t" name="order_total" value="0"></td>
									<td>
											<input type="button" name="delete" onclick="location.href='ActionCartDelete.cart?product_no=${cart_list.product_no }'" value="삭제">
									</td>
									</tr>
									</c:forEach>	
								</tbody>
						</table>
					</div>
					</section>
					<br><br>
					
					<section class="sale_product" name="sale_product">
						
					</section>
					
					<section class="price_info_box" name="price_info_box" >
						<img alt="price_box" src="images/ord1_amout_bg.gif" width="100%">
						<div class="price_info" name="price_info" id="price_info" >
								<em id="result_price" name="result_price" >0</em> <!-- 주문금액 -->
								<em id="result_delivery" name="result_delivery" >0</em> <!-- 배송비 -->
								<em id="result_total" name="result_total" >0</em><!-- 예상 결제 금액 -->
						</div>
					</section>
						<div class="order_btn_box">					
							<input type = "button"  value="예약배송"> 
							<input type = "submit" value="주문하기" id="submit_order"><br><br>
						</div>
				   </form>
				   
   		</div>
   </section>
<%-- 	<footer>
		<div id = "footer">
	   	<jsp:include page="../Kokofarm_Main/mainfooter.jsp"></jsp:include>
	   	</div>
   </footer> --%> 

</body>
</html> 