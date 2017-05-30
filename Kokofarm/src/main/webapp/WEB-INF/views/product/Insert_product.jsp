<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style type="text/css">
.buttons{
width: 80px;
height: 30px;
}

input:not(.buttons){
width: 80%;
height: 50%;
font-size: 20px;
}

td{
text-align: center;
font-size: 20px;
}

</style>
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
</script>
</head>
<body>

<div id="body" style="margin: 5%">
	<form action="Insert_product" name="product_form" method="post" enctype="multipart/form-data">
	
<table border="1" cellpadding="0" cellspacing="0" style="border: solid #eaeaea 1px; ">
			<tr >
				<td >상품이름</td>
				<td >
				<input type="text" id="product_name" name="product_name" placeholder="상품이름입력"></td>
			</tr>

			<tr>
				<td >상품단위</td>
				<td ><input type="text"  id="product_unit" name="product_unit" placeholder="상품단위입력 ex)1kg"></td>
			</tr>

			<tr >
				<td>상품가격</td>
				<td><input type="text"  id="product_price" name="product_price" placeholder="상품가격입력 ex)5000"></td>
			</tr>

		<tr>
				<td>수확일</td>
				<td><input type="text" id="testDatepicker"  name="product_harvestdate" class="text" placeholder="날짜선택"/></td>
			</tr>
	
	
			<tr>
				<td >메인사진</td>
				<td><input type="file" id="product_mainimage" name="product_mainimage"></td>
			</tr>

			<tr>
				<td>상세사진</td>
				<td><input type="file"  id="product_detailimage" name="product_detailimage"></td>
			</tr>

			<tr>
				<td>제조업자사진</td>
				<td ><input type="file" id="product_sellerimage" name="product_sellerimage"></td>
			</tr>

			<tr>
				<td colspan="2">
				<input class="buttons" type="button" value="상품저장" onclick="submit1()">&nbsp;&nbsp; 
				<input class="buttons" type="reset" value="취소" >
				</td>
			</tr>
		</table>

				<a href="listproductAction.product">리스트</a>

	</form>
</div>



<%@include file="../include/footer.jsp"%>