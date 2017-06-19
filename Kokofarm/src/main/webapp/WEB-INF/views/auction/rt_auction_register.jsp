<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<title>코코팜::상품등록</title>
<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
/* datetimepicker */
$(function(){
   $("#rt_auction_date").datepicker({
      local:"ko",
      dateFormat:"yy-mm-dd",
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      maxDate: 5,
      minDate: -1
   });
});


/* register alert */
function register(){
	var rt_auction_name=$('#rt_auction_name').val();
	var	rt_auction_group=$('#rt_auction_group').val();
	var rt_auction_time=$('#rt_auction_time').val();
	var rt_auction_date=$('#rt_auction_date').val();
	var rt_auction_down=$('#rt_auction_down').val();
	var rt_auction_unit=$('#rt_auction_unit').val();
	var rt_auction_units=$('#rt_auction_units').val();
	var rt_auction_location=$('#rt_auction_location').val();
	var rt_auction_area=$('#rt_auction_area').val();
	var rt_auction_title=$('#rt_auction_title_img').val();
	var rt_auction_content=$('#rt_auction_content').val();
	
	if(rt_auction_name==''){
		alert("상품명을 입력하세요.");
		return;
	}else if(rt_auction_time==''){
		alert("경매시간을 선택하세요.");
		return;
	}else if(rt_auction_date==''){
		alert("경매날짜를 선택하세요.");
		return;
	}else if(rt_auction_down==''){
		alert("상품의 하한가를 입력하세요.");
		return;
	}else if(rt_auction_unit==''){
		alert("상품의 상세단위를 입력하세요.");
		return;
	}else if(rt_auction_area==''){
		alert("상세주소를 입력하세요");
		return;
	}else if(rt_auction_title==''){
		alert("상품의 대표이미지를 선택하세요.");
		return;
	}else{
		alert("경매가 등록되었습니다.");
		document.getElementById('auction_register').submit();
	}
};

	/* CKEditor */
	var ckeditor_config = {
			resize_enabled : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			toolbarCanCollapse : true, 
			removePlugins : "elementspath",
			filebrowserUploadUrl : '/auction/file_upload',
			
			toolbar : [['Source', '-', 'NewPage', 'Preview'],
				['Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo'],
				['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
				['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
				['Image', 'Flash', 'Table', 'SpecialChar', 'Link', 'Unlink']
			]
		};
	
	
	var editor = null;
	jQuery(function(){
		editor = CKEDITOR.replace("rt_auction_content", ckeditor_config);
	});
	
	function form_save(form){
		editor.updateElement();
	}
	
	window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', '${file_path}');
	
	
	
</script>

<div class="container">
    <ul class="breadcrumb">
        <li><a href="http://localhost:8081/"><i class="fa fa-home"></i></a></li>
        <li><a href="/auction/rt_auction_list">실시간 경매</a></li>
        <li><a href="#">실시간 경매 등록</a></li>
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
            <h1>실시간 경매</h1>
            <!-- <p>If you already have an account with us, please login at the <a href="login">login page</a>.</p> -->
            <form class="form-horizontal" enctype="multipart/form-data" method="post" id="auction_register" action="rt_auction_register">
                <fieldset id="account">
                    <legend>실시간 경매 상품 등록</legend>
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
                            <input type="text" class="form-control" id="rt_auction_name" name="rt_auction_name" placeholder="상품명을 입력해주세요.">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">분류</label>
                        <div class="col-sm-10">
                            <select id="rt_auction_group" name="rt_auction_group" style="height:32px; width:790px;">
                            	<option>&nbsp;&nbsp;분류를 선택해주세요</option>
                            	<option value="과일">과일류</option>
                            	<option value="채소">채소류</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-lastname" class="col-sm-2 control-label">경매일</label>
                        <div class="col-sm-10">
                        <select id="rt_auction_time" name="rt_auction_time" style="height: 32px; width: 169px; float: left;
                        text-align: center;">
                            	<option>시간을 선택해주세요</option>
                            	<option value="10:00:00" id="am">오전 10시</option>
                            	<option value="22:00:00" id="pm">오후 10시</option>
                            </select>
                            <input type="text" class="form-control" id="rt_auction_date" name="rt_auction_date"
                            style="height:32px; width:619px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">하한가</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="rt_auction_down" placeholder="하한가를 입력해주세요." name="rt_auction_down">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">단위</label>
                        <div class="col-sm-10">  
                            <select id="rt_auction_units" name="rt_auction_units" style="height:32px; width: 169px; float:left; text-align: center;">
                        	<option value="kg">kg</option>
                        	<option value="g">g</option>
                        	<option value="박스">박스</option>
                        	<option>기타</option>
                        </select>
                            <input type="text" class="form-control" id="rt_auction_unit" placeholder="단위를 자세히 입력해주세요." 
                        name="rt_auction_unit" style="width:619px; height:32px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">생산지/원산지</label>
                        <div class="col-sm-10">
                            <select id="rt_auction_location" name="rt_auction_location" style="height:32px; width: 169px; float:left;
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
                            id="rt_auction_area" name="rt_auction_area" style="width:619px; height:32px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="height:32px;">대표이미지</label>
                        <div class="col-sm-10">
                           <input type="file" id="rt_auction_title_img" name="rt_file" style="height:32px; width:790px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="height:32px;">상세이미지1</label>
                        <div class="col-sm-10">
                           <input type="file" id="rt_auction_title_img01" name="rt_file2" style="height:32px; width:790px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="height:32px;">상세이미지2</label>
                        <div class="col-sm-10">
                           <input type="file" id="rt_auction_title_img02" name="rt_file3" style="height:32px; width:790px;">
                        </div>
                    </div>
                    <!-- 에디터 끼워넣을 곳! -->
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label">상세내용</label>
                        <div class="col-sm-10">
                          <textarea id="rt_auction_content" name="rt_auction_content"></textarea>
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