<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/tenderpay/css/tenderpay.css">
<script src="/resources/tenderpay/js/tenderpay.js"></script>
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
    
    function startpay(){
    	var recipient = $('#recipientId').val();
    	var mobilerec2 = $('#mobilerec2').val();
    	var mobilerec3 = $('#mobilerec3').val();
    	var recipientpost = $('.recipientpost').val();
    	var address = $('.address').val();
    	var address_sub = $('.address_sub').val();
    	var comment = $('.comment').val();
    	
    	if(recipient ==''){
    		alert('받으시는 분의 이름을 입력해주세요.');
    	}else if(mobilerec2 =='' || mobilerec3==''){
    		alert('휴대폰번호를 입력해주세요.');
    	
    	}else if(recipientpost =='' || address =='' || address_sub=='' ){
    		alert('배송지를 입력해주세요.');
    	}else if(comment==''){
    		alert('배송메세지를 입력해주세요.');
    	}else{
    	
    		$('#payform').submit();
    	}
    	
    }
   
    /* $('#submitPay').on('click',function(){
     var recipient = $('#recipientId').val();
    
    	if(recipient ==null){
    		alert('받으시는 분의 이름을 적어주세요.');
    	}
    	
    }); */
</script>



<div class="container">
  <ul class="breadcrumb">
    <li><a href="index.html"><i class="fa fa-home"></i></a></li>
    <li><a href="cart.html">장바구니</a></li>
  </ul>
  <div class="row">
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
        <h3 class="productblock-title">Bestsellers</h3>
        <div class="row bestseller-grid product-grid">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/2product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
                <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/3product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
                <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/4product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
                <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-9" id="content">
      <form id="payform" action="paycomplete" method="post">
      <h1><strong>경매 상품 </strong></h1>
      <br>
      <!-- <form enctype="multipart/form-data" method="post" action="#"> -->
        <div class="table-responsive">
          <table class="table table-bordered" style="width: 1000px;">
            <thead>
              <tr style="background: #ef8829; color: white; font-weight: bold;">
                <td class="text-center">낙찰번호</td>
                <td class="text-center">구분</td>
                <td class="text-center">상품이미지</td>
                <td class="text-center">상품이름</td>
                <td class="text-center">단위</td>
                <td class="text-center">가격</td>
                <td class="text-center">경매번호</td>
                <td class="text-center">Total</td>
                <!-- <td class="text-right"></td> -->
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-center">${successPay.success_no}</td>
                <input type="hidden" name="success_no" value="${successPay.success_no}">
                <td class="text-center">${successPay.auction_group}</td>
                <td class="text-center"><a href="product.html"><img class="img-thumbnail" title="${successPay.auction_name}" alt="" src="/resources/files/attach/${auction_title_img }" style="width: 100px; height: 100px;"></a></td>
                <td class="text-center"><a href="product.html">${successPay.auction_name}</a></td>
                <td class="text-center">${successPay.auction_unit}</td>
                <td class="text-center">${successPay.tender_price }원</td>
                <!-- <td class="text-left"><div style="max-width: 200px;" class="input-group btn-block">
                    <input type="text" class="form-control quantity" size="1" value="1" name="quantity">
                    <span class="input-group-btn">
                    <button class="btn btn-primary" title="" data-toggle="tooltip" type="submit" data-original-title="Update"><i class="fa fa-refresh"></i></button>
                    <button  class="btn btn-danger" title="" data-toggle="tooltip" type="button" data-original-title="Remove"><i class="fa fa-times-circle"></i></button>
                    </span></div></td> -->
                    <td class="text-center">${successPay.auction_no}</td>
                <td class="text-center">${successPay.tender_price }원</td>
                <input type="hidden" name="price" value="${successPay.tender_price}">
               <!--  <td class="text-right"></td> -->
              </tr>
            </tbody>
          </table>
        </div>
      <!-- </form> -->
      <h2><strong>배송 정보</strong></h2>
      <p style="color: red;">* 필수 입력사항입니다.</p>
      
      
      <div id="accordion" class="panel-group">
        <!-- =================여기서부터 붙여넣기====================== -->
        
        
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-option" aria-expanded="true">배송지  &amp 결제 수단 선택<i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div id="collapse-checkout-option"  role="heading" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
            <div class="panel-body">
				<div class="order_info02">
            		<h4>배송지 정보</h4>
            	</div>
            	
            	
				<div class="recipient_customer01">
					<strong class="recipient_name"><span style="color: red;">*</span> 받으시는분</strong>
							<input type="text" id="recipientId" class="input_recipientname" name="recipient" value="" placeholder=" 받으시는 분의 이름을 적어주세요" size="45">
							  <%-- <c:if test="${recipient ==null }">
							    <script type="text/javascript">
							      alert('받으시는분의 이름을 입력하세요.');
							    </script>
							  </c:if> --%>
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
					<strong class="recipient_monile"><span style="color: red;">*</span> 휴대폰</strong>
							<!-- <input type="text" class="mobilerecipient1" name="mobileReceiver1" value="" maxlength="3" size="7"> -->
							<select name="phone_no">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<!-- <input type="hidden" name="mobileReceiver1">  -->
								<span class="hyphen">-</span>
							<input type="text" id="mobilerec2" class="mobilerecipient2" name="mobileReceiver2" value="" maxlength="4" size="7">
								<span class="hyphen">-</span>
							<input type="text" id="mobilerec3" class="mobilerecipient3" name="mobileReceiver3" value="" maxlength="4" size="7">
					<strong class="recipient_phone"><span> </span> 전화번호</strong>
						<!-- <input type="text" class="phonerecipient1" name="phoneReceiver1" value="" maxlength="3" size="7"> -->
						<select name="tel_no">
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
						<strong class="recipient_addr"><span style="color: red;">*</span> 배송지</strong>
							<input type="text" class="recipientpost" name="recipientpost" id="sample6_postcode" placeholder="우편번호" value="" size="25" readonly="readonly">
							<input type="button" class="post_btn" id="post_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<div class="sub_addr">
							<input type="text" class="address" name="ship_area" id="sample6_address" readonly="" value="" required"="" size="45">
							<input type="text" class="address_sub" name="address_sub" id="sample6_address2" value="" size="55">
					</div>
					<div class="caption_info">
						<p class="caption">* 주말, 공휴일에 회사로 배송이 되어 상품 수령을 하지 못하는 경우, 반송에 따른 <span>추가 배송비 및 추가 비용이 부과</span>될 수 있습니다. </p>
					</div>
					<div class="delivery_msg01">
						<strong class="msg_box"><span style="color: red;">*</span> 배송메시지</strong>
					</div>
					<div class="delivery_msg02">
							<textarea name="ship_msg" class="comment" placeholder="※배송메시지 기재 필수 사항  
					                                                                                                                            ex) 1.선물의 경우 [선물용]이라는 문구 기재     2.건물 1층 입구 비밀번호, 배송요청사항 등 구체적인 요청사항 "></textarea>
					</div>
				</div>
				<br>
				<div class="order_info02">
            		<h4>결제</h4>
            	</div>
            	
            	<div class="table-responsive">
            <!-- 
              	<div class="point_box">
              			<span>내 마일리지 </span><button>조회하기</button>
              	</div>
              	 -->
              	<div class="pay_list" style="margin-left: 150px;">
					 <ul class="pays">
					     <li><input type="radio" name="pay_sort" class="pay" value="신용카드"><span></span>신용카드</li>
					     <li><input type="radio" name="pay_sort" class="pay" value="kakaopay"><img src="/../../resources/orderproduct/image/kakaopay.png" alt="kakaopay"></li>
					     <li><input type="radio" name="pay_sort" class="pay" value="naverpay"><img src="/../../resources/orderproduct/image/naverpay.png" alt="naverpay"></li>
					     <li><input type="radio" name="pay_sort" class="pay" value="무통장입금"><span></span>무통장입금</li>
					 </ul>
					 <%-- <c:if test="$('input[type='radio'][name='pay']:checked').val()==신용카드">
					   <input type="hidden" name="pay_sort" value="신용카드">
					 </c:if>
					 <script>
					   var pay_sort = $("input[type='radio'][name='pay']:checked").val();
					   alert(pay_sort);
					
					 </script>
					 <input type="hidden" name="pay_sort" value="$('input[type='radio'][name='pay']:checked').val()"> --%>
					 		<div class="pay_info">
					 			<div class="creditcard_info"> <!-- 신용카드 -->
							 		<div class="creditcard_info01">
								 		<strong>카드 종류 </strong><select id="creditcards" name="card_sort">
								 			<option>&nbsp;&nbsp;==선택==</option>
								 			<option value="신한카드">&nbsp;신한카드</option>
								 			<option value="kosta카드">&nbsp;kosta카드</option>
								 			<option value="KB국민카드">&nbsp;KB국민카드</option>
								 			<option value="현대카드">&nbsp;현대카드</option>
								 		</select>
							 		</div>
							 		
							 		<div class="creditcard_info02">
							 			<strong>할부 기간  </strong><select id="month" name="period">
								 			<option>&nbsp;&nbsp;==선택==</option>
								 			<option value="2개월(무이자)">&nbsp;2개월(무이자)</option>
								 			<option value="3개월(무이자)">&nbsp;3개월(무이자)</option>
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
						 				<strong>입금계좌 선택  </strong><select id="bankaccount" name="account">
								 			<option>&nbsp;&nbsp;==입금계좌 선택==</option>
								 			<option value="국민은행 123-4567-89-123(주)KokoFarm">&nbsp;국민은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="우리은행 123-4567-89-123(주)KokoFarm">&nbsp;우리은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="기업은행 123-4567-89-123(주)KokoFarm">&nbsp;기업은행 123-4567-89-123(주)KokoFarm</option>
								 		</select>
						 			</div>
						 			<div class="payment_info02">
						 				<strong>입금자명 </strong><input type="text" name="deposit_name" placeholder="입금자명을 적어주세요." size="20">
						 				<p> * 실제 입금자명과 정확히 일치하여야 정상 주문이 됩니다.</p>
						 			</div>
						 		</div>
						 </div>
						</div>
					</div>
            	
				 </div>
            </div>
          </div>
       
       <!-- ==================이거 아님!!!!!!!!!!!!!위에꺼!!!!!!!!!!================ -->
       <div class="panel panel-default" style="display: none;">
          <div class="panel-heading">
            <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-confirm" aria-expanded="false">Step 2: 결제 수단 선택 <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div id="collapse-checkout-confirm" role="heading" class="panel-collapse collapse in" aria-expanded="true" style="">
            <div class="panel-body">
              <div class="table-responsive">
            <!-- 
              	<div class="point_box">
              			<span>내 마일리지 </span><button>조회하기</button>
              	</div>
              	 -->
              	<div class="pay_list" style="margin-left: 50px;">
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
								 			<option value="신한카드">&nbsp;신한카드</option>
								 			<option value="kosta카드">&nbsp;kosta카드</option>
								 			<option value="KB국민카드">&nbsp;KB국민카드</option>
								 			<option value="현대카드">&nbsp;현대카드</option>
								 		</select>
							 		</div>
							 		
							 		<div class="creditcard_info02">
							 			<strong>할부 기간  </strong><select id="month">
								 			<option>&nbsp;&nbsp;==선택==</option>
								 			<option value="2개월(무이자)">&nbsp;2개월(무이자)</option>
								 			<option value="3개월(무이자)">&nbsp;3개월(무이자)</option>
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
								 			<option value="국민은행 123-4567-89-123(주)KokoFarm">&nbsp;국민은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="우리은행 123-4567-89-123(주)KokoFarm">&nbsp;우리은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="기업은행 123-4567-89-123(주)KokoFarm">&nbsp;기업은행 123-4567-89-123(주)KokoFarm</option>
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
		 		</div>
		 		</div>
	 		</div>
	 		      
        <div class="panel panel-default" style="display: none;">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-parent="#accordion" data-toggle="collapse" class="accordion-toggle" href="#collapse-coupon">Use Coupon Code <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-coupon" >
            <div class="panel-body">
              <label for="input-coupon" class="col-sm-3 control-label">Enter your coupon here</label>
              <div class="input-group">
                <input type="text" class="form-control" id="input-coupon" placeholder="Enter your coupon here" value="" name="coupon">
                <span class="input-group-btn">
                <input type="button" class="btn btn-primary" data-loading-text="Loading..." id="button-coupon" value="Apply Coupon">
                </span></div>
            </div>
          </div>
        </div>
        <div class="panel panel-default" style="display: none;">
          <div class="panel-heading">
            <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-voucher">Use Gift Voucher <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-voucher">
            <div class="panel-body">
              <label for="input-voucher" class="col-sm-3 control-label">Enter your gift voucher code here</label>
              <div class="input-group">
                <input type="text" class="form-control" id="input-voucher" placeholder="Enter your gift voucher code here" value="" name="voucher">
                <span class="input-group-btn">
                <input type="submit" class="btn btn-primary" data-loading-text="Loading..." id="button-voucher" value="Apply Voucher">
                </span> </div>
            </div>
          </div>
        </div>
        <div class="panel panel-default" style="display: none;">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-parent="#accordion" data-toggle="collapse" class="accordion-toggle" href="#collapse-shipping"> <strong>배송정보 입력</strong> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-shipping">
            <div class="panel-body">
              <p>배송지 정보</p>
             <!-- <form class="form-horizontal"> -->
                <input type="checkbox" name="주문자와동일" value="주문자와동일"> 주문자와 동일
                <div class="form-group required">
                  <label for="input-postcode" class="col-sm-2 control-label">수령인</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="input-postcode" placeholder="수령인" value="" name="postcode">
                  </div>
                </div>
                <div class="form-group required">
                  <label for="input-postcode" class="col-sm-2 control-label">연락처</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="input-postcode" placeholder="연락처" value="" name="postcode">
                  </div>
                </div>
                <div class="form-group required">
                  <label for="input-country" class="col-sm-2 control-label">배송지</label>
                  <div class="col-sm-10">
                    <select class="form-control" id="input-country" name="country_id">
                      
                    </select>
                  </div>
                </div>
                
                
                
                
                <!-- <div class="form-group required">
                  <label for="input-zone" class="col-sm-2 control-label">Region / State</label>
                  <div class="col-sm-10">
                    <select class="form-control" id="input-zone" name="zone_id">
                      
                    </select>
                  </div>
                </div> -->
                 <div class="form-group required" style="display: none;">
                  <label for="input-postcode" class="col-sm-2 control-label">배송메시지</label>
                  <div class="col-sm-10">
                   <select class="form-control" id="input-zone" name="zone_id">
                      <option value=""> --- 배송 메시지를 선택해주세요. --- </option>
                      <option value="1">배송 전 연락주세요.</option>
                      <option value="2">경비실에 맡겨주세요.</option>
                      <option value="3">앞 편의점에 맡겨주세요.</option>
                      <option value="4">부재 시 연락주세요.</option>
                    </select>
                    <input type="text" class="form-control" id="input-postcode" placeholder="기타 입력사항" value="" name="postcode">
                  </div>
                </div>
                <input type="button" class="btn btn-primary" data-loading-text="Loading..." id="button-quote" value="Get Quotes" style="display: none;">
              <!-- </form>  -->
            </div>
          </div>
        </div>
     
      </div>
      <br>
      <div class="row" style="margin-left: 150px;">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered" style="width: 300px;">
            <tbody>
               <tr>
                <td class="text-right"><strong>소계</strong></td>
                <td class="text-right">${successPay.tender_price }원</td>
              </tr>
              <tr>
                <td class="text-right"><strong>할인금액</strong></td>
                <td class="text-right">0원</td>
              </tr>
              <tr>
                <td class="text-right"><strong>배송금액</strong></td>
                <td class="text-right">0원</td>
              </tr>
              <tr>
                <td class="text-right"><strong>총 합계: </strong></td>
                <td class="text-right">${successPay.tender_price }원</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>  
      <div class="buttons">
        <div class="pull-left"><a class="btn btn-default" href="../auction/auction_list">경매상품보기</a></div>
        <div class="pull-right" style="margin-right: 80px;"><input type="button" id="submitPay" class="btn btn-primary" name="결제하기" value="결제하기" onclick="startpay()"></div>
      </div>
      </form>
    </div>
  </div>
</div>

<%@include file="../include/footer.jsp"%>
</body>
</html>