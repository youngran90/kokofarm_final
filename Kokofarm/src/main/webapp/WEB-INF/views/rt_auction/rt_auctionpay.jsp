<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/rt_auction/css/rt_auctionpay.css">
<script src="/resources/rt_auction/js/rt_auctionpay.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){
	//고객정보 라디오 버튼에 연동 (초기로딩  = 내 주소)
	$("input[name=recipient_name]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 고객이름
	$("input[name=mobileReceiver2]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 전화번호 중간 4자리
	$("input[name=mobileReceiver3]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 전화번호 마지막 4자리 
	$("input[name=recipientpost]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 우편번호
	$("input[name=address]").attr("readonly",true);  //초기 로딩시 각 태그 잠금 - 고객 주소
	$("input[name=address_sub]").attr("readonly",true); //초기 로딩시 각 태그 잠금 - 고객 상세 주소
	$("#post_btn").attr("disabled",true);
	
	var db_id = $("select[name=mobileReceiver1]").attr("id"); //초기 로딩시 각 태그 잠금 - 고객 전화번호 앞자리 3자리를 가져온다
	$("select[name=mobileReceiver1]").val(db_id).attr("selected",true); //초기 로딩시 각 태그 잠금 - 고객 전화번호를 선택 시켜놓는다.
	$("select[name=mobileReceiver1]").val(db_id).attr("selected",true).attr("disabled",true); //초기 로딩시 각 태그 잠금 - 전화번호 010
	
	$("input[name=addr]").on('click',function(){
		var radio=$(this).val();
		
		if(radio == "다른주소지"){ // 각태그 잠금 해제 + 공백으로 만든다
			$("input[name=recipient_name]").val("");
			$("input[name=mobileReceiver2]").val("");
			$("input[name=mobileReceiver3]").val("");
			$("input[name=recipientpost]").val("");
			$("input[name=address]").val("");
			$("input[name=address_sub]").val("");
			$("input[name=phoneReceiver2]").val("");
			$("input[name=phoneReceiver3]").val("");
			
			$("input[name=recipient_name]").attr("readonly",false);
			$("input[name=mobileReceiver2]").attr("readonly",false);
			$("input[name=mobileReceiver3]").attr("readonly",false);
			$("input[name=recipientpost]").attr("readonly",true);
			$("input[name=address]").attr("readonly",true);
			$("input[name=address_sub]").attr("readonly",false);
			
			$("select[name=mobileReceiver1]").val("010").attr("selected",true).attr("disabled",false); //전화번호 앞자리 3개
			
			$("#post_btn").attr("disabled",false);
		}else if(radio == "고객주소지"){ // 초기 화면이랑 동일 하게 셋팅f
			$("input[name=recipient_name]").val("${memberVO.member_name}");
			$("input[name=mobileReceiver2]").val("${phone1}");
			$("input[name=mobileReceiver3]").val("${phone2}");
			$("input[name=recipientpost]").val("${memberVO.member_zipcode}");
			$("input[name=address]").val("${memberVO.member_address1}");
			$("input[name=address_sub]").val("${memberVO.member_address2}");
			
			$("input[name=phoneReceiver2]").val("");
			$("input[name=phoneReceiver3]").val("");
			
			$("input[name=recipient_name]").attr("readonly",true);
			$("input[name=mobileReceiver2]").attr("readonly",true);
			$("input[name=mobileReceiver3]").attr("readonly",true);
			$("input[name=recipientpost]").attr("readonly",true);
			$("input[name=address]").attr("readonly",true);
			$("input[name=address_sub]").attr("readonly",true);
			
			$("select[name=mobileReceiver1]").val(db_id).attr("selected",true).attr("disabled",true); // 전화번호 앞자리 3개
			
			$("#post_btn").attr("disabled",true);
		}
	})
})



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
function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}
</script>




<div class="container">
  <ul class="breadcrumb">
    <li><a href="/"><i class="fa fa-home"></i></a></li>
    <li><a href="/auction/auction_list">일반 경매</a></li>
  </ul>
  
  <section id="top_img_box" class="top_img_box">
		<img src="/../../resources/orderproduct/image/ord_top_con_step2.jpg"
			alt="top_img_box" width="1135px">
  </section>
	
  <div class="row">
    <div class="col-sm-9" id="content">
    
      <form id="rt_auction_finish" method="POST" action="/rt_auction/rt_auctionfinish" style="width: 1150px;">
      
      <div class="rt_acution_info">
      	<strong id="rt_title">경매 번호</strong><strong id="rt_no">${rt_result_actionListVO.rt_auction_no}</strong>
      </div>
        <div class="table-responsive">
          <table class="table table-bordered" style="width: 1135px;">
            <thead>
              <tr style="background: #ef8829; color: white; font-weight: bold;">
                <td class="text-center">낙찰번호</td>
                <td class="text-center">구분</td>
                <td class="text-center">상품이미지</td>
                <td class="text-center">상품이름</td>
                <td class="text-center">단위</td>
                <td class="text-center">낙찰가</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-center">${rt_result_actionListVO.rt_tender_no}</td>
                	<input type="hidden" name="rt_tender_no" value="${rt_result_actionListVO.rt_tender_no}">
                <td class="text-center">${rt_result_actionListVO.rt_auction_group}</td>
                <td class="text-center"><a href="product.html"><img class="img-thumbnail" title="${rt_result_actionListVO.rt_auction_title_img}" alt="" src="/resources/files/attach/${list.rt_auction_title_img }" style="width: 100px; height: 100px;"></a></td>
                <td class="text-center"><strong id="rt_acution_name"><a href="#">${rt_result_actionListVO.rt_auction_name}</a></strong></td>
                <td class="text-center">${rt_result_actionListVO.rt_auction_unit}</td>
                <td class="text-center"><strong id="rt_acution_price01">${rt_result_actionListVO.rt_tender_price }</strong><strong id="rt_unit">원</strong></td>
                	<input type="hidden" name="price" value="${rt_result_actionListVO.rt_tender_price}">
              </tr>
            </tbody>
          </table>
        </div>
      
      
      
      <div id="accordion" class="panel-group">
        <!-- =================여기서부터 붙여넣기====================== -->
        
        <div class="panel panel-default" style="width: 1135px;">
          <div class="panel-heading">
            <h4 class="panel-title"><a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-option" aria-expanded="true">배송지  &amp 결제 수단 선택<i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div id="collapse-checkout-option"  role="heading" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
            <div class="panel-body" style="height: 750px;">
				<div class="order_info01">
            		<strong>배송지 정보</strong><em style="color: red; margin-left:10px; font-size: 10px;">*필수 입력사항입니다.</em>
            	</div>
            	
            	
				<div class="recipient_customer01">
					<strong class="recipient_name"><em id="necessary">*</em>받으시는분</strong>
							<input type="text" class="input_recipientname" name="recipient_name" value="${memberVO.member_name}" placeholder=" 받으시는 분의 이름을 적어주세요" size="45">
								<la1bel class="rd_label01">
									<input type="radio" id="addr01" name="addr" class="addr01" value="다른주소지">
										<span></span>
											다른 주소지
								</label>
								<label class="rd_label02">
									<input type="radio" id="addr02" name="addr" class="addr02" checked="checked" value="고객주소지">
										<span></span>
											내 주소지
								</label>
				</div>
				
				<div class="recipient_customer02">
					<strong class="recipient_monile"><em id="necessary">*</em>휴대폰</strong>
							<!-- <input type="text" class="mobilerecipient1" name="mobileReceiver1" value="" maxlength="3" size="7"> -->
							<select name="mobileReceiver1" id="${phone0}">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<!-- <input type="hidden" name="mobileReceiver1">  -->
								<span class="hyphen">-</span>
							<input type="text" class="mobilerecipient2" name="mobileReceiver2" value="${phone1}" maxlength="4" size="7" onkeydown="onlyNumber(this)">
								<span class="hyphen">-</span>
							<input type="text" class="mobilerecipient3" name="mobileReceiver3" value="${phone2}" maxlength="4" size="7" onkeydown="onlyNumber(this)">
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
						<input type="text" class="phonerecipient2" name="phoneReceiver2" value="" maxlength="4" size="7" onkeydown="onlyNumber(this)">
							<span class="hyphen">-</span>
						<input type="text" class="phonerecipient3" name="phoneReceiver3" value="" maxlength="4" size="7" onkeydown="onlyNumber(this)">
				</div>
				
				<div class="recipient_customer03">
					<div class="post_addr">
						<strong class="recipient_addr"><em id="necessary">*</em>배송지</strong>
							<input type="text" class="recipientpost" name="recipientpost" id="sample6_postcode" placeholder="우편번호" value="${memberVO.member_zipcode}" size="25" readonly="readonly">
							<input type="button" class="post_btn" id="post_btn" name="" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<div class="sub_addr">
							<input type="text" class="address" name="address" id="sample6_address" readonly="" value="${memberVO.member_address1}" required"="" size="45">
							<input type="text" class="address_sub" name="address_sub" id="sample6_address2" value="${memberVO.member_address2}" size="52">
					</div>
					<div class="caption_info">
						<p class="caption">* 주말, 공휴일에 회사로 배송이 되어 상품 수령을 하지 못하는 경우, 반송에 따른 <span>추가 배송비 및 추가 비용이 부과</span>될 수 있습니다. </p>
					</div>
					<div class="delivery_msg01">
						<strong class="msg_box">배송메시지</strong>
					</div>
					<div class="delivery_msg02">
							<input type="text" name="delivery_message" class="comment" placeholder=" ※배송메시지 기재 필수 사항  1.선물의 경우 [선물용] 2.건물 입구 비밀번호,배송요청사항 등 구체적인 요청사항 " value=""></textarea>
					</div>
				</div>
				<br>
				<div class="order_info01">
            		<strong>결제</strong>
            	</div>
            	
            	<div class="table-responsive">
              	<div class="pay_list">
					 <ul class="pays">
					     <li><input type="radio" name="pay" class="pay" value="신용카드" checked="checked">신용카드<span></span></li>
					     <li><input type="radio" name="pay" class="pay" value="kakaopay"><img src="/../../resources/orderproduct/image/kakaopay.png" alt="kakaopay"></li>
					     <li><input type="radio" name="pay" class="pay" value="naverpay"><img src="/../../resources/orderproduct/image/naverpay.png" alt="naverpay"></li>
					     <li><input type="radio" name="pay" class="pay" value="무통장입금"><span></span>무통장입금</li>
					 </ul>
					 		<div class="pay_info">
					 			<div class="creditcard_info"> <!-- 신용카드 -->
							 		<div class="creditcard_info01">
								 		<strong>카드 종류 </strong><select id="creditcards" name="creditcard_name">
								 			<option value="none">&nbsp;&nbsp;==선택==</option>
								 			<option value="신한카드">&nbsp;신한카드</option>
								 			<option value="kosta카드">&nbsp;kosta카드</option>
								 			<option value="KB국민카드">&nbsp;KB국민카드</option>
								 			<option value="현대카드">&nbsp;현대카드</option>
								 		</select>
								 			<em id="creditcard_name" style="display: none">none</em>
							 		</div>
							 		
							 		<div class="creditcard_info02">
							 			<strong>할부 기간  </strong><select id="month" name="pay_month">
								 			<option value="none">&nbsp;&nbsp;==선택==</option>
								 			<option value="일시불">&nbsp;일시불</option>
								 			<option value="2개월(무이자)">&nbsp;2개월(무이자)</option>
								 			<option value="3개월(무이자)">&nbsp;3개월(무이자)</option>
								 		</select>
								 			<em id="pay_month"style="display: none;">none</em>
							 		</div>
							 		<div class="creditcard_info03">
							 			<p>* 과도한 구매는 언제든지 감사합니다.</p>
							 	    </div>
						 		</div>
						 		
						 		<div class="kakaopay_info"> <!-- 카카오페이 -->
						 			<div class="kakaopay_info01">
						 				<p>* 카카오페이 결제 서비스로 결제됩니다.<br> 결제후 세부 결제 내역은 카카오페이 구매내역을 확인하여 주십시오.
						 			</div>
						 			<!-- <input type="hidden"name="pay" value="kakaopay" id="kakaopay"> -->
						 		</div>
						 		
						 		<div class="naverpay_info"> <!-- 네이버 -->
						 			<div class="naverpay_info01">
						 				<p>* 네이버페이 간편결제 서비스로 결제됩니다.<br> 결제후 세부 결제내역은 네이버페이 구매내역을 확인하여 주십시오.
						 			</div>
						 			<!-- <em name="pay" value="naverpay" id="naverpay"> -->
						 		</div>
						 		
						 		<div class="payment_info"> <!-- 무통장 입금 -->
						 		<!-- <input type="hidden" name="pay" value="accounttransfer"> -->
						 			<div class="payment_info01">
						 				<strong>입금계좌 선택  </strong><select id="bankaccount" name="pay_bank">
								 			<option value="none">&nbsp;&nbsp;==입금계좌 선택==</option>
								 			<option value="국민은행 123-4567-89-123(주)KokoFarm">&nbsp;국민은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="우리은행 123-4567-89-123(주)KokoFarm">&nbsp;우리은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="기업은행 123-4567-89-123(주)KokoFarm">&nbsp;기업은행 123-4567-89-123(주)KokoFarm</option>
								 			<option value="Kosta123-4567-89-123(주)KokoFarm">&nbsp;Kosta은행 123-4567-89-123(주)KokoFarm</option>
								 		</select>
								 			<em id="pay_bank" style="display: none;">none</em>
						 			</div>
						 			<div class="payment_info02">
						 				<strong>입금자명 </strong><input type="text" name="deposit_name" placeholder="입금자명을 적어주세요." size="20" value="">
						 				<p> * 입금자명을 꼭 적어 주세요 </p>
						 			</div>
						 		</div>
					</div>
							 <table class="table table-bordered" id="price_info" style="width: 180px;">
							            <tbody>
							               <tr>
							                <td class="text-right"><strong>소계:</strong></td>
							                <td class="text-right"><strong id="rt_acution_price02">${rt_result_actionListVO.rt_tender_price }</strong><strong id="rt_unit">원</strong></td>
							              </tr>
							              <tr>
							                <td class="text-right"><strong>총 합계: </strong></td>
							                <td class="text-right"><strong id="rt_acution_price03">${rt_result_actionListVO.rt_tender_price }</strong><strong id="rt_unit">원</strong></td>
							              </tr>
							            </tbody>
							  </table>
							  <div class="buttons">
							        <div class="pull-right"><input type="button" id="submitPay" class="btn btn-primary" name="결제하기" value="결제하기"></div>
						      </div>
				 </div>
            </div>
          </div>
     	 </div>
      
        </div>
      </div>  
      
      </form>
    </div>
  </div>
</div>

<%@include file="../include/footer.jsp"%>
</body>
</html>