<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src='//rawgit.com/tuupola/jquery_chained/master/jquery.chained.min.js'></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript"> 

$(function() {
    $( "#testDatepicker" ).datepicker({
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   		 altField : '#getdate',
   		dateFormat: "yy/mm/dd"

  });
});

function submit1(){

	var product_name = $('#product_name').val();
	var product_unit = $('#product_unit').val();
	var product_price = $('#product_price').val();
	var product_harvest = $('#testDatepicker').val();
	var product_mainimage = $('#product_mainimage').val();
	var product_sellerimage = $('#product_sellerimage').val();
	alert("dd");

	var ca1 = $("#ca1 option:selected").val();
	var ca2 = $("#ca2 option:selected").val();
	var ca3 = $("#ca3 option:selected").val();

	if(product_name == ''){
		alert("상품명을 입력해주세요");
		return;
	
	}else if(product_unit == ''){
		alert("상품 단위를 입력해주세요");
		return;
		
	}else if(product_price == ''){
		alert("상품 단가를 입력해주세요");
		return;
		
	}else if(product_harvest == ''){
		alert("수확일을 선택해주세요");
		return;
		
	}else if(product_mainimage == ''){
		alert("메인이미지를 등록하세요");
		return;
		
	}else if(product_sellerimage == ''){
		alert("상세이미지를 등록하세요");
		return;
		
	}else{
		alert("성공");
		document.getElementById('registerForm').submit();
	}
	
}
 $(function(){

	 $("#ca2").chained("#ca1");
	 $("#ca3").chained("#ca2");
	
 })
 
 var ckeditor_config = { 
		resize_enabled : false, // 에디터 크기를 조절하지 않음 
		enterMode : CKEDITOR.ENTER_BR , // 엔터키를 <br> 로 적용함. 
		shiftEnterMode : CKEDITOR.ENTER_P , // 쉬프트 + 엔터를 <p> 로 적용함. 
		toolbarCanCollapse : true , removePlugins : "elementspath", // DOM 출력하지 않음 
		filebrowserUploadUrl: '/product/file_upload',

		toolbar : [ [ 'Source', '-' , 'NewPage', 'Preview' ],
			[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ], 
			[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
			[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
			'/',
			[ 'Styles', 'Format', 'Font', 'FontSize' ], 
			[ 'TextColor', 'BGColor' ], 
			[ 'Image', 'Flash', 'Table' , 'SpecialChar' , 'Link', 'Unlink'] ] 
			};



var editor = null; jQuery(function() { // ckeditor 적용 
	editor = CKEDITOR.replace( "contents" , ckeditor_config ); 
	}); 


function form_save(form) { 
	editor.updateElement();
}
 
window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', '${file_path}'); 

function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
         $(this).apend()

    }); 
}
</script>



