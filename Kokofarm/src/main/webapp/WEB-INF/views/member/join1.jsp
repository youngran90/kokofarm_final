<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href = "/resources/css/joincss.css" rel="stylesheet">

<%@include file="../include/header.jsp"%>


<style>
	table.policy_table{text-align:center;font-size:11px;}
	table.policy_table thead{background:#666;color:#fff;}
	table.policy_table td{border:1px solid #d9d9d9;box-sizing:border-box;padding:3px 0;}
	table.policy_table thead td{font-size:12px;padding:5px 0;}
</style>

<div class="container" id="hn_container">

<script>
	function chkagreement(){
		if($("#ch_terms_agree1").is(":checked") === false){
			alert("[이용약관]에 동의를 하셔야 회원가입이 가능합니다.");
			$("#ch_terms_agree1").focus();
			return false;
		}
		else if($("#ch_terms_agree2").is(":checked") === false){
			alert("[개인정보 취급방침]에 동의를 하셔야 회원가입이 가능합니다.");
			$("#ch_terms_agree2").focus();
			return false;
		}else{
			document.frmAgree.submit();
		}
		return false;
	}
</script>



<div class="content_area">

		<section class="join_section join_section1">
			<section class="sub_top_section">
				<h2 class="cate_title"><span>회원가입</span></h2>
				<div class="page_location">
					<a class="loca_home" href="/shop"><img alt="home" src="/shop/web/images/common/ico_location_home.gif"></a>
					<a class="loca_depth">회원가입</a>
					<a class="loca_depth loca_this">약관동의</a>
				</div>
			</section>
			<form name="frmAgree" action="/shop/member/join.php" method="post">
				<input name="style" type="hidden" value="join2">				
			</form>
			<div class="step_box"><img alt="step1. 약관동의" src="/resources/image/join/join_topcon_step1.jpg"></div>

			<section class="terms_section">
				
			
				<div class="all_terms_box clearfix">
					<p>KokoFarm 이용약관(필수)</p>
					<label class="ch_label txt all_terms_ch" for="all_ch_terms">
						<input name="all_ch_terms" id="all_ch_terms" onchange="javascript:ChkAll($(this));" type="checkbox">
						모두 동의합니다.
						<span></span>
					</label>
				</div>

				<article class="terms_box terms_box1">
					<h3 class="terms_tit">이용약관 (필수)</h3>
					 <div class="terms_txt">제1장 총칙

								제1조(목적)

								이 약관은 코코팜(KokoFarm) 회사(전자거래 사업자)가 운영하는 KokoFarm 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리/의무 및 책임사항을 규정함을 목적으로 합니다. 
								※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」 


								제2조(정의)

								① “몰”이란 KokoFarm 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. 
								② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
								③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
								④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.


								제3조(약관 등의 명시와 설명 및 개정) 

								① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?U모사전송번호?U전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 “몰”의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 “이용자”가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
								② “몰”은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
								③ “몰”은 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 방문판매 등에 관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
								④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 “몰”의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
								다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰”은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
								⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
								⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.


								제4조(서비스의 제공 및 변경) 

								① “몰”은 다음과 같은 업무를 수행합니다.
								1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
								2. 구매계약이 체결된 재화 또는 용역의 배송
								3. 기타 “몰”이 정하는 업무
								② "몰"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다. 
								③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다. 
								④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.


								제5조(서비스의 중단) 

								① “몰”은 컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
								② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
								③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.


								제2장 회원가입계약


								제6조(회원가입) 

								① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
								② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
								1. 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만 제7조 제3항에 의하여 회원자격 상실한 자가 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
								2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 
								3. 성명, 생년월일, 성별, 주소, 전자우편주소, 이동전화번호 등 제반 사정을 종합하여 실질적으로 동일인으로 인정되는 기존 회원이 다른 ID를 생성하여 중복으로 가입신청하는 경우 
								4. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
								③ 회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
								④ 회원은 제15조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다.


								제7조(회원 탈퇴 및 자격 상실 등) 

								① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
								② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 상실 시킬 수 있습니다.
								1. 가입신청 시에 허위 내용을 등록한 경우
								2. 성명, 생년월일, 성별, 주소, 전자우편주소, 이동전화번호 등 제반 사정을 종합하여 실질적으로 동일인으로 인정되는 기존 회원이 다른 ID를 생성하여 중복으로 가입한 것으로 판명된 경우 
								3. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
								4. 다른 사람의 “몰” 이용을 방해하거나 다른 사람의 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
								5. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
								6. 기타 다음과 같은 행위 등으로 “몰”의 건전한 운영을 해하거나 “몰”의 업무를 방해하는 경우 
								가. “몰”의 운영과 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 “몰”의 명예를 실추시키거나 “몰”의 신뢰성을 해하는 경우 
								나. “몰”의 이용과정에서 직원에게 폭언, 협박 또는 음란한 언행으로 “몰”의 운영을 방해하는 경우 
								다. “몰”을 통해 재화 등을 구매한 후 정당한 이유 없이 상습 또는 반복적으로 취소 반품하여 “몰”의 업무를 방해하는 경우 


								제8조(회원에 대한 통지)

								① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
								② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일 이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.



								제3장 구매계약


								제9조(구매신청) 

								“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
								1. 재화 등의 검색 및 선택
								2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
								3. 약관내용, 청약철회권이 제한되는 서비스, 배송료?설치비 등의 비용부담과 관련한 내용에 대한 확인
								4. 이 약관에 동의하고 위 3.의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
								5. 재화 등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
								6. 결제방법의 선택


								제10조(계약의 성립)

								① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 이를 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
								1. 신청내용에 허위, 기재누락, 오기가 있는 경우
								2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
								3. 기타 구매신청에 승낙하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단하는 경우
								② “몰”의 승낙이 제12조 제1항의 수신확인통지 형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
								③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.


								제4장 대금결제


								제11조(지급방법) 

								“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
								1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
								2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
								3. 온라인무통장입금
								4. 전자화폐에 의한 결제
								5. 수령시 대금지급
								6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
								7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 
								8. 기타 전자적 지급 방법에 의한 대금 지급 등


								제12조(수신확인통지?구매신청 변경 및 취소)

								① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
								② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송준비절차 완료 전(예: 판매자에게 발주하기 전, “몰” 직배송일 경우에는 배송회사에 수화물을 신탁하기 전)에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.


								제13조(재화 등의 공급)

								① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 대금의 전부를 지급한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
								② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.


								제5장 취소, 환불


								제14조(환급)

								"몰"은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게 통지하고, 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.


								제15조(청약철회 등)

								① “몰”과 재화 등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.
								② 이용자는 재화 등을 배송받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
								1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
								2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
								3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
								4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
								③ 제2항 제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
								④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시?광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.


								제16조(청약철회 등의 효과)

								① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
								② "몰"은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 정당한 사유가 없는 한 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
								③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시가 광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.
								④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다. 


								제6장 적립금


								제17조(적용대상)

								①본 KokoFarm 적립금 정책은 KokoFarm 회원에 대해서만 적용됩니다.


								제18조(적립금 단위)

								①적립금의 단위는 포인트로 하며,?1포인트는 1원과 동등한 가치를 가집니다.


								제19조(적립금 발생 및 지급)

								① 적립금은 상품 수령확인 완료 시 아래와 같은 조건으로 발생 및 지급됩니다.
								1. 해당 주문 건의 실제 결제금액(택배비를 포함한 총 주문액에서 쿠폰, 적립금, 기타 할인액을 모두 차감하고 회원이 지불한 금액)의 1%에 해당하는 적립금이 발생 및 지급됩니다.
								2. 묶음 배송 상품과 개별 배송 상품 구분 없이 모든 상품 구매의 주문 건에 대하여 적립금이 발생 및 지급됩니다.
								3. 적립금 지급을 위한 최소 결제금액 기준은 없으나, 발생한 적립금이 1포인트 미만인 경우에는 지급이 되지 않습니다.
								4. 단일?주문 건에 대한 최대 적립금 제한은 없습니다.
								② 적립금은 상품 후기 작성 시 아래와 같은 조건으로 발생 및 지급됩니다.
								1. 일반 후기를 작성할 경우 50포인트가 발생 및 지급되며, 포토 후기를 작성할 경우 100포인트가 발생 및 지급됩니다.?단, 부적절한 후기의 경우 적립금이 지급되지 않을 수 있습니다.
								③ 적립금은 적립금 지급을 명시한 이벤트 참여 시 발생 및 지급됩니다.


								제20조(적립금 차감)

								① 적립금이 발생한 주문 건에 대해 전체 환불이 이루어질 경우 해당 주문 건의 수령확인 완료 시 발생 및 지급된 적립금이 차감됩니다.
								② 적립금이 발생한 주문 건에 대해 부분 환불이 이루어질 경우 부분 환불된 금액의 1%에 해당하는 금액이 적립금에서 차감됩니다.


								제21조(적립금 사용 및 사용 취소)

								① 적립금은 로그인 한 회원이 KokoFarm 데스크탑웹, 모바일웹, 모바일애플리케이션 페이지를 통해 상품 구매 시 사용 가능합니다.
								② 적립금의 1일 사용 제한 금액 및 1일 사용 제한 횟수는 없으며, 적립금만으로도 전체 금액 결제가 가능합니다.
								③ 적립금은 할인쿠폰과 동시에 사용할 수 없습니다. 단, 할인쿠폰과 관계없이 가격이 할인된 상품 결제 시에는 제한 없이 사용가능 합니다.
								④ 적립금은 최소 10포인트 이상일 때, 10포인트 단위로 사용 가능합니다.?예를 들면, 560포인트의 적립금 중 60포인트의 적립금만 사용하는 것은 가능하나, 65포인트의 적립금을 사용하는 것은 불가능합니다.
								⑤ 회원이 적립금을 사용하는 경우, 적립금 소멸 예정 일자가 빠른 적립금부터 우선적으로 사용됩니다.
								⑥ 적립금을 사용한 주문의 결제를 취소하는 경우, 해당 주문 건에 대해 사용된 적립금 전액이 다시 지급됩니다.


								제22조(적립금 소멸)

								① 적립금의 유효기간은 12개월로 하며, 유효기간이 지난 적립금은 소멸됩니다.
								② 회원은 마이페이지에서 적립금의 누적 내역 및 각각의 유효기간을 확인할 수 있습니다.
								③ 회사는 적립금 소멸 예정일자로부터 30일 전에 전자 메일 또는 모바일 애플리케이션 알림을 통해서 소멸 예정인 적립금의 금액과 소멸 예정일자를 공지하도록 합니다.
								④ 회원 탈퇴 시 해당 회원이 보유한 적립금은 자동으로 소멸됩니다. 회원 탈퇴 후 재가입을 하더라도 회원 탈퇴 시 소멸된 적립금은 다시 지급되지 않습니다.


								제7장 몰과 이용자의 의무 


								제23조(개인정보보호)

								① “몰”은 이용자의 정보수집 시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 
								1. 성명
								2. 생년월일(회원의 경우) 
								3. 성별(회원의 경우) 
								4. 주소
								5. 전자우편주소
								6. 이동 전화번호
								7. 희망ID(회원의 경우)
								8. 비밀번호(회원의 경우) 
								② “몰”이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
								③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 “몰”이 집니다. 다만, 다음의 경우에는 예외로 합니다.
								1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 이동전화번호)를 알려주는 경우
								2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
								3. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우
								4. 도용방지를 위하여 본인확인에 필요한 경우
								5. 중복회원가입여부 확인을 위하여 필요한 경우 
								6. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우
								④ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은 자, 제공목적 및 제공할 정보의 내용) 등 정보통신망 이용촉진 등에 관한 법률 제22조 제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
								⑤ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
								⑥ “몰”은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
								⑦ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.


								제24조(“몰”의 의무)

								① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화?용역을 제공하는데 최선을 다하여야 합니다.
								② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
								③ “몰”이 상품이나 용역에 대하여 표시?광고의 공정화에 관한 법률 제3조 소정의 부당한 표시?광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
								④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.


								제25조(회원의 ID 및 비밀번호에 대한 의무)

								① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
								② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
								③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.


								제26조(이용자의 의무) 

								이용자는 다음 행위를 하여서는 안 됩니다.
								1. 신청 또는 변경시 허위 내용의 등록
								2. 타인의 정보 도용
								3. 중복회원가입
								4. “몰”에 게시된 정보의 변경
								5. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
								6. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
								7. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
								8. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 “몰”에 공개 또는 게시하는 행위


								제8장 기타 


								제27조(연결“몰”과 피연결“몰” 간의 관계)

								① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹사이트)이라고 하고 후자를 피연결“몰”(웹사이트)이라고 합니다.
								② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대한 보증책임을 지지 않습니다. 


								제28조(저작권의 귀속 및 이용제한)

								① “몰”이 작성한 저작물에 대한 저작권 기타 지적재산권은 “몰”에 귀속합니다. 
								② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
								③ “몰”은 이용자가 작성한 게시물이 다음 각 호에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있고, 이에 대하여 “몰”은 어떠한 책임도 지지 않습니다. 
								1. 다른 이용자 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우 
								2. 공서양속에 위반되는 내용일 경우 
								3. 범죄적 행위에 결부된다고 인정되는 경우 
								4. “몰”의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우 
								5. “몰”의 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우 
								6. “몰”로부터 사전승인받지 아니한 상업광고, 판촉내용을 게시하는 경우 
								7. 해당 재화 등과 관련 없는 내용인 경우 
								8. 정당한 사유 없이 “몰”의 영업을 방해하는 내용을 기재하는 경우
								9. 기타 관계 법령에 위반된다고 판단되는 경우 
								④ “몰”은 이용자가 작성한 게시물(예: 상품평, 상품구매후기, 상품구매사진)이 추후 상품홍보에 사용될 수 있음을 공지한 후, 이용자가 작성한 게시물을 당해 이용자에게 소정의 대가를 지급하고 상품홍보 목적에 한정하여 사용할 수 있습니다. 
								⑤ 회원이 부정한 방법으로 할인쿠폰 또는 적립금을 획득한 사실이 확인될 경우 “몰”은 이용자의 할인쿠폰 또는 적립금의 회수, 회원자격 상실 등 기타 조치를 취할 수 있습니다. 


								제29조(분쟁해결)

								① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치?운영합니다.
								② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
								③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시?도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.


								제30조(재판권 및 준거법)

								① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
								② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

								부칙(2012. 1. 26.) 
								이 약관은 2012년 1월 26일부터 시행합니다. 
								부칙(2012. 12. 3.) 
								이 약관은 공지 후 30일이 경과한 날부터 적용됩니다.
								부칙(2012. 12. 7.)
								2012년 12월 7일 이후의 가입자에 한하여, 이 약관은 가입을 한 날부터 적용됩니다. 송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. ③ "몰"은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다. 제23조(분쟁해결) ① "몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다. ② "몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다. ③ "몰"과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다. 제24조(재판권 및 준거법) ① "몰"과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. ② "몰"과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다. 부칙 1. 이 약관은 2012년 12월 7일부터 적용됩니다.
						</div>
					<div class="label_area">
						<label class="ch_label txt" for="ch_terms_agree1">
							<input name="ch_agree1" id="ch_terms_agree1" onchange="javascript:AllChk();" type="checkbox" value="1">
							이용약관에 동의합니다.
							<span></span>
						</label>
					</div>
				</article>
				<article class="terms_box terms_box2">
					<h3 class="terms_tit">개인정보 수집/이용 및 취급방침 (필수)</h3>
					<div class="terms_txt">고객님께서는 동의를 거부하실 수 있으며, 동의거부시 회원가입이 제한됩니다.
						<table class="policy_table">
							<thead>
								<tr>
									<td>목적</td>
									<td>항목</td>
									<td>보유기간</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>이용자식별, 계약이행을 위한 연락, 서비스 이용에 따른 민원사항의 처리</td>
									<td>아이디(ID)*, 비밀번호(PASSWORD),이름, 휴대폰번호 <br> *아이디(ID)는 이메일(E-mail)을 사용</td>
									<td rowspan="4">회원탈퇴 또는 개인정보 유효기간* 도래 시까지 보관 <br> *단, 관계 법령에 따라 고객님의 개인정보를 보존하여야 하는 경우, 회사는 해당 법령에서 정한 기간동안 보관합니다.</td>
								</tr>
								<tr>
									<td>(주)KokoFarm의 상품/서비스의 이용 실적 정보 통계/분석 및 상품/서비스 추천</td>
									<td>필수, 선택 항목에서 수집한 모든 정보항목</td>
								</tr>
								<tr>
									<td>개인정보 유효기간제 준수</td>
									<td>자동수집정보: 서비스이용기록</td>
								</tr>
							</tbody>
						</table>

						KokoFarm(http://www.hellonature.net)는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등
						정보통신 서비스 제공자가 준수하여야 할 관련 법령상의 개인 정보 보호 규정을 준수하며, 관련 법령에 의거한 개인정보보호방침을 정하여 이용자의 권익 보호에 최선을 다하고 있습니다. 

						KokoFarm의 개인정보보호방침은 다음과 같습니다. 

						1. 수집하는 개인정보의 항목 및 수집방법

						A.수집항목 
						- 아이디, 비밀번호, 성명, 휴대전화번호 : 회원제 서비스 이용에 따른 본인식별절차에 이용 
						- 전자우편주소, 전자우편 수신여부, 휴대전화번호, 문자(SMS) 수신 여부 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내
						- 주소, 휴대전화번호, 유선전화번호 : 경품과 쇼핑 물품 배송에 대한 정확한 배송지의 확보
						- 그 외 선택 항목 : 개인 맞춤 서비스를 제공하기 위한 자료
						- 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않으며 부득이하게 수집해야 할 경우 이용자들의 사전동의를 반드시 구할 것입니다. 그리고, 어떤 경우에라도 입력하신 정보를 이용자들에게 사전에 밝힌 목적 이외에 다른 목적으로는 사용하지 않으며 외부로 유출하지 않습니다.  

						B. 수집방법 
						- 홈페이지(회원가입, 고객센터게시판) 및 고객센터를 통한 전화 및 온라인 상담 
						- 구독하기 페이지 및 이벤트 페이지를 통한 입력

						2. 개인정보의 수집 이용목적

						KokoFarm는 수집된 이용자들의 개인정보를 다음의 목적을 위해 이용하고 있습니다.

						A. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금 정산
						- 컨텐츠 및 회원 맞춤형 서비스 제공, 서비스 구매 및 요금 결제, 금융거래 본인 및 금융 서비스, 상품 및 경품 배송 서비스

						B. 회원 관리
						- 회원제 서비스 제공(회원 식별, 불량 회원의 부정 이용 방지, 가입 의사 확인 및 중복 가입 여부 확인, 분쟁 조정을 위한 기록 보존, 불만 접수 등 민원의 처리, 고지사항 전달 등)

						3. 개인정보의 보유기간 및 이용기간

						A. 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리?의무 관계의 확인 등을 이유로 일정 기간 보유하여야 할 필요가 있을 경우에는 일정 기간 보유합니다. 
						- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원자격을 상실시키는 경우에는 회원가입 탈퇴 또는 회원자격 상실 전에 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다. - 계약 또는 청약철회 등에 관한 기록 : 5년 
						- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 
						- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 
						B. 귀하의 동의를 받아 보유하고 있는 거래정보 등에 대하여 귀하께서 열람을 요구하는 경우 KokoFarm는 지체없이 이를 열람, 확인할 수 있도록 조치를 취합니다.

						4. 이용자 및 법정대리인의 권리와 그 행사방법

						이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.
						이용자들의 개인정보 조회,수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.
						혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.
						귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다. 
						회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

						5. 쿠키의 운영사실 및 거부방법 안내

						A. 쿠키(cookie)란?

						KokoFarm는 귀하에 대한 정보를 저장하고 수시로 찾아내는 쿠키(cookie)를 사용합니다. 쿠키는 웹사이트가 귀하의 컴퓨터 브라우저(넷스케이프, 인터넷 익스플로러 등)로 전송하는 소량의 정보입니다. 
						귀하께서 웹사이트에 접속을 하면 KokoFarm의 컴퓨터는 귀하의 브라우저에 있는 쿠키의 내용을 읽고, 귀하의 추가정보를 귀하의 컴퓨터에서 찾아 접속에 따른 성명 등의 추가 입력 없이 서비스를 제공할 수 있습니다. 
						또한 귀하는 쿠키에 대한 선택권이 있습니다. 웹브라우저 상단의 도구 &gt; 인터넷옵션 탭(option tab)에서 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수 있습니다. 다만 회사가 제공하는 모든 서비스를 제대로 이용하기 위해서는 쿠키를 허용해야 하며, 쿠키를 허용하지 않았을 경우에는 서비스가 정상적으로 제공되지 않을 수 있습니다.

						B. KokoFarm의 쿠키(cookie) 운용

						KokoFarm는 이용자의 편의를 위하여 쿠키를 운영합니다. KokoFarm가 쿠키(cookie)를 통해 수집한 정보는 다음의 목적을 위해 사용됩니다. 

						- 개인의 관심 분야에 따라 차별화된 정보를 제공 
						- 회원과 비회원의 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 타겟(target) 마케팅에 활용 
						- 쇼핑한 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 다음 번 쇼핑 때 개인 맞춤 서비스를 제공 
						- 회원들의 습관을 분석하여 서비스 개편 등의 척도 
						- 게시판 글 등록

						C. 쿠키 설정 거부 방법

						쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
						설정방법 예(인터넷 익스플로러의 경우) : 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보
						단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.

						6. 비회원고객의 개인정보관리

						- 당사는 비회원 고객 또한 물품 및 서비스 상품의 구매를 하실 수 있습니다. 당사는 비회원 주문의 경우 배송 및 대금 결제, 상품 배송에 반드시 필요한 개인정보만을 고객님께 요청하고 있습니다.
						- 당사에서 비회원으로 구입을 하신 경우 비회원 고객께서 입력하신 지불인 정보 및 수령인 정보는 대금 결제 및 상품 배송에 관련한 용도 외에는 다른 어떠한 용도로도 사용되지 않습니다.

						7. 개인정보의 위탁처리

						KokoFarm는 서비스 향상을 위해서 귀하의 개인정보를 필요한 경우 동의 등 법률상의 요건을 구비하여 외부에 수집 · 취급 · 관리 등을 위탁하여 처리할 수 있으며, 제 3자에게 제공할 수 있습니다.
						당사는 개인정보의 처리와 관련하여 아래와 같이 업무를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 
						또한 공유하는 정보는 당해 목적을 달성하기 위하여 필요한 최소한의 정보에 국한됩니다.

						<table class="policy_table">
							<thead>
								<tr>
									<td>수탁자</td>
									<td>위탁사무 및 목적</td>
									<td>보유 및 이용기간</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>(주)드림시큐리티</td>
									<td>서비스 이용을 위한 본인확인 업무 처리</td>
									<td>목적 달성 후 즉시 파기</td>
								</tr>
								<tr>
									<td>(주)케이지이니시스</td>
									<td>계좌이체 서비스제공</td>
									<td rowspan="9">회원 탈퇴 및 위탁 계약 만료 때 까지</td>
								</tr>
								<tr>
									<td>(주)케이지이니시스</td>
									<td rowspan="4">결제 대행</td>
								</tr>
								<tr>
									<td>(주)엘지유플러스</td>
								</tr>
								<tr>
									<td>엔에이치엔엔터테인먼트(주) - 페이코</td>
								</tr>
								<tr>
									<td>나이스페이먼츠(주) - 나이스페이</td>
								</tr>
								<tr>
									<td>엘지씨엔에스(주) - 카카오페이</td>
									<td>결제대행 및 카카오톡 알림톡 등 발송</td>
								</tr>
								<tr>
									<td>CJ대한통운(주)</td>
									<td rowspan="3">물품배송 또는 청구지 등 발송</td>
								</tr>
								<tr>
									<td>우정사업본부(우체국)</td>
								</tr>
								<tr>
									<td>하루로지스</td>
								</tr>
								<tr>
									<td>산지직송상품 생산자 [업체리스트]</td>
									<td>산지직송상품 배송</td>
									<td>위탁 계약 만료 때 까지</td>
								</tr>
							</tbody>
						</table>

						8. 개인정보관리책임자

						이용자들의 개인정보를 보호하고 개인정보와 관련된 불만 등을 처리하기 위하여 KokoFarm는 고객서비스담당 부서 및 개인정보관리책임자를 두고 있습니다. 이용자의 개인정보와 관련한 문의사항은 아래의 고객서비스담당 부서 또는 개인정보관리책임자에게 연락하여 주시기 바랍니다.
						A. [고객지원센터]
						- 전화번호 : 1644-4339 / 이메일 : help@hellonature.net
						B. [개인정보관리책임자]
						- 성명 : 좌종호 / 소속ㆍ직위 : COO / 전화번호: 1644-4339 / 이메일 : help@hellonature.net
						C.기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
						- 개인정보침해신고센터 (www.118.or.kr / 118)
						- 정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4) 
						- 대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000) 
						- 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330) 

						9. 개인정보취급방침의 개정과 그 공지

						본 방침은 2013년 12월 18일부터 시행됩니다. 개인정보취급방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다. 
						다만, 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일 전에 고지합니다.

						- 공고일자 : 2013년 11월 18일
						- 시행일자 : 2013년 12월 18일

						-2013년 12월 18일 이후의 가입자에 한하여, 이 방침은 가입을 한 날부터 적용됩니다.
					</div>
					<div class="label_area">
						<label class="ch_label txt" for="ch_terms_agree2">
							<input name="private1" id="ch_terms_agree2" onchange="javascript:AllChk();" type="checkbox" value="y">
							개인정보 수집/이용 및 취급방침에 동의합니다.
							<span></span>
						</label>
					</div>
				</article>
				<!--<div class="all_agree_box">
					<label class="ch_label txt" for="ch_terms_agree3">
						<input type="checkbox" id="ch_terms_agree3" name="" value="">
						<span></span>KokoFarm 이용약관과 개인정보 취급방침 모두 동의합니다.
					</label>
				</div>-->
				<div class="btn_box">
					<a class="btn_next" onclick="chkagreement();" href="javascript:">다음</a>
				</div>
			</section>
		</section>

	</div><!--//content_area-->



