<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

 <%@include file="../include/header.jsp"%>
      <style>
.error{
color: "red"
}

#bizNum1,#bizNum2,#bizNum3{
text-align: center;
}
   

select[type=tel], input[type=tel]{
text-align: center;
}
</style>
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

 <script type="text/javascript">
 
	$(function(){
		 $("#member_id").on("keydown",function(){
			
			$("#idDuplication").attr("value","idUncheck");
		});
				
		$("#id_check").on('click',function(){
	
			var userid = $("#member_id").val();
		
			window.name = "parentForm";
			openWin = window.open("/member/id_check?userid="+userid,
					"childForm", "width =500, height = 300, resizable = no, scrollbars = no");
			

	
		});
		
		
		
		//회원가입 정규 표현식
	$("#joinBtn").on("click",function(){
	
			
		var idD = $("#idDuplication").val();
		if(idD !="idCheck"){
			alert("아이디 중복체크를 해주세요.");
			return false;
			
			
		}
		var id = $('#member_id').val();
		var eid = /^[a-z0-9A-Z_]{4,15}$/;
		if(!eid.test(id)){
			alert("아이디를 다시 입력해 주세요")
			$("#member_id").focus();
			return;
		}
		
		var name = $('#member_name').val();
		var ename = /^[가-힣]{2,8}$/;
		
		if(!ename.test(name)){
			alert("이름을 다시 입력해 주세요")
			$('#member_name').focus();
			return;
		}
		
		var email = $('#member_email').val();
		var eemail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!eemail.test(email)){
			alert("이메일 형식에 맞지 않습니다. 다시 입력해 주세요")
			$('#member_email').focus();
			return;
		}
		
		var phone = $('#member_phoneNum2').val();
		var ephone= /^[0-9]{3,4}$/;
		
		if(!ephone.test(phone)){
			alert("전화번호를 다시 입력해 주세요")
			$('member_phoneNum2').focus();
			return;
		}
		var zip=$('#sample6_postcode').val();
		
		if(zip==""){
			alert("주소를 입력해 주세요");
			return;
		}
		 var address2 = $('#sample6_address2').val();
		 
		 if(address2==""){
			 alert("상세주소를 입력해 주세요");
			 $('#sample6_address2').focus();
			 return;
		 }
		 
		 var pw = $('#member_password').val();
		 var pw2 =$('#member_password2').val();
		
		var epw =/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{5,20}$/;
		if(!epw.test(pw)){
			alert("암호를 다시 입력해 주세요");
			$('#member_password').focus();
			return;
			
		}else if(pw!=pw2){
			alert('입력한 비밀번호가 다릅니다.');
			$('#member_password2').focus();
			return;
		}
		
		
		var p1=$("#member_phoneNum1").val();
		var p2 =$("#member_phoneNum2").val();
		var p3 = $("#member_phoneNum3").val();
		
		
		var p4 = p1+p2+p3;
		$("#member_phoneNum").attr('value',p4);
		
		
			
		var t1 = $("#member_tel1").val();
		var t2 =$("#member_tel2").val();
		var t3 =$("#member_tel3").val();
		var t4 =t1+t2+t3;
		$("#member_tele").attr('value',t4);
		
		
		
		

		var bizNum1 = $("#bizNum1").val();
		var bizNum2 = $("#bizNum2").val();
		var bizNum3 = $("#bizNum3").val();
		var license = bizNum1+bizNum2+bizNum3;
		
		$("#bizNum").attr('value',license);
		
		$("#seller_no").val(id);
			
			
		var bizreg1 =/^[0-9]{3}/;
		
		var bizreg2 = /^[0-9]{2}$/;
		
		var bizreg3 = /^[0-9]{5}$/;
					
		if(!bizreg1.test(bizNum1)){
			alert("3자리 숫자만 입력해주세요");
			$("#bizNum1").focus();
			return false;
		}else if(!bizreg2.test(bizNum2)){
			alert("2자리 숫자만 입력해주세요");
			$("#bizNum2").focus();
			return false;
		}else if(!bizreg3.test(bizNum3)){
			alert("5자리 숫자만 입력해주세요");
			$("#bizNum3").focus();
			return false;
		}
		
		var bizName = $("#bizName").val();
		
		
		
		   if($("#chkBox").prop("checked")){
				document.joinForm.submit();
		   }else{
			   alert("회원가입에 동의 해주세요");
			   return false;	
		   } ;

		   
	})
	
});
	
