<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    
    
    
    
    

<%@include file="../include/header.jsp"%>

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
                    <div class="list-group"> <a class="list-group-item" href="login.html">Login</a> <a class="list-group-item" href="register.html">Register</a> <a class="list-group-item" href="forgetpassword.html">Forgotten Password</a> <a class="list-group-item" href="#">My Account</a> <a class="list-group-item" href="#">Address Book</a> <a class="list-group-item" href="#">Wish List</a> <a class="list-group-item" href="#">Order History</a> <a class="list-group-item" href="download">Downloads</a> <a class="list-group-item" href="#">Reward Points</a> <a class="list-group-item" href="#">Returns</a> <a class="list-group-item" href="#">Transactions</a> <a class="list-group-item" href="#">Newsletter</a><a class="list-group-item last" href="#">Recurring payments</a> </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9" id="content">
            <h1>회원 가입</h1>
            <p>이미 계정이 가입되어 있으면. <a href="login">Login page</a>.</p>
            <form:form class="form-horizontal" enctype="multipart/form-data" method="post" action="join"  commandName="MemberCommand">
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
                            <form:input type="text" class="form-control" id="member_id" placeholder="아이디" value="" path="member_id"/>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-name" class="col-sm-2 control-label">이 름</label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="member_name" placeholder="이름" value="" path="member_name"/>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-email" class="col-sm-2 control-label">E-Mail</label>
                        <div class="col-sm-10">
                            <form:input type="email" class="form-control" id="member_email" placeholder="E-Mail" value="" path="member_email"/>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-telephone" class="col-sm-2 control-label">핸드폰번호</label>
                        <div class="col-sm-10">
                            <form:input type="tel" class="form-control" id="member_phoneNum" placeholder="Telephone" value="" path="member_phoneNum"/>
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
                        <label for="input-address-1" class="col-sm-2 control-label">주소</label>
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
                                 
                </fieldset>
                <fieldset>
                    <legend>Your Password</legend>
                    <div class="form-group required">
                        <label for="input-password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="member_password" placeholder="암호입력" value="" name="member_password">
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-confirm" class="col-sm-2 control-label">Password Confirm</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="member_password2" placeholder="암호확인" value="" name="member_password2">
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Newsletter</legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Subscribe</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" value="1" name="newsletter">
                                Yes</label>
                            <label class="radio-inline">
                                <input type="radio" checked="checked" value="0" name="newsletter">
                                No</label>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons">
                    <div class="pull-right">I have read and agree to the <a class="agree" href="#"><b>Privacy Policy</b></a>
                        <input type="checkbox" value="1" name="agree">
                        &nbsp;
                        <input type="submit" class="btn btn-primary" value="회원가입">
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp"%>