<script type="text/javascript">
	

	function ChkAll(el){
		var el = $(el);
		if($(el).prop('checked')){
			$('.label_area label').addClass('on');
			$('.label_area input[type=checkbox]').prop('checked', true);
		}else{
			$('.label_area label').removeClass('on');
			$('.label_area input[type=checkbox]').prop('checked', false);
		}
	}

	function AllChk(){
		var ch_terms = $('.label_area input[type=checkbox]');
		var chk_term = false;

		chk_term = AllTermChk(ch_terms);

		if(chk_term == false){
			$('.all_terms_ch').removeClass('on');
			$('#all_ch_terms').prop('checked', false);
		}else{
			$('.all_terms_ch').addClass('on');
			$('#all_ch_terms').prop('checked', true);
		}
	}

	function AllTermChk(chkList){
		for(var i=0; i<chkList.length; i++){
			if(!$(chkList[i]).prop('checked')){
				return false;
			}
		}
		return true;
	}

</script>
</div><!--//container-->








</div><!--//wrapper-->

<!-- 절대! 지우지마세요 : Start -->
<iframe name="ifrmHidden" src="/shop/blank.txt" style="width: 100%; display: none;"></iframe>
<!-- 절대! 지우지마세요 : End -->



<%@include file="../include/footer.jsp"%>