</script>
 
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
        <li><a href="#">Mypage</a></li>
        <li><a href="/member/join">Register</a></li>
    </ul>
    
    <div class = "step_box">
    <img src="../../../resources/image/contents/join_topcon_step2.jpg" alt="step2. 정보입력" style="width: 1180px">
     </div>	
     <br><br>
    
    <div class="row">
        <div class="col-sm-3 hidden-xs column-left" id="column-left">
            <div class="column-block">
                <div class="columnblock-title">Account</div>
                <div class="account-block">
                    <div class="list-group"> <a class="list-group-item" href="login.html">Login</a> 
                    <a class="list-group-item" href="/member/join">Register</a> 
                    <a class="list-group-item" href="forgetpassword.html">Forgotten Password</a> 
                    <a class="list-group-item" href="#">My Account</a> 
                    <a class="list-group-item" href="#">Address Book</a> 
                    <a class="list-group-item" href="#">Wish List</a> 
                    <a class="list-group-item" href="#">Order History</a> 
                    <a class="list-group-item" href="download">Downloads</a>
                     <a class="list-group-item" href="#">Reward Points</a> 
                     <a class="list-group-item" href="#">Returns</a>
                      <a class="list-group-item" href="#">Transactions</a>
                       <a class="list-group-item" href="#">Newsletter</a>
                       <a class="list-group-item last" href="#">Recurring payments</a> 
                       </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9" id="content">
            <h1>회원 가입</h1>
            <p>이미 계정이 가입되어 있으면. <a href="login">Login page</a>.</p>
            <form:form class="form-horizontal" enctype="multipart/form-data" method="post" action="join"  commandName="MemberCommand" name="joinForm">
                <fieldset id="account">
                    <legend>정보 입력</legend>
                    <div style="display: none;" class="form-group required">
                        <label class="col-sm-2 control-label">Customer Group</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label>
                                    <input type="radio" checked="checked" value="1" name="customer_group_id">
                                    Default</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-id" class="col-sm-2 control-label">I D</label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="member_id" placeholder="아이디      4~15자 특수문자 사용금지" value="" path="member_id" />
                            <input type="button" value = "중복확인" id ="id_check">
                            	<form:errors path="member_id" cssClass="error"/>
                            		<input type="hidden" id = "idDuplication" name = "idDuplication" value="idUncheck">                          	
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-name" class="col-sm-2 control-label">이 름</label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="member_name" placeholder="이름        한글만(특수문자 금지)" value="동훈" path="member_name"/>
                            <form:errors path="member_name" cssClass="error"/>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-email" class="col-sm-2 control-label">E-Mail</label>
                        <div class="col-sm-10">
                            <form:input type="email" class="form-control" id="member_email" placeholder="abcd@abcd.com" value="aa@aa.com" path="member_email"/>
                            <form:errors path="member_email" cssClass="error"/>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-telephone" class="col-sm-2 control-label">핸드폰번호</label>
                        <div class="col-sm-10">
                            <%-- <form:input type="tel" class="form-control" id="member_phoneNum1" placeholder="000-0000-0000" value="" path="member_phoneNum"/> --%>
                     	  	<select name = "member_phoneNum1" id = "member_phoneNum1" style="height: 28px; margin-top: 3px">
                     	  		<option value="010">010</option>
                     	  		<option value="011">011</option>
                     	  		<option value="017">017</option>
                     	  		<option value="019">019</option>
                     	  	</select> -
                     	  	<input type="tel"  id = "member_phoneNum2" name = "member_phoneNum2" size="5" maxlength="4" value="3333"> -
                     	  	<input type="tel" id = "member_phoneNum3" name = "member_phoneNum3" size="5" maxlength="4" value="4444">
                     		<input type="hidden" id = "member_phoneNum" name="member_phoneNum" value="">
                     	 <%--  <form:errors path="member_phoneNum" cssClass="error"/> --%>	
                        </div>
                    </div>
                    
                    <div class = "form-group">
                    	<label for ="input-tel" class="col-sm-2 control-label">사업체 전화번호</label>
                    	<div class="col-sm-10">
                    	<select id="member_tel1" name ="member_tel1" style="height: 28px; margin-top: 3px">
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
                     </select> -
                     <input type="tel"  id = "member_tel2" name="member_tel2" size="5" maxlength="4" value="3333"> -
                     <input type="tel"  id="member_tel3" name = "member_tel3" size = "5" maxlength="4" value="3333">
                    	<input type ="hidden" id ="member_tele" name="member_tele" value="">
                    	</div>
                    
                    </div>
                 
                </fieldset>
                <fieldset id="address">
                    <legend>Your Address</legend>
                    <div class="form-group required">
                        <label for="input-postcode" class="col-sm-2 control-label">Zip Code</label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" value="" path="member_zipcode" readonly="readonly"/>
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                        </div>
                    </div>                   
                      <div class="form-group required">
                        <label for="input-address-1" class="col-sm-2 control-label">사업체 주소</label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="sample6_address" placeholder="Address 1" value="" path="member_address1"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-address-2" class="col-sm-2 control-label">상세주소</label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="sample6_address2" placeholder="Address 2" value="" path="member_address2"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-account" class="col-sm-2 control-label">계좌번호</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="member_account" placeholder="계좌번호" value="" name="member_account">
                        </div>
                    </div>
                    
                  <div class="form-group required">
                    <label for="input-account" class="col-sm-2 control-label">사업자 번호</label>
                    <div class="col-sm-10">
						<input type="text" id="bizNum1" name="bizNum1" size="4" maxlength="3" title="사업자번호 첫번째 자리" onblur="CheckBusinessRegistrationNumber1(this, true);" />
						<span class="md_txt">-</span>
						<input type="text" id="bizNum2" name="bizNum2" size="3" maxlength="2" title="사업자번호 두번째 자리" onblur="CheckBusinessRegistrationNumber2(this, true);"  />
						<span class="md_txt">-</span>
						<input type="text" id="bizNum3" name="bizNum3" size="6" maxlength="5" title="사업자번호 세번째 자리" onblur="CheckBusinessRegistrationNumber3(this, true);"  />
						<input type="hidden" id="bizNum" name = "bizNum">
						<input type="hidden" id ="seller_no" name = "seller_no">
								 </div>
                  </div>
                    
                     <div class="form-group required">
                    <label for="input-account" class="col-sm-2 control-label">사업 업체명</label>
                    <div class="col-sm-10">
						<input type="text" id="bizName" name="bizName" size="40" maxlength="40" title="사업자 업체명" />
						 </div>
                  </div>
                    
                    
                    
                                 
                </fieldset>
                <fieldset>
                    <legend>Your Password</legend>
                    <div class="form-group required">
                        <label for="input-password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="member_password" placeholder="5~20자 영문, 숫자 포함 입력." value="" name="member_password">
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-confirm" class="col-sm-2 control-label">Password Confirm</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="member_password2" placeholder="암호확인" value="" name="member_password2">
                        </div>
                    </div>
                </fieldset>
                
                <div class="buttons">
                    <div class="pull-right">회원가입에 동의 합니다.<a class="agree" href="#"><b></b></a>
                        <input type="checkbox" id="chkBox" value="1" name="agree">
                        &nbsp;
                        <input type="button" class="btn btn-primary" id = "joinBtn" value="회원가입">
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
 
 
 <%@include file="../include/footer.jsp"%>
