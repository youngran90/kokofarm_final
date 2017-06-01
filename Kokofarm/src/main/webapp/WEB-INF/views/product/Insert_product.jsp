<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src='//rawgit.com/tuupola/jquery_chained/master/jquery.chained.min.js'></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

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
	var product_detailimage = $('#product_detailimage').val();
	var product_sellerimage = $('#product_sellerimage').val();
	
	if(product_name == ''){
		alert("상품명을 입력해주세요");
	
	}else if(product_unit == ''){
		alert("상품 단위를 입력해주세요");
		
	}else if(product_price == ''){
		alert("상품 단가를 입력해주세요");
		
	}else if(product_harvest == ''){
		alert("수확일을 선택해주세요");
		
	}else if(product_mainimage == ''){
		alert("메인이미지를 등록하세요");
		
	}else if(product_detailimage == ''){
		alert("상세이미지를 등록하세요");
		
	}else if(product_sellerimage == ''){
		alert("판매업자 이미지를 등록하세요");
		
	}else{
		alert("성공");
		document.product_form.submit();
	}
	
}
 $(function(){

	 $("#ca2").chained("#ca1");
	 $("#ca3").chained("#ca2");

 })
 
</script>

<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>

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
            <form class="form-horizontal" enctype="multipart/form-data" method="post" action="register.html">
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
                            <input type="text" class="form-control" id="product_name" placeholder="상품이름" value="" name="product_name">
                        </div>
                    </div>
                   
                    <div class="form-group required">
                        <label for="input-category" class="col-sm-2 control-label">상품 분류</label>
                        <div class="col-sm-10">
							<select  id="ca1" name="ca1">
								  <option value="">-- 대분류 --</option>
								  <option value="vegetable">야채</option>
								  <option value="fruit">과일</option>
							</select>
							<select id="ca2" name="ca2">
								  <option value="">-- 중분류 --</option>
								  <option class="vegetable" value=vs>쌈/야채</option>
								  <option class="vegetable" value="vf">열매채소</option>
								  <option class="vegetable" value="vr">뿌리채소</option>
								  <option class="fruit" value="fs">과일</option>
								
							</select>
							<select id="ca3" name="ca3">
								  <option value="">-- 소분류 --</option>
								  <option class="vs" value="vs_1">상추/깻잎</option>
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
                            <input type="text" class="form-control" id="input-lastname" placeholder="단위 당  ex)10000 (1kg기준) " value="" name="product_price">
                        </div>
                    </div>
                    
                    <div class="form-group required">
                        <label for="input-product_unit" class="col-sm-2 control-label">단위</label>
                        <div class="col-sm-10">
                            <input type=text id="product_unit" placeholder="ex)1" value="" name="product_unit">
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
                            <input type="text" class="form-control" id="product_area" placeholder="생산지" value="" name="product_area">
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-producer" class="col-sm-2 control-label">생산자</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="producer" placeholder="생산자" value="" name="producer">
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
                           <input type="file" id="product_mainimage" name="product_mainimage">
                        </div>
                        </div>
                          <div class="form-group">
                        <label for="input-product_detailimage" class="col-sm-2 control-label">상세이미지</label>
                        <div class="col-sm-10">
                           <input type="file" id="product_detailimage" name="product_detailimage">
                        </div>
                        </div>
                          <div class="form-group required">
                        <label for="input-product_sellerimage" class="col-sm-2 control-label">판매자이미지</label>
                        <div class="col-sm-10">
                           <input type="file" id="product_sellerimage" name="product_sellerimage">
                        </div>
                        </div>
                  
                  <div class="form-group">
			<label for="exampleInputEmail1">File DROP Here</label>
			<div class="fileDrop"></div>
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

<script type="text/javascript" src="/resources/upload/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>    

<script>

var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	var formData = new FormData();
	
	formData.append("file", file);	
	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
	that.append(str);

	that.get(0).submit();
});

$(".uploadedList").on("click", ".delbtn", function(event){
	
	event.preventDefault();
	
	var that = $(this);
	 
	$.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
   });
});


</script>

    
    
    
  <%@include file="../include/footer.jsp"%>