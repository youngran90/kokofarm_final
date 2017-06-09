// --------------------------------------------------
// Ready
// --------------------------------------------------
$(document).ready(function () {
	document.domain = "gmarket.co.kr";
	Page.onInit();
});

// --------------------------------------------------
// Page 초기화 및 Page Events
// --------------------------------------------------
function Page() { }

Page.onInit = function () {
}

// --------------------------------------------------
// Events 
// --------------------------------------------------
function Events() { }

// 포스트백방지
Events.StopPostback = function (e) {
	if (e.preventDefault) {
		e.preventDefault();
		return false;
	} else {
		e.returnValue = false;
		return false;
	}
}

// 공백방지
Events.PreventSpace = function (e) {
	if (e.which && (e.which == 13 || e.which == 32)) {
		e.preventDefault();
	}
}

// 회원 가입 > 휴대폰 본인 인증
Events.SelfAuthPopup = function (w, h, fType, cType) {	// FRM, PP...
	var popupUrl = "/SelfAuthPopup/SelfAuthMemberRegistrationPopup?mType=M&fType=" + fType + "&cType=" + cType;
	var x = (screen.availWidth - w) / 2;
	var y = (screen.availHeight - h) / 2;
	window.open(popupUrl, "selfAuthPop", "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=" + w + ",height=" + h + ",left=" + x + ",top=" + y).focus();
	$("#hidReCheck").val("M");
}

// 회원 가입 > 아이핀 인증
Events.IPinAuthPopup = function (w, h, fType, cType) {	// FRM, PP...
	var popupUrl = "/IPinAuthPopup/IPinAuthMemberRegistrationPopup?mType=I&fType=" + fType + "&cType=" + cType;
	var x = (screen.availWidth - w) / 2;
	var y = (screen.availHeight - h) / 2;
	window.open(popupUrl, "ipinAuthPop", "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=" + w + ",height=" + h + ",left=" + x + ",top=" + y).focus();
	$("#hidReCheck").val("I");
}

Events.CheckValidation = function (e, gateType, custType) {

	if ($("#hidTabletYN").val() == "Y") {
		alert("태블릿에서는 팝업 설정을 허용으로 해주셔야 회원가입이 가능합니다");
	}

	var hidReCheck = $("#hidReCheck").val();
	var hidFromType = $("#hidFromType").val(); 	// FRM
	var hidCustType = custType; 					// PP, PC, EP, EC, EG

	var bizNum1 = $("#bizNum1").val();
	var bizNum2 = $("#bizNum2").val();
	var bizNum3 = $("#bizNum3").val();
	var bizNum = bizNum2 + bizNum2 + bizNum3;

	if (gateType == undefined || gateType == "") {
		alert("인증방법을 선택해주세요.");
		// return Events.StopPostback(e);
		return;
	}

	if (hidCustType == undefined || hidCustType == "") {
		alert("회원타입을 선택해주세요.");
		return;
	}

	if (gateType == "M") {
		Events.SelfAuthPopup(500, 461, hidFromType, hidCustType);
	} else if (gateType == "I") {
		Events.IPinAuthPopup(460, 570, hidFromType, hidCustType);
	} else if (gateType == "C") {
		// alert("사업자 인증 : " + bizNum)
	} else if (gateType == "S") {
		// alert("간편가입");
	}
}

Events.StopPostback = function (e) {
	if (e.preventDefault) {
		e.preventDefault();
		return false;
	}
	else {
		e.returnValue = false;
		return false;
	}
}

Events.PreventSpace = function (e) {
	if (e.which && (e.which == 13 || e.which == 32)) {
		e.preventDefault();
	}
}

// 숫자만 입력받을 수 있도록 keypress 이벤트로 처리
Events.CheckDigit = function (e) {
	if (e.which && (e.which > 47 && e.which < 58 || e.which == 8)) {

	}
	else {
		e.preventDefault();
	}
}


// --------------------------------------------------
// Data
// --------------------------------------------------

// --------------------------------------------------
// Bind
// --------------------------------------------------

// --------------------------------------------------
// Util
// --------------------------------------------------

// 글로벌 회원가입 이동
function GoGlobal_Registration(type) {
	if (type == "english") { setGlobalCookie("charset", "enUS", 90); }
	else if (type == "china") { setGlobalCookie("charset", "zhCN", 90); }
	GoSNAChannel(GmarketHeader.GetSNACode(type), "https://gmemberssl.gmarket.co.kr/Registration/MemberRegistration", '_blank');
}