<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li><a href="#">Account</a></li>
        <li><a href="register.html">Register</a></li>
    </ul>
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
            <h1>상품등록</h1>
            <P><strong></strong></P>
            <form id="registerForm" class="form-horizontal" role="form" method="post" action="Insert_product" enctype="multipart/form-data">
                <fieldset id="account">
                    <legend>상품카테고리를 정확하게 입력해주세요</legend>
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
                        <label for="input-product_name" class="col-sm-2 control-label">상품 이름</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="product_name" placeholder="상품이름" value="1"  name="product_name">
                        </div>
                    </div>
                   
                    <div class="form-group required">
                        <label for="input-category" class="col-sm-2 control-label">상품 분류</label>
                        <div class="col-sm-10">
							<select  id="ca1" name="ca1">
								  <option value="">-- 대분류 --</option>
								  <option value="vegetable" selected="selected">야채</option>
								  <option value="fruit">과일</option>
							</select>
							<select id="ca2" name="ca2">
								  <option value="">-- 중분류 --</option>
								  <option class="vegetable" value="vs" selected="selected">쌈/야채</option>
								  <option class="vegetable" value="vf">열매채소</option>
								  <option class="vegetable" value="vr">뿌리채소</option>
								  <option class="fruit" value="fs">과일</option>
								
							</select>
							<select id="ca3" name="ca3">
								  <option value="">-- 소분류 --</option>
								  <option class="vs" value="vs_1" selected="selected">상추/깻잎</option>
								  <option class="vs" value="vs_2">치커리/케일</option>
								  <option class="vs" value="vs_3">쑥갓/청겨자</option>
								  <option class="vf" value="vf_1">가지/오이</option>
								  <option class="vf" value="vf_2">고추/파프리카</option>
								  <option class="vf" value="vf_3">옥수수/호박</option>
								  <option class="vr" value="vr_1">양파/당근</option>
								  <option class="vr" value="vr_2">무/파</option>
								  <option class="vr" value="vr_3">생각/마늘</option>
								  <option class="vr" value="vr_4">고구마/감자</option>


								  <option class="fs" value="fs_1">딸기</option>
								  <option class="fs" value="fs_2">한라봉</option>
								  <option class="fs" value="fs_3">수박</option>
								  <option class="fs" value="fs_4">참외</option>
								  <option class="fs" value="fs_5">포도</option>
								  <option class="fs" value="fs_6">복숭아</option>
								  <option class="fs" value="fs_7">배</option>
								  <option class="fs" value="fs_8">사과</option>
								  <option class="fs" value="fs_9">귤</option>
								  <option class="fs" value="fs_10">바나나</option>
								  <option class="fs" value="fs_11">복분자</option>
								  <option class="fs" value="fs_12">블루베리</option>
								  <option class="fs" value="fs_13">기타</option>
							</select>
                        </div>
                    </div>
                    
                     <div class="form-group required">
                        <label for="input-product_price" class="col-sm-2 control-label">상품 가격</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input-lastname" placeholder="단위 당  ex)10000 (1kg기준) " value="1" name="product_price"  onkeydown="onlyNumber(this)"/>
                        </div>
                    </div>
                    
                    <div class="form-group required">
                        <label for="input-product_unit" class="col-sm-2 control-label">단위</label>
                        <div class="col-sm-10">
                            <input type=text id="product_unit" placeholder="ex)1" value="1"  name="product_unit" onkeydown="onlyNumber(this)"/>
                        	<select id="unit" name="unit">
								  <option value="kg">kg</option>
								  <option value="g">g</option>
								  <option value="box">box</option>
							</select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-product_area" class="col-sm-2 control-label">생산지</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="product_area" placeholder="생산지" value="1" name="product_area">
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-producer" class="col-sm-2 control-label">생산자</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="producer" placeholder="생산자" value="1"  name="producer">
                        </div>
                    </div>
                    
                    <div class="form-group required">
                        <label for="input-product_harvestdate" class="col-sm-2 control-label">수확일</label>
                        <div class="col-sm-10">
                         <input type="text" id="testDatepicker"  name="product_harvestdate" class="text" placeholder="날짜선택"/>
                        </div>
                    </div>
                </fieldset>
                
                  <fieldset>
                   <legend>상품 이미지
                    <sub>* 메인이미지는 자동으로 작은 이미지로 변경되어 리스트에 반영됩니다.</sub>
                   </legend>
                    <div class="form-group required">
                        <label for="input-product_mainimage" class="col-sm-2 control-label">상품메인이미지</label>
                        <div class="col-sm-10">
                           <input multiple="multiple" type="file" id="product_mainimage" name="file1">
                        </div>
                        </div>
                         
                           <div class="form-group">
                        <label for="input-s_contents" class="col-sm-2 control-label">메인 간단 설명</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="s_contents" placeholder="메인이미지 옆 간단설명을 입력해주세요" value="1" name="s_contents">
                        </div>
                    </div>
                          <div class="form-group required">
                        <label for="input-product_sellerimage" class="col-sm-2 control-label">판매자이미지</label>
                        <div class="col-sm-10">
                           <input multiple="multiple" type="file" id="product_sellerimage" name="file2">
                        </div>
                        </div>
                  
                  <div class="form-group">
			<label for="exampleInputEmail1" style="margin-left: 10%">상세파일</label>
			<textarea id="contents" name="contents"></textarea>
		</div>
 	       </fieldset>
                
                <fieldset>
                 <legend></legend>
                 <div class="bottons" style="margin-left: 30%;">
                   <input class="btn btn-primary"  type="button" value="상품저장" onclick="submit1()" >&nbsp;&nbsp; 
				   <input class="btn btn-primary"  type="reset" value="취소" >
				   </div>
                    </fieldset>
            </form>
        </div>
    </div>
</div>



    
    
    
  <%@include file="../include/footer.jsp"%>