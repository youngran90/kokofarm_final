$(function() {
	
	//결제하기
	$("#creditcards").on('click', function() {
		var creditcards = $(this).val();
		$("em[id=creditcard_name]").text(creditcards);
	}) // 카드 이름

	$("#month").on('click', function() {
		var month = $(this).val();
		$("em[id=pay_month]").text(month);
	}); // 할부 개월

	$("#bankaccount").on('click', function() {
		var bankaccount = $(this).val();
		$("em[id=pay_bank]").text(bankaccount);
	}) // 은행 이름
	
	
	$("#submitPay").on('click',function(){
		var db_id = $("select[name=mobileReceiver1]").attr("id"); //초기 로딩시 각 태그 잠금 - 고객 전화번호 앞자리 3자리를 가져온다
		$("select[name=mobileReceiver1]").val(db_id).attr("selected",true).attr("disabled", false); 
		// 전화번호 앞자리 3개 disabled를 풀어준다( disabled = submit이 안됨 )
		
		var pay_sort = $("input[name=pay]:checked").val(); //결제 방법을 선택한것..
		
		if($("input[name=recipient_name]").val() == ""){
			alert("받으시는분 이름이 없습니다.");
			$("input[name=recipient_name]").focus();
		}else if($("input[name=mobileReceiver2]").val() == "" || $("input[name=mobileReceiver3]").val() == ""){
			
			if($("input[name=mobileReceiver2]").val()==""){
				alert("핸드폰 앞자리 번호를 입력 해주세요 ");
				$("input[name=mobileReceiver2]").focus();
			}else{
				alert("핸드폰 뒷 자리 번호를 입력 해주세요 ");
				$("input[name=mobileReceiver3]").focus();
			}
			
		}else if($("input[name=recipientpost]").val() == "" || $("input[name=address_sub]").val() == ""){
			
			if( $("input[name=recipientpost]").val() == "" ){
				alert("우편번호를 입력하세요.");
				$("#post_btn").trigger("click");
			}else{
				
				var check = confirm("상세주소를 입력해주세요. \n 상세 주소가 없을경우 취소를 눌러주세요.");
				if(check){
					$("input[name=address_sub]").focus();
				}else{
					$("input[name=address_sub]").val("상세주소가 없습니다.");
				}
				
			}
		}else if(pay_sort == "신용카드"){
			$("#bankaccount").val("none").prop("selected",true);
			$("#deposit_name").val("none");
			
			var credit = $("em[id=creditcard_name]").text(); // 카드사명
			var month = $("em[id=pay_month]").text(); // 할부 종류
	
			if (credit == "none" || month == "none") {
				alert("카드 / 기간을 선택해주세요.");
			}else{
				$("#rt_auction_finish").submit();
			}
		}else if(pay_sort == "kakaopay"){
			$("#creditcards").val("none").prop("selected",true);
			$("#month").val("none").prop("selected",true);
			$("#bankaccount").val("none").prop("selected",true);
			$("#deposit_name").val("none");
			
			$("#rt_auction_finish").submit();
			
		}else if(pay_sort == "naverpay"){
			$("#creditcards").val("none").prop("selected",true);
			$("#month").val("none").prop("selected",true);
			$("#bankaccount").val("none").prop("selected",true);
			$("#deposit_name").val("none");
			
			$("#rt_auction_finish").submit();
			
		}else if(pay_sort == "무통장입금"){
			$("#creditcards").val("none").prop("selected",true);
			$("#month").val("none").prop("selected",true);
			
			
			var bank = $("em[id=pay_bank]").text();
			var name = $("input[name=deposit_name]").val();
			
			if (bank == "none" || name == "") {
				alert("계좌 / 이름을 작성해주세요.");
			}else{
				$("#rt_auction_finish").submit();
			}
		}// 조건 & ajax전송 종료
});
	
	
	$("#rt_acution_price01").text(numberFormat($("#rt_acution_price01").text()));
	$("#rt_acution_price02").text(numberFormat($("#rt_acution_price02").text()));
	$("#rt_acution_price03").text(numberFormat($("#rt_acution_price03").text()));
	
	// 정규화 함수(천의 자리마다 ,)
	function numberFormat(number) { // 3 자리수 마다 , 표시
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 정규화 함수(,제거)
	function numberReplace(number) {
		return number.replace(/[^0-9]/g, "");
	}

	// 결제 수단 정보 박스
	$(".creditcard_info").show();
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