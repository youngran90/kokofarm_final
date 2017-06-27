<%@page import="kokofarm.member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>KokoFarm</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="e-commerce site well design with responsive view." />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
<link href="/resources/css/stylesheet.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link href="/resources/owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen" />
<link href="/resources/owl-carousel/owl.transitions.css" type="text/css" rel="stylesheet" media="screen" />

<script src="/resources/javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/javascript/jstree.min.js" type="text/javascript"></script>
<script src="/resources/javascript/template.js" type="text/javascript" ></script>
<script src="/resources/javascript/common.js" type="text/javascript"></script>
<script src="/resources/javascript/global.js" type="text/javascript"></script>
<script src="/resources/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript">



<%
MemberVO vo = (MemberVO)session.getAttribute("login");
System.out.println("세션값" +vo);

	if(vo==null){%>
	$(function(){
		$(".list-inline li").eq(0).css("display","none");
			});
				
	<%}

		if(vo !=null) {
		String id = vo.getMember_id();
		System.out.println("세션아이디 :" +vo.getMember_id());
		System.out.println("포인트 :" +vo.getMember_point());
%>$(function(){
	$(".dropdown-menu-right a").eq(0).attr("href","/member/myPage");
	 $(".dropdown-menu-right a").eq(0).text("마이페이지");
	 
	 $(".dropdown-menu-right a").eq(1).attr("href","/member/logout").text("로그아웃");
	
	
	
	});
<%}%>
	
	
	</script>

</head>

<body>
<div class="preloader loader" style="display: block; background:#f2f2f2;"> <img src="/resources/image/loader.gif"  alt="#"/></div>
<header>
  
  <div class="container">
    <div class="header-inner">
      <div class="col-sm-4 col-xs-6 header-left">
        <div class="shipping">
          <div class="shipping-img"></div>
          <div class="shipping-text">+81(010)1234-7777<span class="shipping-detail">Week From 9:00am To 7:00pm</span></div>
        </div>
      </div>
      <div class="col-sm-4 col-xs-12 header-middle">
        <div class="header-middle-top">
          <div id="logo"> <a href="/"><img src="/resources/image/logo.png" title="E-Commerce" alt="E-Commerce" class="img-responsive" /></a> </div>
        </div>
      </div>

    </div>
  </div>
</header>
<nav id="menu" class="navbar">
  <div class="nav-inner container">
    <div class="navbar-header"><span id="category" class="visible-xs">1:1문의</span>
    </div>
  </div>
</nav>


<script type="text/javascript">
function send(){

	 var inquiry_content = $("#inquiry_content").val();
	 
	 var param = $("#inqueryForm").serialize();
	
	if(inquiry_content == ''){
		alert("빈칸을 입력해주세요");
	}else{
		$.ajax({
			type: "post",
			url:   "/mypage/InsertInquiry",
	        data: param,
	        success: function (data) {
	        	alert("상품문의가 정상적으로 요청되었습니다.");
	        	button_event();
	        	
	        },
	        error: function (data) {
	            console.log('Error:', data);
	            alert("오류");
	        }
		})
	}
	
}

function button_event(){
	if (confirm("작성글을 보시겠습니까??") == true){    //확인
	    opener.document.location.href="/mypage/list_Inquiry";
		self.close();
	}else{   //취소
	    window.close();
	}
}

</script>
<div class="container" style="margin: 40px">
<form id="inqueryForm" class="inqueryForm">
<input type="hidden" name="product_no" id="product_no" value="${inquiry.product_no }">
<input type="hidden" name="product_name" id="product_name" value="${inquiry.product_name}">
<input type="hidden" name="seller_no" id="seller_no" value="${inquiry.seller_no}">
<input type="hidden" name="member_id" id="member_id" value="${login.member_id}">

<div id="inquiry"></div>
           

		<div class="form-group">
              <label class="control-label" for="input-inquiry">* 문의자ID<span style="margin-left: 20px; color: black;">${login.member_id}</span></label>
        </div>


		<div class="form-group">
              <label class="control-label" for="input-inquiry">* 문의상품<span style="margin-left: 20px; color: black;">${inquiry.product_name}</span></label>
        </div>
        
      <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">문의내용</label>
                  <textarea rows="5" name="inquiry_content" id="inquiry_content" class="form-control"  style="resize:none;"></textarea>
                  <div class="help-block"><span class="text-danger">Note:</span>로그인시 작성가능합니다.</div>
                </div>
              </div>
     

			<div class="buttons clearfix">
                <div class="pull-right">
                 <input type="button" id="button-review"  value="문의글보내기"   data-loading-text="Loading..." class="btn btn-primary" onclick="send();">
                <input type="button" value="취소" class="btn btn-primary" onclick="self.close();">
                </div>
              </div>
  			</form>
      </div>
	  
