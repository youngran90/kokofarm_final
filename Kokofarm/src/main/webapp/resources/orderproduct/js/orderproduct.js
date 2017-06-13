$(function() {
	// ajax 전송
	$("#creditcards").on('click', function() {
		var creditcards = $(this).val();
		$("input[name=creditcard_name]").val(creditcards);
	}) // 카드 이름

	$("#month").on('click', function() {
		var month = $(this).val();
		$("input[name=pay_month]").val(month);
	}); // 할부 개월

	$("#bankaccount").on('click', function() {
		var bankaccount = $(this).val();
		$("input[name=pay_bank]").val(bankaccount);
	}) // 은행 이름
	
	var db_id = $("select[name=mobileReceiver1]").attr("id");
	$("#button-confirm").on('click', function() {
		var payments = $("input[name=pay]:checked").val();// 결제방법
		
		if (payments == null) {
			alert("결제 방법을 선택해주세요.");
		} else {
			$("em[id=p_amount]").each(function(i){
				var index = i + 1;
				var opa = parseInt($("input[class="+index+"opa]").val());
				var name= $("input[class="+index+"pn]").val();
				var db_price = parseInt($(this).text());
				
				if(db_price < opa){// 13 < 7
					var check = confirm("제품명 : "+name+"\n현재 재고량 : "+db_price+"\n죄송합니다. 재고가 부족하여 구매하실수 없습니다. " +
							"\n\n해당 제품을 삭제후 구매하시거나 \n장바구니로 가셔서 해당 품목을 삭제후 구매해 주세요.\n  <  확인을 누르면 장바구니로 이동합니다.  >");
					if(check){
						location.href="/cart/cart";
					}
					return false;
					$(location).attr("href", "/orderproduct/orderproduct");
				}else{
					
					$("select[name=mobileReceiver1]").val(db_id).attr("selected",true).attr("disabled", false); // 전화번호 앞자리 3개

					var orderfinish = $("#orderproductform").serialize();
					var url01 = "/orderproduct/orderproduct";

					var mileage = $("#mileage").serialize();
					var url02 = "/orderproduct/mileage";

					var url03 = "/orderproduct/payment";
					
					$.ajax({
						type : 'POST',
						url : url01,
						data : orderfinish, // 구매 리스트 + 개인정보 폼
						dataType : 'html',
						success : function(data) {
							alert("결제되었습니다.");
							$(location).attr("href", "/orderproduct/orderfinish");
						}// 구매 리스트 + 개인정보 ajax 종료 (성공함수)
					})// 구매 리스트 + 개인정보 ajax종료

					$.ajax({
						type : "POST",
						url : url02,
						data : mileage, // 마일리지 폼
						dataType : 'text',
						success : function(data) {
						} // 마일리지 ajax 종료(성공함수)
					})// 마일리지 ajax 종료

					if (payments == "creditcard") {
						var credit = $("input[name=creditcard_name]").val();
						var month = $("input[name=pay_month]").val();
						if (credit == "none" || month == "none") {
							alert("카드 / 기간을 선택해주세요.");
						} else {
							var pay = $("#creditcard").serialize();
							$.ajax({
								type : 'POST',
								url : url03,
								data : pay, // 신용카드 정보
								dataType : 'html',
								success : function(data) {
								}// 신용카드 정보 (성공함수)
							})
						}
					} else if (payments == "kakaopay") {
						var pay = $("#kakaopay").serialize();
						$.ajax({
							type : 'POST',
							url : url03,
							data : pay, // kakaopay 정보
							dataType : 'text',
							success : function(data) {
								alert("결제되었습니다.");
								$(location).attr("href", "/orderproduct/orderfinish");
							}// 신용카드 정보 (성공함수)
						})
					} else if (payments == "naverpay") {
						var pay = $("#naverpay").serialize();
						$.ajax({
							type : 'POST',
							url : url03,
							data : pay, // naverpay 정보
							dataType : 'text',
							success : function(data) {
							}// 신용카드 정보 (성공함수)
						})
					} else if (payments == "accounttransfer") {
						var bank = $("input[name=pay_bank]").val();
						var name = $("input[name=deposit_name]").val();
						if (bank == "none" || name == "") {
							alert("계좌 / 이름을 작성해주세요.");
						} else {
							var pay = $("#payment").serialize();
							$.ajax({
								type : 'POST',
								url : url03,
								data : pay, // 무통장입금 정보
								dataType : 'html',
								success : function(data) {
								}// 신용카드 정보 (성공함수)
							})
						}
					} // ajax종료
					return false;
				}
			}); // 반복 종료
					
		}
	})

	var size = $(".total_price").length;

	var price_sum = 0;
	var delivery_sum = 0;
	// 주문 1차 정보 이미지 박스 각각의 총합
	$(".total_price").each(function(i) {
		var index = i + 1;
		var price = $(this).text();
		var price_c = numberReplace(price);
		var delivery = $("em[id=" + index + "dp]").text();

		var delivery_c = numberReplace(delivery);

		if (index <= size) {
			price_sum += parseInt(price_c);
			delivery_sum += parseInt(delivery_c);
		}
	})

	var price_sum_c = numberFormat(price_sum);
	$(".result_price").text(price_sum_c);

	var delivery_sum_c = numberFormat(delivery_sum);
	$(".result_delivery").text(delivery_sum_c);

	var total_sum = price_sum + delivery_sum;
	var total_sum_c = numberFormat(total_sum);
	$(".result_total").text(total_sum_c);

	// ///////////////////////////////////////////////
	// 각 금액 , 표시
	$(".total_price").each(
			function(i) {
				var index = i + 1;
				var cnt = $(this).attr("id");

				if (index + "tp" == cnt) {
					$("em[id=" + index + "dp]").text(
							numberFormat($("em[id=" + index + "dp]").text()));
					$("em[id=" + index + "pp]").text(
							numberFormat($("em[id=" + index + "pp]").text()));
					$("em[id=" + index + "tp]").text(
							numberFormat($("em[id=" + index + "tp]").text()));
				}
			})

	// 정규화 함수(천의 자리마다 ,)
	function numberFormat(number) { // 3 자리수 마다 , 표시
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 정규화 함수(,제거)
	function numberReplace(number) {
		return number.replace(/[^0-9]/g, "");
	}

	// 배송비 표시 제품 금액에 연동..
	$(".delivery_price").each(function(i) {
		var index = i + 1;
		var cnt = $(this).attr("id");

		var delivery_price = $(this).text();
		var delivery_price_c = numberReplace(delivery_price);

		var total_price = $("em[id=" + index + "tp]").text();
		var total_price_c = numberReplace(total_price);

		if (index + "dp" == cnt) {
			if (total_price_c >= 50000) {
				$(this).text("무료 배송");
				$("b[id=" + index + "dp_unit]").text("");
			} else if (delivery_price_c == 0) {
				$(this).text("무료 배송");
				$("b[id=" + index + "dp_unit]").text("");
			}
		}

	})

	// 결제 수단 정보 박스
	$(".creditcard_info").hide();
	$(".kakaopay_info").hide();
	$(".naverpay_info").hide();
	$(".payment_info").hide();

	$(".pay").on('click', function() {
		var radio = $(this).val();

		if (radio == "creditcard") {
			$(".creditcard_info").show();
			$(".kakaopay_info").hide();
			$(".naverpay_info").hide();
			$(".payment_info").hide();
		} else if (radio == "kakaopay") {
			$(".creditcard_info").hide();
			$(".kakaopay_info").show();
			$(".naverpay_info").hide();
			$(".payment_info").hide();
		} else if (radio == "naverpay") {
			$(".creditcard_info").hide();
			$(".kakaopay_info").hide();
			$(".naverpay_info").show();
			$(".payment_info").hide();
		} else if (radio == "accounttransfer") {
			$(".creditcard_info").hide();
			$(".kakaopay_info").hide();
			$(".naverpay_info").hide();
			$(".payment_info").show();
		}
	})

	// 포인트 조회
	$(".point_result").hide();

	$(".point_result span").text(numberFormat($(".point_result span").text()));

	$(".point_check").on("click", function() {
		$(".point_result").show();
		$("#use").focus();
	})

	// 최종 금액 정보 박스
	$(".order_result_price").text($(".result_total").text());
	$(".order_result_price_total").text($(".order_result_price").text());

	// 최종 금액 ( 마일리지 구하기 위한 가격 , 모든 제품가격을 더한것...)
	$("input[name=orderfinish_final_price]").val(
			$(".result_price").text().replace(/[^0-9]/g, ""));

	// 포인트 사용 + 총합 구하기
	var point = parseInt($("#point").text().replace(/[^0-9]/g, "")); //현재포인트
	var order_result_price = parseInt($(".order_result_price").text().replace(/[^0-9]/g, "")); //포인트 차감 금액
	

	$(".point_count").on('click',function() {
				var use_point = parseInt($("#use").val()); //사용할 마일리지
				if (point < use_point) {
					alert("포인트 부족");
					$("#use").val(0);
					$(".order_result_price_sel").text(0);
					$(".order_result_price_total").text(numberFormat(order_result_price));
					$(".use_btn span").text(numberFormat(point));
				} else if (use_point < 0) {
					alert("0 이하 입력불가");
					$("#use").val(0);
					$(".order_result_price_sel").text(0);
					$(".order_result_price_total").text(numberFormat(order_result_price));
					$(".use_btn span").text(numberFormat(point));
				}else if(use_point > order_result_price){
					alert("초과할 수 없습니다.");
					$("#use").val(0);
				}else {
					$(".order_result_price_sel").text(numberFormat(use_point));
					$(".order_result_price_total").text(numberFormat((order_result_price - use_point)));
					$(".use_btn span").text(numberFormat((point - use_point)));
				}
			})

	/*
	 * // 전화번호 자리수 끊어서 출력 var phone1 = $("input[name=mobileReceiver2]").val();
	 * var phone1_c = phone1.substr(3,4);
	 * $("input[name=mobileReceiver2]").val(phone1_c);
	 * 
	 * var phone2 = $("input[name=mobileReceiver3]").val(); var phone2_c =
	 * phone1.substr(7,10); $("input[name=mobileReceiver3]").val(phone2_c);
	 */

	// 숨겨진 체크박스 로딩시 전체 선택
	$("input[name=product_no]").each(function(i) {
		var index = i + 1;
		$("input:checkbox[id=" + index + "ac]").prop("checked", true); // 각 제품
		// 번호
		$("input:checkbox[class=" + index + "dp]").prop("checked", true); // 각 제품
		// 배달비
		$("input:checkbox[class=" + index + "tp]").prop("checked", true); // 각 제품
		// 총 금액
		$("input:checkbox[class=" + index + "opa]").prop("checked", true); // 각 제품
		// 총 수량
		$("input:checkbox[class=" + index + "pn]").prop("checked", true); // 각 제품
		// 이름
		$("input:checkbox[class=" + index + "pp]").prop("checked", true); // 각 제품
		// 가격
	})

})
