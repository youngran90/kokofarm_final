<%@page import="kokofarm.member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Fresh Food</title>
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
<style>
.control-label{
font-weight: bold;
color: black;
}

</style>
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
    <div class="navbar-header"><span id="category" class="visible-xs">1:1문의 답변</span>
    </div>
  </div>
</nav>

<script type="text/javascript">
function send(){

	 var inquiry_reply = $("#inquiry_reply").val();
	 var inquiry_no= $("#inquiry_no").val();

	 alert("inquiry_reply: "+inquiry_reply);
	 alert("inquiry_no: "+inquiry_no);
	
	if(inquiry_reply == ''){
		alert("빈칸을 입력해주세요");
	}else{
		$.ajax({
			type: "post",
			url:   "/mypage/Insert_inquiry_reply",
	        data: {"inquiry_no" : inquiry_no,
	        		 "inquiry_reply" : inquiry_reply
	        },
	        success: function (data) {
	        	alert("상품문의가 답변이 완료되었습니다.");
	        	self.close();
	        	opener.location.reload();
	        	
	        },
	        error: function (data) {
	            console.log('Error:', data);
	            alert("오류");
	        }
		})
	}
	
}


</script>
<div class="container" style="margin: 40px">
<form id="inquery_replyForm" class="inquery_replyForm">
<input type="hidden" id="inquiry_no" class="inquiry_no" value="${inquiry.inquiry_no}">
<div id="inquiry"></div>

			<div class="form-group ">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">문의자</label>
                  <div id="member_id" class="member_id" >${inquiry.member_id}</div>
                </div>
            </div>
            
            <div class="form-group ">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">문의상품</label>
                  <div id="product_name" class="product_name">${inquiry.product_name}</div>
                </div>
            </div>
           
			<div class="form-group ">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">문의내용</label>
                  <div id="inquiry_content" class="inquiry_content" >${inquiry.inquiry_content }</div>
                </div>
              </div>
              
      		

      <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">답변내용</label>
                  <textarea rows="5" name="inquiry_reply" id="inquiry_reply" class="form-control"  style="resize:none;">${inquiry.inquiry_reply}</textarea>
                </div>
              </div>
     

			<div class="buttons clearfix">
                <div class="pull-right">
                 <input type="button" id="button-review"  value="답변완료"   data-loading-text="Loading..." class="btn btn-primary" onclick="send();">
                <input type="button" value="취소" class="btn btn-primary" onclick="self.close();">
                </div>
              </div>
  			</form>
      </div>
	  
