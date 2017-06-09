<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<title>코코팜 회원가입</title>
	<style type="text/css">
	#basic span.Shello{display:block;height:25px;background-position:138px -400px;}
	
	</style>
		
	<script type='text/javascript' src='https://www.gmarket.co.kr/challenge/neo_include/favicon_net.js'></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/json2.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
    <script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery.popupwindow.js"></script>
	<!-- <script type="text/javascript" src="/resources/javascript/Common.js"></script>
	<script type="text/javascript" src="/resources/javascript/ScriptEventErrorHandler.js"></script>
	<script type="text/javascript">
		$(document).jsErrorHandler();
		var _ContentUrls = ["http://script.gmkt.kr/_Net/css/myg/","http://image.gmarket.co.kr/_Net/","http://script.gmkt.kr/_Net/","https://script.gmkt.kr/_Net/css/myg/ssl/","https://sslimage.gmarket.co.kr/_Net/","https://script.gmkt.kr/_Net/","http://myg.gmarket.co.kr/","https://myg.gmarket.co.kr/","http://member.gmarket.co.kr/","https://member.gmarket.co.kr/","http://gbank.gmarket.co.kr/","https://gbank.gmarket.co.kr/","http://claim.gmarket.co.kr/","https://claim.gmarket.co.kr/","http://escrow.gmarket.co.kr/","https://sslescrow.gmarket.co.kr/","http://diary.gmarket.co.kr/","http://event.gmarket.co.kr/","http://sns.gmarket.co.kr/","http://www.gmarket.co.kr/","https://www.gmarket.co.kr/","http://item.gmarket.co.kr/","http://shop.gmarket.co.kr/","http://member2.gmarket.co.kr/","https://sslmember2.gmarket.co.kr/","http://promotion.gmarket.co.kr/","http://diary2.gmarket.co.kr/","http://eventnet.gmarket.co.kr/","http://ebay.gmarket.co.kr/","http://www.g9.co.kr/","http://signin.gmarket.co.kr/","https://signinssl.gmarket.co.kr/","http://english.gmarket.co.kr/","https://english.gmarket.co.kr/","http://pics.gmkt.kr/","https://pics.gmkt.kr/","/","/","/","/","/","/","/","/"];

    </script> -->
	<!-- <script type="text/javascript" src="https://script.gmkt.kr/_Net/js/dimmed.js"></script>
	<script type='text/javascript' src='https://script.gmkt.kr/_Net/js/gmkt.js?dummy=2012091327262'></script>
	<script type='text/javascript' defer='defer' src='https://script.gmkt.kr/_Net/js/impression.js'></script> -->
	
	<!-- 회원가입 Renewal //-->
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/common.css" />	
	<script type="text/javascript" src="https://script.gmkt.kr/pc/js/ko/joinRenewal.js"></script>
	<!-- 회원가입 Renewal //-->

	<!--[if IE 6]>
		<script src="https://script.gmkt.kr/_Net/js/DD_belatedPNG.js"></script>
		<script>
			DD_belatedPNG.fix('#main_menu .menu_list span');
			DD_belatedPNG.fix('#main_menu .menu_list p');
		</script>
	<![endif]-->

	
	
