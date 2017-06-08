<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/orderproduct/css/orderproduct.css">
<script src="/resources/orderproduct/js/orderproduct.js"></script>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
  
  <section id="top_img_box" name="top_img_box">
	<img src="/../../resources/orderproduct/image/ord_top_con_step2.jpg" alt="top_img_box" width="100%">
  </section>

  <div class="row">
  <!-- 왼쪽 탭 메뉴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
      <div class="column-block">
        <div class="column-block">
          <div class="columnblock-title">Categories</div>
          <div class="category_block">
            <ul class="box-category treeview-list treeview">
              <li><a href="#" class="activSub">Desktops</a>
                <ul>
                  <li><a href="#">PC</a></li>
                  <li><a href="#">MAC</a></li>
                </ul>
              </li>
              <li><a href="#" class="activSub">Laptops &amp; Notebooks</a>
                <ul>
                  <li><a href="#">Macs</a></li>
                  <li><a href="#">Windows</a></li>
                </ul>
              </li>
              <li><a href="#" class="activSub">Components</a>
                <ul>
                  <li><a href="#">Mice and Trackballs</a></li>
                  <li><a href="#" class="activSub" >Monitors</a>
                    <ul>
                      <li><a href="#"  >test 1</a></li>
                      <li><a href="#"  >test 2</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Windows</a></li>
                </ul>
              </li>
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
    
     <section id="orderproduct_title" name="orderproduct_title">
				<div class="op_title" name="op_title">
					<h3 class="op_t">주문상태 정보</h3>
				</div>	
	 </section>
      
      <!-- 주문 내역 테이블 시작 -->
      <div class="table-responsive">
          <table class="table table-bordered" style="width: 940px">
            <thead>
              <tr>
                <th class="text-center" width="470">상품명</td>
                <th class="text-center">배송비</th>
                <th class="text-right">가격</th>
                <th class="text-center" width="100">수량</th>
                <th class="text-center" width="150">주문 금액</th>
              </tr>
            </thead>
            <tbody>
 
		<form enctype="multipart/form-data" method="post" action="/cart/orderproduct" id="cartForm">
            
        <c:forEach var="order_list" items="${order_list }" varStatus="status">
           <td style="display: none;"><input type="hidden" id="dp" name="order_delivery_price" value="0" class="${status.count }dp"></td> <!-- 배송비 값 submit -->
           <td style="display: none;"><input type="hidden" id="tp" name="order_total_price" value="0" class="${status.count }tp"></td> <!-- 금액 값 submit -->
           <td style="display: none;"><input type="hidden" class="${status.count}opa" id="order_product_amount" name="order_product_amount" value="${order_list.order_product_amount }" >${order_list.order_product_amount }</td>
              <tr>
              	<td class="text-center" style="display: none;">
              		<input type="checkbox" id="${status.count }ac" name="product_no" value ="${order_list.product_no }">
              	</td>
                <td class="text-left">
	                <a href="/product/detail_product?product_no=${order_list.product_no}"><img class="img-thumbnail" title="${order_list.product_name }" alt="${order_list.product_name }" src="/resources/files/attach/${order_list.product_mainimage} "></a>
	             	<a href="/product/detail_product?product_no=${order_list.product_no}" id="product_name">${order_list.product_name }</a>
                </td>
                <td class="text-center"><em class="delivery_price" id="${status.count }dp" >${order_list.order_delivery_price }</em><b id="${status.count }dp_unit">원</b></td>
                <td class="text-right"><em class="product_price" id="${status.count }pp">${order_list.product_price }</em><b>원</b></td>
                <td class="text-center">
	               <em class="order_product_amount" id="${status.count}opa" name="order_product_amount">${order_list.order_product_amount }</em>
                </td>
                <td class="text-center"><em class="total_price" id="${status.count }tp">${order_list.order_total_price}</em><b>원</b></td>
              </tr>
              </c:forEach>
              </form>
            </tbody>
          </table>
        </div>
            
      <div class="result_info_box">
      	<div class="inbox">
      		<div class="price_info"><em class="result_price"></em><b>원</b></div>
      		<div class="delivery_info"><em class="result_delivery"></em><b>원</b></div>
      		<div class="total_info"><em class="result_total"></em><b>원</b></div>
      	</div>
      </div>
      <!-- 주문 내역 테이블 종료 -->
      
      
      <div id="accordion" class="panel-group">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-option" aria-expanded="true">Step 1: 배송고객 정보 <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div id="collapse-checkout-option"  role="heading" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
            <div class="panel-body">
				<div class="order_info02">
            		<h4>받는 고객</h4>
            	</div>
				<div class="recipient_customer01">
					<strong class="recipient_name">받으시는분</strong>
							<input type="text" class="input_recipientname" name="namereceiver" value="" placeholder=" 받으시는 분의 이름을 적어주세요" size="45">
								<label class="rd_label01">
									<input type="radio" id="addr01" name="addr" class="addr01">
										<span></span>
											다른 주소지
								</label>
								<label class="rd_label02">
									<input type="radio" id="addr02" name="addr" class="addr02" checked="checked">
										<span></span>
											내 주소지
								</label>
				</div>
				<div class="recipient_customer02">
					<strong class="recipient_monile">휴대폰</strong>
							<!-- <input type="text" class="mobilerecipient1" name="mobileReceiver1" value="" maxlength="3" size="7"> -->
							<select name="mobileReceiver1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
								<span class="hyphen">-</span>
							<input type="text" class="mobilerecipient2" name="mobileReceiver2" value="" maxlength="4" size="7">
								<span class="hyphen">-</span>
							<input type="text" class="mobilerecipient3" name="mobileReceiver3" value="" maxlength="4" size="7">
					<strong class="recipient_phone">전화번호</strong>
						<!-- <input type="text" class="phonerecipient1" name="phoneReceiver1" value="" maxlength="3" size="7"> -->
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
							<span class="hyphen">-</span>
						<input type="text" class="phonerecipient2" name="phoneReceiver2" value="" maxlength="4" size="7">
							<span class="hyphen">-</span>
						<input type="text" class="phonerecipient3" name="phoneReceiver3" value="" maxlength="4" size="7">
				</div>
				<div class="recipient_customer03">
					<div class="post_addr">
						<strong class="recipient_addr">배송지</strong>
							<input type="text" class="recipientpost" name="recipientpost" id="sample6_postcode" placeholder="우편번호" value="" size="25" readonly="readonly">
							<input type="button" class="post_btn" id="post_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<div class="sub_addr">
							<input type="text" class="address" name="address" id="sample6_address" readonly="" value="" required"="" size="45">
							<input type="text" class="address_sub" name="address_sub" id="sample6_address2" value="" size="55">
					</div>
					<div class="caption_info">
						<p class="caption">* 주말, 공휴일에 회사로 배송이 되어 상품 수령을 하지 못하는 경우, 반송에 따른 <span>추가 배송비 및 추가 비용이 부과</span>될 수 있습니다. </p>
					</div>
					<div class="delivery_msg01">
						<strong class="msg_box">배송메시지</strong>
					</div>
					<div class="delivery_msg02">
							<textarea name="msg" class="comment" placeholder="※배송메시지 기재 필수 사항  
					1.선물의 경우 [선물용]이라는 문구 기재
					2.건물 1층 입구 비밀번호, 배송요청사항 등 구체적인 요청사항 "></textarea>
					</div>
				</div>
               </div>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-confirm" aria-expanded="false">Step 2: 마일리지 확인/사용  <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div id="collapse-checkout-confirm" role="heading" class="panel-collapse collapse in" aria-expanded="true" style="">
            <div class="panel-body">
              <div class="table-responsive">
            
              	<div class="point_box">
              			<span>내 마일리지 </span><button>조회하기</button>
              	</div>
              	
              	<div class="pay_list">
					 <ul class="pays">
					     <li><input type="radio" name="pay" class="pay" value="creditcard"><span></span>신용카드</li>
					     <li><input type="radio" name="pay" class="pay" value="kakaopay"><img src="/../../resources/orderproduct/image/kakaopay.png" alt="kakaopay"></li>
					     <li><input type="radio" name="pay" class="pay" value="naverpay"><img src="/../../resources/orderproduct/image/naverpay.png" alt="naverpay"></li>
					     <li><input type="radio" name="pay" class="pay" value="payment"><span></span>무통장입금</li>
					 </ul>
					 		<div class="pay_info">
					 			<div class="creditcard_info"> <!-- 신용카드 -->
							 		<div class="creditcard_info01">
								 		<strong>카드 종류 </strong><select id="creditcards">
								 			<option>&nbsp;&nbsp;==선택==</option>
								 			<option vlaue="신한카드">&nbsp;신한카드</option>
								 			<option vlaue="kosta카드">&nbsp;kosta카드</option>
								 			<option vlaue="KB국민카드">&nbsp;KB국민카드</option>
								 			<option vlaue="현대카드">&nbsp;현대카드</option>
								 		</select>
							 		</div>
							 		<div class="creditcard_info02">
							 			<strong>할부 기간  </strong><select id="month">
								 			<option>&nbsp;&nbsp;==선택==</option>
								 			<option value="2f">&nbsp;2개월(무이자)</option>
								 			<option value="3f">&nbsp;3개월(무이자)</option>
								 		</select>
							 		</div>
							 		<div class="creditcard_info03">
							 			<p>* 과도한 구매는 언제든지 감사합니다.</p>
							 		</div>
						 		</div>
						 		<div class="kakaopay_info"> <!-- 카카오페이 -->
						 			<div class="kakaopay_info01">
						 				<p>* 카카오페이 결제 서비스로 결제됩니다.<br> 결제후 세부 결제 내역은 카카오페이 구매내역을 확인하여 주십시오.
						 			</div>
						 		</div>
						 		
						 		<div class="naverpay_info"> <!-- 네이버 -->
						 			<div class="naverpay_info01">
						 				<p>* 네이버페이 간편결제 서비스로 결제됩니다.<br> 결제후 세부 결제내역은 네이버페이 구매내역을 확인하여 주십시오.
						 			</div>
						 		</div>
						 		
						 		<div class="payment_info"> <!-- 무통장 입금 -->
						 			<div class="payment_info01">
						 				<strong>입금계좌 선택  </strong><select id="bankaccount">
								 			<option>&nbsp;&nbsp;==입금계좌 선택==</option>
								 			<option value="k_123-4567-89-123">&nbsp;국민은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="w_123-4567-89-123">&nbsp;우리은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="i_123-4567-89-123">&nbsp;기업은행 123-4567-89-123(주)KokoFarm</option>
								 		</select>
						 			</div>
						 			<div class="payment_info02">
						 				<strong>입금자명 </strong><input type="text" placeholder="입금자명을 적어주세요." size="20">
						 				<p> * 실제 입금자명과 정확히 일치하여야 정상 주문이 됩니다.</p>
						 			</div>
						 		</div>
						 </div>
	               	</div>
              </div> 
              
              <div class="buttons">
                <div class="pull-right">
                  <input type="button" data-loading-text="Loading..." class="btn btn-primary" id="button-confirm" value="주문하기">
                </div>
              </div>
              
            </div>
          </div>
        </div>
	</div>
  </div>
</div>	
<%@include file="../include/footer.jsp"%>
