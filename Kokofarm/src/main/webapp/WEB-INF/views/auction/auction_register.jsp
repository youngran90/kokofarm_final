<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<title>코코팜::상품등록</title>
<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
$(function(){
	$("#start_date").datepicker({
		local:"ko",
	      dateFormat:"yy-mm-dd",
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      maxDate: 5,
	      minDate: -1
		});
	$("#end_date").datepicker({
		local:"ko",
	      dateFormat:"yy-mm-dd",
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      maxDate: 5,
	      minDate: -1
		});
});
	
	
function register(){
	var name=$('#auction_name').val();
	var group=$('#auction_group').val();
	var start_date=$('#start_date').val();
	var end_date=$('#end_date').val();
	var up=$('#auction_up').val();
	var down=$('#auction_down').val();
	var unit=$('#auction_unit').val();
	var units=$('#auction_units').val();
	var location=$('#auction_location').val();
	var area=$('#auction_area').val();
	var title=$('#auction_title_img').val();
	var content=$('#auction_content').val();
	
	if(name==''){
		alert("상품명을 입력하세요.");
		return;
	}else if(group==''){
		alert("분류를 선택하세요.");
		return;
	}else if(start_date==''){
		alert("경매시작일을 선택하세요.");
		return;
	}else if(end_date==''){
		alert("경매종료일을 선택하세요.");
		return;
	}else if(up==''){
		alert("상품의 상한가를 입력하세요.");
		return;
	}else if(down==''){
		alert("상품의 하한가를 입력하세요.");
	}
	else if(auction_unit==''){
		alert("상품의 상세단위를 입력하세요.");
		return;
	}else if(auction_area==''){
		alert("상세주소를 입력하세요");
		return;
	}else if(title==''){
		alert("상품의 대표이미지를 선택하세요.");
		return;
	}else{
		alert("경매가 등록되었습니다.")
		document.getElementById('auction_register').submit();
	}
};




	var ckeditor_config = {
			resize_enabled : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			toolbarCanCollapse : true, 
			removePlugins : "elementspath",
			filebrowserUploadUrl : "/auction/file_upload",
			
			toolbar : [ [ 'Source', '-' , 'NewPage', 'Preview' ],
				[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ], 
				[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
				[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
				'/',
				[ 'Styles', 'Format', 'Font', 'FontSize' ], 
				[ 'TextColor', 'BGColor' ], 
				[ 'Image', 'Flash', 'Table' , 'SpecialChar' , 'Link', 'Unlink'] 
			]		
		};
			
	var editor = null;
	jQuery(function(){
		editor = CKEDITOR.replace("auction_content", ckeditor_config);
	});
	
	function form_save(form){
		editor.updateElement();
	}
	
	window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', '${file_path}');
	
</script>

<div class="container">
    <ul class="breadcrumb">
        <li><a href="http://localhost:8081/"><i class="fa fa-home"></i></a></li>
        <li><a href="/auction/auction_list">일반 경매</a></li>
        <li><a href="#">일반 경매 등록</a></li>
    </ul>
    <div class="row">
    <!-- LNB 시작 -->
        <div class="col-sm-3 hidden-xs column-left" id="column-left">
            <div class="column-block">
                <div class="columnblock-title">Account</div>
                <div class="account-block">
                    <div class="list-group"> <a class="list-group-item" href="login.html">Login</a> <a class="list-group-item" href="register.html">Register</a> <a class="list-group-item" href="forgetpassword.html">Forgotten Password</a> <a class="list-group-item" href="#">My Account</a> <a class="list-group-item" href="#">Address Book</a> <a class="list-group-item" href="#">Wish List</a> <a class="list-group-item" href="#">Order History</a> <a class="list-group-item" href="download">Downloads</a> <a class="list-group-item" href="#">Reward Points</a> <a class="list-group-item" href="#">Returns</a> <a class="list-group-item" href="#">Transactions</a> <a class="list-group-item" href="#">Newsletter</a><a class="list-group-item last" href="#">Recurring payments</a> </div>
                </div>
            </div>
        </div>
    <!-- LNB 끝 -->    
    <!-- Content 시작 -->
        <div class="col-sm-9" id="content">
            <h1>일반 경매</h1>
            <!-- <p>If you already have an account with us, please login at the <a href="login">login page</a>.</p> -->
            <form class="form-horizontal" enctype="multipart/form-data" method="post" id="auction_register" action="auction_register">
                <fieldset id="account">
                    <legend>일반 경매 상품 등록</legend>
                    <div style="display: none;" class="form-group required">
                        <label class="col-sm-2 control-label">Customer Group</label>
                        <div class="col-sm-10">
                            <!-- <div class="radio">
                                <label>
                                    <input type="radio" checked="checked" value="1" name="customer_group_id">
                                    Default</label>
                            </div> -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-firstname" class="col-sm-2 control-label">상품명</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="auction_name" placeholder="상품명을 입력해주세요." name="auction_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">분류</label>
                        <div class="col-sm-10">
                            <select id="auction_group" name="auction_group" style="height:32px; width:790px;">
                            	<option>&nbsp;&nbsp;분류를 선택해주세요</option>
                            	<option value="과일">과일류</option>
                            	<option value="채소">채소류</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-lastname" class="col-sm-2 control-label">경매시작일</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="start_date" name="start_date" placeholder="날짜를 선택해주세요."
                            style="width: 389px; float: left; margin-right: 10px;">
                            <select id="selectedTime">
                            	<option id="am" value="am">오전</option>
                            	<option id="pm" value="pm">오후</option>
                            </select>
                            <select>
                            	<option>01</option><option>02</option>
                            	<option>03</option><option>04</option>
                            	<option>05</option><option>06</option>
                            	<option>07</option><option>08</option>
                            	<option>09</option><option>10</option>
                            	<option>11</option><option>12</option>
                            </select>
                            <select>
                            	<option>00</option><option>05</option><option>10</option>
                            	<option>15</option><option>20</option><option>25</option>
                            	<option>30</option><option>35</option><option>40</option>
                            	<option>45</option><option>50</option><option>55</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-email" class="col-sm-2 control-label">경매종료일</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="end_date" name="end_date">
                            <input type="text" class="form-control" id="end_time" name="end_time">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-telephone" class="col-sm-2 control-label">상한가</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="auction_up" placeholder="상한가를 입력해주세요." name="auction_up">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">하한가</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="auction_down" placeholder="하한가를 입력해주세요." name="auction_down">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">단위</label>
                        <div class="col-sm-10">  
                        <select id="auction_units" name="auction_units" style="height:32px; width: 169px; float:left; text-align: center;">
                        	<option value="kg">kg</option>
                        	<option value="g">g</option>
                        	<option value="박스">박스</option>
                        	<option>기타</option>
                        </select>
                            <input type="text" class="form-control" id="auction_unit" placeholder="단위를 자세히 입력해주세요." 
                        name="auction_unit" style="width:619px; height:32px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">생산지/원산지</label>
                        <div class="col-sm-10">
                        <select id="auction_location" name="auction_location" style="height:32px; width:150px; float:left;
                        text-align: center;">
                        	<option value="서울특별시">서울특별시</option>
                        	<option value="인천광역시">인천광역시</option>
                        	<option value="경기도">경기도</option>
                        	<option value="강원도">강원도</option>
                        	<option value="충청북도">충청북도</option>
                        	<option value="충청남도">충청남도</option>
                        	<option value="전라북도">전라북도</option>
                        	<option value="전라남도">전라남도</option>
                        	<option value="경상북도">경상북도</option>
                        	<option value="경상남도">경상남도</option>
                        	<option value="제주특별자치도">제주특별자치도</option>
                        </select>
                            <input type="text" class="form-control" placeholder="주소를 입력해주세요." 
                            id="auction_area" name="auction_area" style="width:638px; height:32px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">대표이미지</label>
                        <div class="col-sm-10">
                           <input type="file" id="auction_title_img" name="file" style="height:32px; width:787px;">
                        </div>
                        </div>
                    <!-- 에디터 끼워넣을 곳! -->
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">상세내용</label>
                        <div class="col-sm-10">
                          <textarea id="auction_content" name="auction_content"></textarea>
                        </div>
                    </div>
                </fieldset>
           
                <div class="buttons" style="text-align:right">
                    <input type="button" class="btn btn-primary" value="등록하기" onclick="register()">
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="../include/footer.jsp"%>
<!-- Content 끝 -->