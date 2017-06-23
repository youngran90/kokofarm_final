<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/orderproduct/css/orderproduct.css">
<script src="/resources/orderproduct/js/orderproduct.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
$(function(){
	
	//고객정보 라디오 버튼에 연동 (초기로딩  = 내 주소)
	$("input[name=orderfinish_member_name]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 고객이름
	$("input[name=mobileReceiver2]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 전화번호 중간 4자리
	$("input[name=mobileReceiver3]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 전화번호 마지막 4자리 
	$("input[name=recipientpost]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 우편번호
	$("input[name=address]").attr("readonly",true);  //초기 로딩시 각 태그 잠금 - 고객 주소
	$("input[name=address_sub]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 고객 상세 주소
	
	var db_id = $("select[name=mobileReceiver1]").attr("id"); //초기 로딩시 각 태그 잠금 - 고객 전화번호 앞자리 3자리를 가져온다
	
	$("select[name=mobileReceiver1]").val(db_id).attr("selected",true); //초기 로딩시 각 태그 잠금 - 고객 전화번호를 선택 시켜놓는다.
	$("select[name=mobileReceiver1]").val(db_id).attr("selected",true).attr("disabled",true); //초기 로딩시 각 태그 잠금 - 전화번호 010
	
	$("input[name=addr]").on('click',function(){
		var radio=$(this).val();
		
		if(radio == "다른주소지"){ // 각태그 잠금 해제 + 공백으로 만든다
			$("input[name=orderfinish_member_name]").val("");
			$("input[name=mobileReceiver2]").val("");
			$("input[name=mobileReceiver3]").val("");
			$("input[name=recipientpost]").val("");
			$("input[name=address]").val("");
			$("input[name=address_sub]").val("");
			
			$("input[name=orderfinish_member_name]").attr("readonly",false);
			$("input[name=mobileReceiver2]").attr("readonly",false);
			$("input[name=mobileReceiver3]").attr("readonly",false);
			$("input[name=recipientpost]").attr("readonly",false);
			$("input[name=address]").attr("readonly",false);
			$("input[name=address_sub]").attr("readonly",false);
			
			$("select[name=mobileReceiver1]").val("010").attr("selected",true).attr("disabled",false); //전화번호 앞자리 3개
		}else if(radio == "고객주소지"){ // 초기 화면이랑 동일 하게 셋팅f
			$("input[name=orderfinish_member_name]").val("${memberVO.member_name}");
			$("input[name=mobileReceiver2]").val("${phone1}");
			$("input[name=mobileReceiver3]").val("${phone2}");
			$("input[name=recipientpost]").val("${memberVO.member_zipcode}");
			$("input[name=address]").val("${memberVO.member_address1}");
			$("input[name=address_sub]").val("${memberVO.member_address2}");
			
			$("input[name=orderfinish_member_name]").attr("readonly",true);
			$("input[name=mobileReceiver2]").attr("readonly",true);
			$("input[name=mobileReceiver3]").attr("readonly",true);
			$("input[name=recipientpost]").attr("readonly",true);
			$("input[name=address]").attr("readonly",true);
			$("input[name=address_sub]").attr("readonly",true);
			
			$("select[name=mobileReceiver1]").val(db_id).attr("selected",true).attr("disabled",true); // 전화번호 앞자리 3개
		}
	})
})


	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<div class="container">
	<ul class="breadcrumb">
		<li><a href="/"><i class="fa fa-home"></i></a></li>
		<li><a href="/cart/cart">장바구니</a></li>
		<li><a href="#">주문하기</a></li>
	</ul>

	<section id="top_img_box" class="top_img_box">
		<img src="/../../resources/orderproduct/image/ord_top_con_step2.jpg"
			alt="top_img_box" width="1160px">
	</section>

	<div class="row">
		<!-- 왼쪽 탭 메뉴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div id="column-left" class="col-sm-3 hidden-xs column-left" style="display: none;">
			<div class="column-block">
				<div class="column-block">
					<div class="columnblock-title">Categories</div>
					<div class="category_block">
						<ul class="box-category treeview-list treeview">
							<li><a href="#" class="activSub">Desktops</a>
								<ul>
									<li><a href="#">PC</a></li>
									<li><a href="#">MAC</a></li>
								</ul></li>
							<li><a href="#" class="activSub">Laptops &amp; Notebooks</a>
								<ul>
									<li><a href="#">Macs</a></li>
									<li><a href="#">Windows</a></li>
								</ul></li>
							<li><a href="#" class="activSub">Components</a>
								<ul>
									<li><a href="#">Mice and Trackballs</a></li>
									<li><a href="#" class="activSub">Monitors</a>
										<ul>
											<li><a href="#">test 1</a></li>
											<li><a href="#">test 2</a></li>
										</ul></li>
									<li><a href="#">Windows</a></li>
								</ul></li>
							<li><a href="#">Tablets</a></li>
							<li><a href="#">Software</a></li>
							<li><a href="#">Phones & PDAs</a></li>
							<li><a href="#">Cameras</a></li>
							<li><a href="#">MP3 Players</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 왼쪽 탭 메뉴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

		<div class="col-sm-9" id="content">

			<section id="orderproduct_title" class="orderproduct_title">
				<div class="op_title" id="op_title">
					<h3 class="op_t">주문상태 정보</h3>
				</div>
			</section>

			<!-- 주문 내역 테이블 시작 -->
			<form method="post" id="orderproductform">
				<div class="table-responsive">
					<table class="table table-bordered" style="width: 1160px">
						<thead>
							<tr>
								<th class="text-center" width="470">상품명</th>
								<th class="text-center">배송비</th>
								<th class="text-center">가격</th>
								<th class="text-center" width="100">수량</th>
								<th class="text-center" width="150">주문 금액</th>
							</tr>
						</thead>
						<c:forEach var="order_list" items="${order_list }" varStatus="status">
							<em class="${status.count}p_amount" id="p_amount" >${order_list.product_total}개&nbsp;</em>
							<td style="display: none;"><input type="checkbox" id="${status.count }ac" name="product_no"	value="${order_list.product_no }">${order_list.product_no } 제품번호</td>
							<td style="display: none;"><input type="checkbox" id="dp" name="order_delivery_price" value="${order_list.order_delivery_price}" class="${status.count }dp">${order_list.order_delivery_price}배송비</td>	<!-- 배송비 값 submit -->
							<td style="display: none;"><input type="checkbox" id="order_product_amount" name="order_product_amount" value="${order_list.order_product_amount }" class="${status.count}opa">${order_list.order_product_amount }수량</td>
							<td style="display: none;"><input type="checkbox" id="tp" name="order_total_price" value="${order_list.order_total_price}" class="${status.count }tp">${order_list.order_total_price}금액</td><!-- 금액 값 submit -->
							<td style="display: none;"><input type="checkbox" id="pn" name="orderfinish_product_name" value="${order_list.product_name }" class="${status.count }pn">${order_list.product_name}</td><!-- 제품 이름 값 submit -->
							<td style="display: none;"><input type="checkbox" id="pp" name="orderfinish_product_price" value="${order_list.product_price }" class="${status.count }pp">${order_list.product_price }제품가격</td><!-- 제품 가격 값 submit -->
							<tbody>
								<tr>
									<td class="text-left">
										<a href="/product/detail_product?product_no=${order_list.product_no}"><img class="img-thumbnail" title="${order_list.product_name }" alt="${order_list.product_name }" src="/resources/files/attach/${order_list.product_mainimage} "></a>
										<a href="/product/detail_product?product_no=${order_list.product_no}" id="product_name">${order_list.product_name }</a>
										<span  class="${status.count}pnd"></span>
										<%-- <c:if test="${order_list.product_total==0}">
											<input type="button" name="delete" onclick="location.href='delete?product_no=${order_list.product_no }'"/>
										</c:if> --%>
									</td>
									<td class="text-center"><em class="delivery_price" id="${status.count }dp">${order_list.order_delivery_price }</em><b id="${status.count }dp_unit">원</b></td>
									<td class="text-center"><em class="product_price" id="${status.count }pp">${order_list.product_price }</em><b>원</b></td>
									<td class="text-center"><em class="order_product_amount" id="${status.count}opa">${order_list.order_product_amount }</em></td>
									<td class="text-center"><em class="total_price" id="${status.count }tp">${order_list.order_total_price}</em><b>원</b></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<input type="hidden" name="orderfinish_final_price" value="">
				<div class="result_info_box">
					<div class="inbox">
						<div class="price_info">
							<em class="result_price"></em><b>원</b>
						</div>
						<div class="delivery_info">
							<em class="result_delivery"></em><b>원</b>
						</div>
						<div class="total_info">
							<em class="result_total"></em><b>원</b>
						</div>
					</div>
				</div>

				<!-- 주문 내역 테이블 종료 -->
				<div id="accordion" class="panel-group" style="width: 1160px">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-option" aria-expanded="true">Step 1: 배송고객 정보 <i	class="fa fa-caret-down"></i></a>
							</h4>
						</div>
						<div id="collapse-checkout-option" role="heading" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
							<div class="panel-body">
								<div class="order_info02">
									<h4>받는 고객</h4>
								</div>
								<div class="recipient_customer01">
									<strong class="recipient_name">받으시는분</strong> <input type="text" class="input_recipientname" name="orderfinish_member_name" value="${memberVO.member_name}" placeholder=" 받으시는 분의 이름을 적어주세요" size="45"> 
									<label class="rd_label01"> 
										<input type="radio" id="addr01"	name="addr" class="addr01" value="다른주소지"> 
											<span></span> 
												다른 주소지
									</label> <label class="rd_label02"> <input type="radio" id="addr02" name="addr" class="addr02" checked="checked" value="고객주소지">										
											<span></span> 
												내 주소지
									</label>
								</div>
								<div class="recipient_customer02">
									<strong class="recipient_monile">휴대폰</strong>
									<select name="mobileReceiver1" id="${phone0}">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> 
										<span class="hyphen">-</span> 
									<input type="text" class="mobilerecipient2" name="mobileReceiver2" value="${phone1}" maxlength="4" size="7">
										<span class="hyphen">-</span> 
									<input type="text" class="mobilerecipient3" name="mobileReceiver3" value="${phone2}" maxlength="4" size="7">
									<strong class="recipient_phone">전화번호</strong>
									<select name="phoneReceiver1">
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
									</select> 
									<span class="hyphen">-</span> <input type="text" class="phonerecipient2" name="phoneReceiver2" value=""	maxlength="4" size="7"> 
										<span class="hyphen">-</span>
									<input type="text" class="phonerecipient3" name="phoneReceiver3" value="" maxlength="4" size="7">
								</div>
								<div class="recipient_customer03">
									<div class="post_addr">
										<strong class="recipient_addr">배송지</strong> 
										<input type="text" class="recipientpost" name="recipientpost" id="sample6_postcode" placeholder="우편번호"	value="${memberVO.member_zipcode}" size="25" readonly="readonly"> 
										<input type="button" class="post_btn" id="post_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									</div>
									<div class="sub_addr">
										<input type="text" class="address" name="address" id="sample6_address" readonly="readonly" value="${memberVO.member_address1}" required="" size="45">
										<input type="text" class="address_sub" name="address_sub" id="sample6_address2" value="${memberVO.member_address2}">
									</div>
									<div class="caption_info">
										<p class="caption"> * 주말, 공휴일에 회사로 배송이 되어 상품 수령을 하지 못하는 경우, 반송에 따른 <span>추가 배송비 및 추가 비용이 부과</span>될 수 있습니다.</p>
									</div>
									<div class="delivery_msg01">
										<strong class="msg_box">배송메시지</strong>
									</div>
									<div class="delivery_msg02">
										<input type="text" name="orderfinish_message" id="orderfinish_message" class="comment" placeholder="※배송메시지 기재 필수 사항" value="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>

<div class="panel panel-default" style="width: 1160px">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-confirm" aria-expanded="false">Step 2: 마일리지 확인/사용 <i	class="fa fa-caret-down"></i></a>
		</h4>
	</div>
	<div id="collapse-checkout-confirm" role="heading" class="panel-collapse collapse in" aria-expanded="true" style="">
		<div class="panel-body">
			<div class="order_result_area">
				<div class="result_box">
					<div class="order_result_price_info">
						<em class="order_result_price">0</em><b>원</b>
					</div>
					<div class="order_result_sel_info">
						<em class="order_result_price_sel">0</em><b>원</b>
					</div>
					<div class="order_result_total_info">
						<em class="order_result_price_total">0</em><b>원</b>
					</div>
				</div>
			</div>
			<div class="table-responsive" >
			<form method="POST" id="mileage" onsubmit="return false;">
				<div class="point_box">
					<div class="point_info">
						<strong>포인트 </strong><strong class="point_check">조회</strong>
					</div>
					<div class="point_result">
						<strong class="current_point">현재 포인트</strong><span id="point">${memberVO.member_point}</span>
					</div>
					<div class="point_use">
						<strong>사용 포인트 </strong><input type="text" value="0" size="5" maxlength="6" id="use" name="mileage_use">
					</div>
					<div class="use_btn">
						<strong>잔여<span></span></strong><strong class="point_count">사용</strong>
					</div>
				</div>
			</form>
				<div class="pay_list">
					<div class="pay_info">
						<form method="POST" id="creditcard">
						<ul class="pays">
							<li><input type="radio" name="pay" class="pay" value="creditcard"><span></span>신용카드</li>
							<li><input type="radio" name="pay" class="pay" value="kakaopay"><img src="/resources/orderproduct/image/kakaopay.png" alt="kakaopay"></li>
							<li><input type="radio" name="pay" class="pay" value="naverpay"><img src="/resources/orderproduct/image/naverpay.png" alt="naverpay"></li>
							<li><input type="radio" name="pay" class="pay" value="accounttransfer"><span></span>무통장입금</li>
						</ul>
						<div class="creditcard_info">
							<!-- 신용카드 -->
							<div class="creditcard_info01">
								<strong>카드 종류 </strong><select id="creditcards">
									<option value="none">&nbsp;&nbsp;==선택==</option>
									<option value="신한카드">&nbsp;신한카드</option>
									<option value="kosta카드">&nbsp;kosta카드</option>
									<option value="KB국민카드">&nbsp;KB국민카드</option>
									<option value="현대카드">&nbsp;현대카드</option>
								</select>
								<input type="hidden" name="creditcard_name" value="none">
							</div>
							<div class="creditcard_info02">
								<strong>할부 기간 </strong><select id="month">
									<option value="none">&nbsp;&nbsp;==선택==</option>
									<option value="singlepayment">&nbsp;일시불</option>
									<option value="2_free">&nbsp;2개월(무이자)</option>
									<option value="3_free">&nbsp;3개월(무이자)</option>
								</select>
								<input type="hidden" name="pay_month" value="none">
							</div>
							
							<div class="creditcard_info03">
								<p>* 과도한 구매는 언제든지 감사합니다.</p>
							</div>
						</div>
						</form>
						
						<div class="kakaopay_info">
							<!-- 카카오페이 -->
							<form method="POST" id="kakaopay">
							<div class="kakaopay_info01">
								<p>
									* 카카오페이 결제 서비스로 결제됩니다.<br> 결제후 세부 결제 내역은 카카오페이 구매내역을 확인하여
									주십시오.
							</div>
							<input type="hidden"name="pay" value="kakaopay">
							</form>
						</div>

						<div class="naverpay_info">
							<!-- 네이버 -->
							<form method="POST" id="naverpay">
							<div class="naverpay_info01">
								<p>
									* 네이버페이 간편결제 서비스로 결제됩니다.<br> 결제후 세부 결제내역은 네이버페이 구매내역을 확인하여
									주십시오.
							</div>
							<input type="hidden"name="pay" value="naverpay">
							</form>
						</div>

						<div class="payment_info">
							<!-- 무통장 입금 -->
							<form method="post" id="payment">
							<input type="hidden" name="pay" value="accounttransfer">
							<div class="payment_info01">
								<strong>입금계좌 선택 </strong><select id="bankaccount">
									<option value="none">&nbsp;&nbsp;==입금계좌 선택==</option>
									<option value="kostabank_123-4567-89-123">&nbsp;kosta은행&nbsp;123-4567-89-123(주)KokoFarm</option>
									<option value="kbank_123-4567-89-123">&nbsp;국민은행&nbsp;123-4567-89-123(주)KokoFarm</option>
									<option value="wbank_123-4567-89-123">&nbsp;우리은행&nbsp;123-4567-89-123(주)KokoFarm</option>
									<option value="ibank_123-4567-89-123">&nbsp;기업은행&nbsp;123-4567-89-123(주)KokoFarm</option>
								</select>
								<input type="hidden" name="pay_bank" value="none">
							</div>
							<div class="payment_info02">
								<strong>입금자명 </strong><input type="text" name="deposit_name" placeholder="입금자명을 적어주세요." size="20">
								<p>* 실제 입금자명과 정확히 일치하여야 정상 주문이 됩니다.</p>
							</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
			<div class="buttons">
				<div class="pull-right">
					<input type="button" data-loading-text="Loading..."	class="btn btn-primary" id="button-confirm" value="주문하기">
				</div>
			</div>

		</div>
	</div>
</div>

</div>
</div>
</div>
<%@include file="../include/footer.jsp"%>