<script type="text/javascript" src='https://sslmember2.gmarket.co.kr/Scripts/Registration/MemberRegistration.js'></script>
<script type="text/javascript">
	bizFlag = false;

	$(document).ready(function () {

		// 사업자 인증
		/* $("#next").click(function () {

			if ($("#hidReCheck").val() == "N") {
				if (!CheckBusinessInput()) {
					return false;
				}

				$("#hidReCheck").val("Y");
				var custType = "PC";
				var bizNum = document.getElementById("bizNum1").value + "-" + document.getElementById("bizNum2").value + "-" + document.getElementById("bizNum3").value;

				bizFlag = false;
				try {
					var url = 'https://sslmember2.gmarket.co.kr/Registration/VerificationRegistrationCorp';
					var param = [{ name: 'corpIdNo', value: bizNum }, { name: 'custType', value: custType}];

					$.ajax({
						url: url,
						data: param,
						type: "GET",
						contentType: "application/json;",
						dataType: "json",
						success: function (data) {
							if (data.Data.ResultCode != 0) {
								alert(data.Data.ResultDescription);
								$("#hidReCheck").val("N");
								return false;
							} else {
								if ($("#hidReCheck").val() == "Y") {
									// 약관 페이지로 이동
									$('#form1').attr('action', 'MemberRegistrationAgreementBuyer').submit();
								}
								else {
									return false;
								}
							}
							bizFlag = true;
							return true;
						},
						error: function (error) {
							alert("Error");
							$("#hidReCheck").val("N");
							return false;
						}
					});
				} catch (e) {
					if (window.bridgeGotTime) {
						throw e;
					} else {
						//page reload?
					}
					return false;
				}

				return true;
			}
			else {
				$("#hidReCheck").val("N");
				return false;
			}
		}); */
		// 간편가입
		
	// Trim 함수
	function TrimString(s) {
		var m = s.match(/^\s*(\S+(\s+\S+)*)\s*$/);
		return (m == null) ? "" : m[1];
	}

	//숫자로만 되어있는지 확인1
	function isNumeric(s) {
		for (i = 0; i < s.length; i++) {
			c = s.substr(i, 1);
			if (c < "0" || c > "9") return false;
		}
		return true;
	}

	//숫자로만 되어있는지 확인2
	function passonlynum(inText) {
		var ret;
		for (var i = 0; i < inText.length; i++) {
			ret = inText.charCodeAt(i);
			if (!((ret > 47) && (ret < 58))) {
				return true;
			}
		}
		return false;
	}

	// 사업자회원 가입 체크
	function CheckBusinessInput() {

		if (TrimString(document.getElementById("bizNum1").value).length < 1
			|| TrimString(document.getElementById("bizNum2").value).length < 1
			|| TrimString(document.getElementById("bizNum3").value).length < 1) {
			alert("사업자 등록번호를 넣어주세요.");
			document.getElementById("bizNum1").focus();
			return false;
		}

		var regiNumber = TrimString(document.getElementById("bizNum1").value) + TrimString(document.getElementById("bizNum2").value) + TrimString(document.getElementById("bizNum3").value);

		// 사업자번호 유효성 체크
		if (!CheckValidBusinessRegistrationNumber(regiNumber)) {
			document.getElementById("bizNum1").focus();
			return false;
		}

		return true;
	}

	// 사업자등록번호 체크
	function CheckValidBusinessRegistrationNumber(regiNumber) {
		regiNumber = regiNumber.replace(/ /g, "");

		if (regiNumber == "" || regiNumber == null || regiNumber.length != 10) {
			alert("사업자 등록번호를 넣어주세요.");
			return false;
		}
		var regiNumber1 = regiNumber.substr(0, 3);
		var regiNumber2 = regiNumber.substr(3, 2);
		var regiNumber3 = regiNumber.substr(5, 5);

		// 숫자가 아닌 것을 입력한 경우
		if (!isNumeric(regiNumber1)) {
			alert("사업자 등록번호 첫번째 자리를 숫자로 입력하세요.");
			return false;
		}
		// 길이가 3이 아닌 경우
		if (regiNumber1.length != 3) {
			alert("사업자 등록번호 첫번째 자리 3자를 다시 입력해 주세요.");
			return false;
		}
		// 숫자가 아닌 것을 입력한 경우
		if (!isNumeric(regiNumber2)) {
			alert("사업자 등록번호 두번째 자리를 숫자로 입력하세요.");
			return false;
		}
		// 길이가 2이 아닌 경우
		if (regiNumber2.length != 2) {
			alert("사업자 등록번호 두번째 자리 2자를 다시 입력해 주세요.");
			return false;
		}
		// 숫자가 아닌 것을 입력한 경우
		if (!isNumeric(regiNumber3)) {
			alert("사업자 등록번호 세번째 자리를 숫자로 입력하세요.");
			return false;
		}
		// 길이가 5이 아닌 경우
		if (regiNumber3.length != 5) {
			alert("사업자 등록번호 세번째 자리 5자를 다시 입력해 주세요.");
			return false;
		}

		/* Nice에서 인증하므로 굳이 필요없음 : ERS447195
		var sum = 0;
		var getlist = new Array(10);
		var chkvalue = new Array("1", "3", "7", "1", "3", "7", "1", "3", "5");

		for (var i = 0; i < 10; i++) { getlist[i] = regiNumber.substring(i, i + 1); }
		for (var i = 0; i < 9; i++) { sum += getlist[i] * chkvalue[i]; }
		sum = sum + parseInt((getlist[8] * 5) / 10);
		sidliy = sum % 10;
		sidchk = 0;
		if (sidliy != 0) { sidchk = 10 - sidliy; }
		else { sidchk = 0; }
		if (sidchk != getlist[9]) {
		alert("유효하지 않은 사업자 등록번호입니다.");
		return false;
		}
		*/

		return true;
	}

	/*[숫자값으로만 구성되었는지 검증]*/
	function CheckOnlyNumber(bizNum, disableNullAlert) {
		inputValue = bizNum.value.replace(/ /g, "");
		if (disableNullAlert && inputValue.length == 0) { return false; }
		if (inputValue.replace(/\d/g, "").length != 0) {
			$('#bizMsg').text("숫자만 입력해주세요.");
			$('#bizMsg').show();
			bizNum.value = "";
			bizNum.focus();
			return false;
		}
		$('#bizMsg').text("");
		$('#bizMsg').hide();
		return true;
	}

	/*[사업자등록번호 앞 3자 검증]*/
	function CheckBusinessRegistrationNumber1(bizNum, disableNullAlert) {
		var bizNum1 = $("#bizNum1").val().replace(/ /g, "");

		if (disableNullAlert && bizNum1.length == 0) {
			$('#bizMsg').text("");
			$('#bizMsg').hide();
			return false;
		}

		if (bizNum1.length == 0) {
			$('#bizMsg').text("사업자 등록번호를 넣어주세요.");
			$('#bizMsg').show();
			//$('#bizNum1').val("");
			$('#bizNum1').focus();
			return false;
		}

		if (bizNum1.length != 3) {
			$('#bizMsg').text("사업자 등록번호 앞자리는 3자입니다. 다시 입력해주세요.");
			$('#bizMsg').show();
			//$('#bizNum1').val("");
			$('#bizNum1').focus();
			return false;
		}
		if (CheckOnlyNumber(bizNum, disableNullAlert) == false) return false;

		$('#bizMsg').text("");
		$('#bizMsg').hide();
		return true;
	}

	/*[사업자등록번호 중간 2자 검증]*/
	function CheckBusinessRegistrationNumber2(bizNum, disableNullAlert) {
		inputValue = bizNum.value.replace(/ /g, "");
		if (disableNullAlert && inputValue.length == 0) {
			$('#bizMsg').text("");
			$('#bizMsg').hide();
			return false;
		}

		if (inputValue.length != 2) {
			$('#bizMsg').text("사업자 등록번호 뒷자리는 2자입니다. 다시 입력해주세요.");
			$('#bizMsg').show();
			//bizNum.value = "";
			bizNum.focus();
			return false;
		}
		if (CheckOnlyNumber(bizNum, disableNullAlert) == false) return false;

		$('#bizMsg').text("");
		$('#bizMsg').hide();
		return true;
	}

	/*[사업자등록번호 뒤 5자 검증]*/
	function CheckBusinessRegistrationNumber3(bizNum, disableNullAlert) {
		inputValue = bizNum.value.replace(/ /g, "");
		if (disableNullAlert && inputValue.length == 0) {
			$('#bizMsg').text("");
			$('#bizMsg').hide();
			return false;
		}

		if (inputValue.length != 5) {
			$('#bizMsg').text("사업자 등록번호 뒷자리는 5자입니다. 다시 입력해주세요.");
			$('#bizMsg').show();
			//bizNum.value = "";
			bizNum.focus();
			return false;
		}
		if (CheckOnlyNumber(bizNum, disableNullAlert) == false) return false;

		$('#bizMsg').text("");
		$('#bizMsg').hide();
		return true;
	}

	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");

		if (event.target.value.length == event.target.maxLength) {
			if (event.target.id == "bizNum1") {
				$("#bizNum2").focus();
			} else if (event.target.id == "bizNum2") {
				$("#bizNum3").focus();
			}
		}
		if (event.target.value.length > event.target.maxLength) {
			event.target.value = event.target.value.slice(0, event.target.maxLength);
		}
	}
</script>	


	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/member_join.css?dummy=20170309" />
</head>


<body>

<div id="HeaderScriptContainer">
<script type="text/javascript">
	var headerKey = "SIMPLE";
	var GmarketHeaderComm = { BaroYN: "Y", Member: { IsLogin: "0", Grade: "unknown", Name: "", Type: "0"} };
</script>
</div>
<script type="text/javascript" src="https://script.gmkt.kr/js/header/Header.utf8.js"></script>


	<div id="wrap">
        <a name="top"></a>
		<div id="contents">
			

<form id="form1" method="post" action="">
<input type="hidden" id="hidFromType" name="FromType" value="FREGI" />
<input type="hidden" id="hidReCheck" name="hidReCheck" value="N" />
<input type="hidden" id="hidTabletYN" name="hidTabletYN" value="N" />
<!-- container -->
<div id="container">
	<div class="join_wrap">
		<div id="join_container">
			<!-- join_header -->
			<div class="join_header">
				<h2 class="bg_area join_bg">구매회원가입</h2>
				<ol class="join_step">
					<!-- <li class="bg_area join_bg step1 now">가입</li>WPR-973 전체 파일 공통수정
					<li class="bg_area join_bg step2">약관동의</li>
					<li class="bg_area join_bg step3">정보입력</li>
					<li class="bg_area join_bg step4">가입완료</li> -->
				</ol>
			</div>
			<!-- // join_header -->
			<div class="join_content" id="main"><!-- WPR-973 -->
				<div id="basic" class="typebox select">
					<h3 class="bg_area main_bg tit"><a href="#basic"><span class="bg_area main_bg">개인 회원가입</span></a></h3>
					<div class="wrap_cont"><!-- WPR-973 회원가입수정사항으로 인하여 추가 되었습니다. -->
						<p class="info_txt"> 
							<span class="bg_area main_bg hello" style="background: url(/resources/image/join/join_logo.png) no-repeat 0 0;display:block;height:25px;background-position:80px;height: 30px; ">KokoFarm에 오신 것을 환영합니다.</span>
							<span class="txt">지금 회원 가입하신 후 의 다양한 서비스를 만나보세요.</span><!-- WPR-973 -->
						</p>
						<div class="btn_zone">
							
							<a href="/member/join1" id="simple_regi" class="bg_area btn_bg l1 md"><span>가입하기</span></a>
						</div>
						<div class="join_note main_bg">
								<h4 class="tit">회원가입 유의사항</h4>
								<p>회원가입은 간단한 정보입력만으로 가입이 가능하나, 상품결제나 현금잔고/G캐시 등 실명<br>기반 서비스 이용 시에는 실명인증이 필요할 수 있습니다. </p>
							</div>
						 <div class="global_txt">
							<!-- <p>
								You can also join us at our English/Chinese page!<br> <span class="cn">从信用卡公司，接到无效或,无法使用等,通知的情况下</span>
							</p>
							<p class="btn_zone">
								<a href="javascript:GoGlobal_Registration('english');" class="bg_area main_bg btn">ENGLISH</a>
								<a href="javascript:GoGlobal_Registration('china');" class="bg_area main_bg btn cn">中国的</a>
							</p>  -->
						</div> 
					</div><!-- WPR-973 회원가입수정사항으로 인하여 추가 되었습니다. -->
				</div>
				<!-- // basic -->
				<div id="business" class="typebox">
					<h3 class="bg_area main_bg tit"><a href="#business"><span class="bg_area main_bg">사업자 회원가입</span></a></h3>
					<p class="info_txt"> 
						<span class="bg_area main_bg hello" style="background: url(/resources/image/join/join_logo.png) no-repeat 0 0;display:block;height:25px;background-position:80px;height: 30px; ">KokoFarm에 오신것을 환영합니다.</span>
						<span>사업자 구매회원 가입 페이지 입니다. 판매를 원하시는 분은 <a href="#">판매회원 가입페이지</a>로 가주세요.</span>
					</p>
					<div class="form_box">
						<input type="text" id="bizNum1" name="bizNum1" size="4" maxlength="3" title="사업자번호 첫번째 자리" onblur="CheckBusinessRegistrationNumber1(this, true);" onkeyup="removeChar(event)" />
						<span class="md_txt">-</span>
						<input type="text" id="bizNum2" name="bizNum2" size="3" maxlength="2" title="사업자번호 두번째 자리" onblur="CheckBusinessRegistrationNumber2(this, true);" onkeyup="removeChar(event)" />
						<span class="md_txt">-</span>
						<input type="text" id="bizNum3" name="bizNum3" size="6" maxlength="5" title="사업자번호 세번째 자리" onblur="CheckBusinessRegistrationNumber3(this, true);" onkeyup="removeChar(event)" />
						<div class="guide_txt">
							<label for="bizNum1">사업자 등록번호<span>"10자리"</span></label>
						</div>
					</div>
					<div class="agree_text">
					<p id="bizMsg" class="ability_chk" style="display:none">필수 정보 입니다.</p>
					<p class="agreeInfo">인증에 문제가 있을 경우, NICE평가정보㈜ 고객센터(02-3771-1390)로 문의 부탁 드립니다.<br>
						<a href="#" class="bg_area btn_bg gt_link">자세히보기</a>
					</p>
					</div>
					<p class="btn_zone">
						<a href="/member/join1_1" id="next" class="bg_area btn_bg m1"><span>인증</span></a>
					</p>
				</div>
				<!-- // business -->
			</div>
				<p class="seller_info">
					<strong>KokoFarm에서 판매를 해보세요!</strong>
					<span>개인, 사업자, 글로벌판매회원 중 선택이 가능합니다.</span>
					<a href="#" class="btn_bg sellerJoin"><span>판매회원가입하기</span></a>
				</p>
			<!-- // join_content -->
		</div> 
		<!--// join_container -->
	</div>
</div>
<!-- //container -->
</form>
		

		</div>
	</div>
	
<div id="FooterScriptContainer">
</div>
<script type="text/javascript" src="https://script.gmkt.kr/js/header/Footer.utf8.js"></script>

	<!-- Jira : BC9186-24 -->
	

</body>

</html>