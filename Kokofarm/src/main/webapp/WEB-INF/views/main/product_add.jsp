<%@page import="kokofarm.product.domain.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면 사진 등록</title>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
 <script type="text/javascript">
 	$(function(){	
 		$('#sliderReg').on("click",function(){
 			var sNo = $('#sli1').val();
 			var pNo= $('#sli2').val();
 			
 			$.ajax({
 				type : "post",
 				url : "/",
 				data : { slider_no : sNo,
 							product_no : pNo},
 				dataType: "json",
 				success : function(data){
 					alert(data);
 					window.opener.location.reload();		
 					/* $("#main-banner img",parent.opener.document).attr("src","/resources/files/attach/수박_메인배너.jpg") */
 					
 				 				
 				}
 				
 			});
 			});
 	
 		});
 		
 	
 </script>
</head>
 <body>
  
 
  	<div id = "wrap">
  		<label for="input-slider" class="col-sm-2 control-label">슬라이더 이미지 등록</label><br>
  		<select name = "sli1" id="sli1" onchange="alert(this.value)" style="height: 35px;">
  			<option value="slider1">슬라이더 1</option>
  			<option value="slider2">슬라이더 2</option>
  			<option value="slider3">슬라이더 3</option>  		  			
  		</select>
  		
  		<select name = "sli2" id = "sli2" onchange="(this.value)">
  			<c:forEach var="slider" items="${list }">
  			<option value="${slider.product_no }">${slider.producer}의 ${slider.product_name }</option>
  			</c:forEach>
  				
  		</select>
		<div class="button-group">		
  		<input type="button" name = "sliderReg" id="sliderReg" value="등록하기">
  	</div>
  	
  	</div>
  
  
</body>
</html>