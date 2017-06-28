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
		
	}else if(group=null){
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
	}else if(content==""){
		alert("상세내용을 입력하세요.");
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
        <li style="margin-left: 15px;"><a href="http://localhost:8081/"><i class="fa fa-home"></i></a></li>
        <li><a href="/auction/auction_list">일반 경매</a></li>
        <li><a href="#">일반 경매 등록</a></li>
    </ul>
    <div class="row">
    <!-- LNB 시작 -->
        <div class="col-sm-3 hidden-xs column-left" id="column-left">
            <div class="column-block">
                <div class="columnblock-title">일반경매</div>
                <div class="account-block">
                    <div class="list-group">
                    <a class="list-group-item" href="/auction/auction_list">일반 경매</a> 
                    <a class="list-group-item" href="/auction/rt_auction_list" style="border-bottom: none;">실시간 경매</a>
                    </div>
                </div>
            </div>
        </div>
    <!-- LNB 끝 -->    
    <!-- Content 시작 -->
        <div class="col-sm-9" id="content">
            <h1 style="font-weight: bold;">일반 경매</h1>
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
                        <label for="input-firstname" class="col-sm-2 control-label" style="font-weight: bold;">상품명</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="auction_name" placeholder="상품명을 입력해주세요." name="auction_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="font-weight: bold;">분류</label>
                        <div class="col-sm-10">
                            <select id="auction_group" name="auction_group" style="height:32px; width:790px;">
                            	<option value="">&nbsp;&nbsp;분류를 선택해주세요</option>
                            	<option value="과일">과일류</option>
                            	<option value="채소">채소류</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-lastname" class="col-sm-2 control-label" style="font-weight: bold;">경매시작일</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="start_date" name="start_date" placeholder="날짜를 선택해주세요."
                            style="width: 389px; float: left; margin-right: 10px;">
                            <select name="selectedTime" style="height: 35px; width: 80px;">
                            	<option id="am" value="am">&nbsp;오전</option>
                            	<option id="pm" value="pm">&nbsp;오후</option>
                            </select>
                            <select name="select_Time" style="height: 35px; width: 80px;">
                            	<option value="01">&nbsp;00</option><option value="02">&nbsp;02</option>
                            	<option value="03">&nbsp;03</option><option value="04">&nbsp;04</option>
                            	<option value="05">&nbsp;05</option><option value="06">&nbsp;06</option>
                            	<option value="07">&nbsp;07</option><option value="08">&nbsp;08</option>
                            	<option value="09">&nbsp;09</option><option value="10">&nbsp;10</option>
                            	<option value="11">&nbsp;11</option><option value="12">&nbsp;12</option>
                            </select>
                            <select name="select_Min" style="height: 35px; width: 80px;">
                            	<option value="00">&nbsp;00</option><option value="05">&nbsp;05</option>
                            	<option value="10">&nbsp;10</option><option value="15">&nbsp;15</option>
                            	<option value="20">&nbsp;20</option><option value="25">&nbsp;25</option>
                            	<option value="30">&nbsp;30</option><option value="35">&nbsp;35</option>
                            	<option value="40">&nbsp;40</option><option value="45">&nbsp;45</option>
                            	<option value="50">&nbsp;50</option><option value="55">&nbsp;55</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-email" class="col-sm-2 control-label" style="font-weight: bold;">경매종료일</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="end_date" name="end_date" placeholder="날짜를 선택해주세요."
                            style="width: 389px; float: left; margin-right: 10px;">
                            <select name="selectedTime2" style="height: 35px; width: 80px;">
                            	<option id="am2" value="am">&nbsp;오전</option>
                            	<option id="pm2" value="pm">&nbsp;오후</option>
                            </select>
                            <select name="select_Time2" style="height: 35px; width: 80px;">
                            	<option value="01">&nbsp;01</option><option value="02">&nbsp;02</option>
                            	<option value="03">&nbsp;03</option><option value="04">&nbsp;04</option>
                            	<option value="05">&nbsp;05</option><option value="06">&nbsp;06</option>
                            	<option value="07">&nbsp;07</option><option value="08">&nbsp;08</option>
                            	<option value="09">&nbsp;09</option><option value="10">&nbsp;10</option>
                            	<option value="11">&nbsp;11</option><option value="12">&nbsp;12</option>
                            </select>
                            <select name="select_Min2" style="height: 35px; width: 80px;">
                            	<option value="01">&nbsp;00</option><option value="05">&nbsp;05</option>
                            	<option value="10">&nbsp;10</option><option value="15">&nbsp;15</option>
                            	<option value="20">&nbsp;20</option><option value="25">&nbsp;25</option>
                            	<option value="30">&nbsp;30</option><option value="35">&nbsp;35</option>
                            	<option value="40">&nbsp;40</option><option value="45">&nbsp;45</option>
                            	<option value="50">&nbsp;50</option><option value="55">&nbsp;55</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-telephone" class="col-sm-2 control-label" style="font-weight: bold;">상한가</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="auction_up" placeholder="상한가를 입력해주세요." name="auction_up">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="font-weight: bold;">하한가</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="auction_down" placeholder="하한가를 입력해주세요." name="auction_down">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="font-weight: bold;">단위</label>
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
                        <label for="input-fax" class="col-sm-2 control-label" style="font-weight: bold;">생산지/원산지</label>
                        <div class="col-sm-10">
                        <select id="auction_location" name="auction_location" style="height:32px; width: 169px; float:left;
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
                            id="auction_area" name="auction_area" style="width:619px; height:32px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="font-weight: bold;">대표이미지</label>
                        <div class="col-sm-10">
                           <input type="file" id="auction_title_img" name="file" style="height:32px; width:787px;">
                        </div>
                        </div>
                    <!-- 에디터 끼워넣을 곳! -->
                    <div class="form-group">
                        <label for="input-fax" class="col-sm-2 control-label" style="font-weight: bold;">상세내용</label>
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