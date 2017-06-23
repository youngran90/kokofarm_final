$(function() {
	
	$("#rt_acution_price").text(numberFormat($("#rt_acution_price").text()));
	
	// 정규화 함수(천의 자리마다 ,)
	function numberFormat(number) { // 3 자리수 마다 , 표시
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 정규화 함수(,제거)
	function numberReplace(number) {
		return number.replace(/[^0-9]/g, "");
	}

	// 결제 수단 정보 박스
	$(".creditcard_info").hide();
	$(".kakaopay_info").hide();
	$(".naverpay_info").hide();
	$(".payment_info").hide();

	$(".pay").on('click', function() {
		var radio = $(this).val();

		if (radio == "신용카드") {
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
		} else if (radio == "무통장입금") {
			$(".creditcard_info").hide();
			$(".kakaopay_info").hide();
			$(".naverpay_info").hide();
			$(".payment_info").show();
		}
	})

})