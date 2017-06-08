$(function() {
	var size = $(".total_price").length;

	var price_sum = 0;
	var delivery_sum = 0;

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

	$(".delivery_price").each(function(i) {
		var index = i + 1;
		var cnt = $(this).attr("id");

		var delivery_price = $(this).text();
		var delivery_price_c = numberReplace(delivery_price);

		if (delivery_price_c == 0) {
			$(this).text("무료 배송");
			$("b[id=" + index + "dp_unit]").text("");
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
		} else if (radio == "payment") {
			$(".creditcard_info").hide();
			$(".kakaopay_info").hide();
			$(".naverpay_info").hide();
			$(".payment_info").show();
		}
	})

})