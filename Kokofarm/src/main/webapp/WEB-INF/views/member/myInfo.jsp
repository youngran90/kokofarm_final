<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
 <%@include file="../include/header.jsp"%>
   
  <style>
select[type=tel], input[type=tel]{
text-align: center;
}
</style>
 <script type="text/javascript">
 
 	
	$(function(){
		var tel = '${list.member_phoneNum}';
	 	tel2 =tel.substring(3,7);
	 	tel3 = tel.substring(7,11);
	 	$('#member_phoneNum2').val(tel2);
	 	$('#member_phoneNum3').val(tel3);
	 		 	
			//회원가입 정규 표현식
	$("#updateBtn").on("click",function(){
	
		
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
		
		document.infoUpdate.submit();
		
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
     <br><br>
    
    <div class="row">
    <%@include file="../mypage/Mypage.jsp"%>
        <div class="col-sm-9" id="content">
            <h1>내 정보</h1>
               <form class="form-horizontal" enctype="multipart/form-data" method="post" action="/member/myInfoUpdate"  name="infoUpdate">
                <fieldset id="account">
                    <legend>정보 수정</legend>
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
                            <input type="text" class="form-control" id="member_id" placeholder="아이디      4~15자 특수문자 사용금지" value="${list.member_id }" name="member_id" readonly="readonly">
                                             	
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-name" class="col-sm-2 control-label">이 름</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="member_name" placeholder="이름        한글만(특수문자 금지)" value="${list.member_name }" name="member_name" readonly="readonly">
                            
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-email" class="col-sm-2 control-label">E-Mail</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="member_email" placeholder="abcd@abcd.com" value="${list.member_email }" name="member_email">
                         
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-telephone" class="col-sm-2 control-label">핸드폰번호</label>
                        <div class="col-sm-10">
                            <%-- <input type="tel" class="form-control" id="member_phoneNum1" placeholder="000-0000-0000" value="" name="member_phoneNum"/> --%>
                     	  	<select name = "member_phoneNum1" id = "member_phoneNum1" style="height: 28px; margin-top: 3px">
                     	  		<option value="010">010</option>
                     	  		<option value="011">011</option>
                     	  		<option value="017">017</option>
                     	  		<option value="019">019</option>
                     	  	</select> -
                     	   	<input type="tel"  id = "member_phoneNum2" name = "member_phoneNum2" size="5" maxlength="4" value=""> -
                     	  	<input type="tel" id = "member_phoneNum3" name = "member_phoneNum3" size="5" maxlength="4" value="">
                     		<input type="hidden" id = "member_phoneNum" name="member_phoneNum" value="">
                     	 	
                        </div>
                    </div>
                    
                    <div class = "form-group">
                    	<label for ="input-tel" class="col-sm-2 control-label">전화번호</label>
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
                     <input type="tel"  id = "member_tel2" name="member_tel2" size="5" maxlength="4"> -
                     <input type="tel"  id="member_tel3" name = "member_tel3" size = "5" maxlength="4">
                    	<input type ="hidden" id ="member_tele" name="member_tele" value="">
                    	<input type="hidden" id ="bizNum" name = "bizNum" value="">
                    	<input type="hidden" id ="bizName" name = "bizName" value="">
                    	<input type="hidden" id= "seller_no" name = "seller_no" value="">
                    	</div>
                    
                    </div>
                 
                </fieldset>
                <fieldset id="address">
                    <legend>Your Address</legend>
                    <div class="form-group required">
                        <label for="input-postcode" class="col-sm-2 control-label">Zip Code</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" value="${list.member_zipcode }" name="member_zipcode" readonly="readonly"/>
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                        </div>
                    </div>                   
                      <div class="form-group required">
                        <label for="input-address-1" class="col-sm-2 control-label">주소</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sample6_address" placeholder="Address 1" value="${list.member_address1 }" name="member_address1"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-address-2" class="col-sm-2 control-label">상세주소</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sample6_address2" placeholder="Address 2" value="${list.member_address2 }" name="member_address2"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-account" class="col-sm-2 control-label">계좌번호</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="member_account" placeholder="계좌번호" value="${list.member_account }" name="member_account">
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
                      <input type="button" class="btn btn-primary" id = "updateBtn" value="정보 수정">
                 
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp"%>
