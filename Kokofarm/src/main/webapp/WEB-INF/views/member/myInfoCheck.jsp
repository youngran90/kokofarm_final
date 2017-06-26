<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<style>

.pw_check_box {
	width: 500px;
	padding: 32px;
	background: #fff;
	border: 1px solid #d9d9d9;
	margin: 0 auto;
}

.pw_check_box .info_tit {
	font-size: 16px;
	font-family: YG76;
	color: #352f29;
	margin-bottom: 10px;
}

.pw_check_box .caption {
	padding-left: 24px;
	margin-bottom: 10px;
	background: url(../images/common/bu_check.png) no-repeat 0 center;
}

.pw_check_box table {
	width: 100%;
	margin-bottom: 20px;
}

.pw_check_box table th {
	width: 100px;
	text-align: left;
}

.pw_check_box table th, .pw_check_box table td {
	height: 48px;
	font-size: 14px;
}

.pw_check_box table td span {
	color: #38a9a5;
	font-family: YG76;
	font-size: 14px;
}

.pw_check_box table td input {
	width: 77%;
	padding: 0 2%;
}

.pw_check_box .btn_box {
	text-align: center;
}

.pw_check_box .btn_comp {
	text-align: center;
	width: 200px;
	height: 45px;
	background: #38a9a5;
	color: #fff;
	border: 0;
	font-family: YG76;
	font-size: 18px;
}

.mp_modify_content2 .btn_pw_mod {
	display: inline-block;
	height: 35px;
	line-height: 35px;
	padding: 0 17px;
	background: #352f29;
	color: #fff;
	text-decoration: none;
	vertical-align: middle;
}

.mp_modify_content2 .caption {
	color: #777;
	padding-left: 20px;
	margin-bottom: 10px;
	background: url(../images/common/bu_check.png) no-repeat;
}

.mp_modify_content2 .btn_box {
	text-align: center;
}

.mp_modify_content2 .btn_modify_submit {
	display: inline-block;
	text-align: center;
	width: 160px;
	height: 45px;
	line-height: 45px;
	color: #fff;
	font-family: YG77;
	font-size: 15px;
	margin: 0 2px;
	text-decoration: none;
	background: #38a9a5;
	border: 0;
}


.sub_in_top_box {
	position: relative;
	margin-bottom: 50px;
	text-align: center;
}

.sub_in_top_box .sub_in_tit {
	font-size: 21px;
	font-family: YG77;
	color: #352f29;
	margin-bottom: 19px;
	margin-top: 24px;
}

input.inst_txt{
height: 38px;
	line-height: 33px;
	border: 1px solid #cccccc;
	background: #fff;
	padding: 0 10px;
	outline: 0;

}

input.inst_txt:focus {
	border-color: #38a9a5;
	background: #fff8ed;
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
 		var jq = $.noConflict(true);
 	</script>
 	
<script>
	function enterkey() {
		if (window.event.keyCode == 13) {

			jq('#infoCheckBtn').trigger('click');
		}
	}

	jq(document).ready(function(){
		

	jq('#infoCheckBtn').on('click',function(){
		var params = jq('#myInfoCheck').serialize();
		
		jq.ajax({
			type : "post",
			url : "/member/myInfoCheck",
			data : params,
			dataType : 'text',
			success : function(result){
				
				if (result==1){
					alert("비밀번호 맞음");
					 document.myInfoCheck.submit();
				}else {
					alert("비밀 번호가 맞지 않습니다.");
				}
			}
			
		})
		
	})
	
	})
	
	
</script>
<div class="container">
	<div class="sub_in_top_box">
		<h3 class="sub_in_tit">비밀번호 확인</h3>
		<p class="sub_caption">회원님의 정보를 안전하게 보호하기 위하여 비밀번호를 다시 한번 입력해 주세요.</p>
	</div>
    
    <form enctype="multipart/form-data" method="post" id = "myInfoCheck" name="myInfoCheck" action="/member/myInfo">
	<div class="pw_check_box">
	<input type="hidden" value="${login.member_id }" name = "member_id" id = "member_id">
		<table>
			<colgroup>
				<col width="100">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>아이디</th>
					<td><span>${login.member_id }</span></td>
				</tr>
				<tr>
					<th>비밀번호</th>					
					<td><input type="password" name="member_password"	id="member_password" class="inst_txt"></td>
				</tr>
			</tbody>
		</table>
		<div class="btn_box">
			<input type="button" value="확인" class="btn_comp" id = "infoCheckBtn" onkeyup="enterkey()">
			
		</div>		
	</div>
</form>

</div>

<%@include file="../include/footer.jsp"%>

