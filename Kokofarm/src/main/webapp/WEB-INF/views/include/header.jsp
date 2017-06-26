<%@page import="kokofarm.member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
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

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  -->
<script src="/resources/javascript/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/javascript/jstree.min.js" type="text/javascript"></script>
<script src="/resources/javascript/template.js" type="text/javascript" ></script>
<script src="/resources/javascript/common.js" type="text/javascript"></script>
<script src="/resources/javascript/global.js" type="text/javascript"></script>
<script src="/resources/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
  

<style type="text/css">
#top-links li .logout {
display: none;!important;
}


  body {
        margin: 0px;
        padding: 0px;
      }
      .jbTitle {
        text-align: center;
        font-size: 15px;
      }
      .jbMenu {
        text-align: center;
        padding: 10px 0px;
        background-color: white;
        width: 100%;
        z-index: 100;
      }
      .jbContent {
        height: 2000px;
      }
      .jbFixed {
        position: fixed;
        top: 0px;
      }
      
      
.show_price{
margin : 0px;
position : relative;
left :100px;
display: inline-block;
width: 200px;
height: 20px;

}
      
</style>

<script type="text/javascript">

<%
MemberVO vo = (MemberVO)session.getAttribute("login");
System.out.println("세션값" +vo);

	if(vo==null){%>	
	$(document).ready(function(){
		$("#check_id").addClass("logout");
			});
				
	<%}	
		if(vo !=null) {
				if(vo.getSeller_no() != null){ %>
					$(document).ready(function(){					
						$('ul.main-navigation ul>li').eq(4).css("display","inline").next().css("display","inline").next().css("display","inline");
			 		});			 	
			 	<%}
				
			
%>$(document).ready(function(){
	$("#check_id").removeClass("logout");
	$(".dropdown-menu-right a").eq(0).attr("href","/member/myPage");
	 $(".dropdown-menu-right a").eq(0).text("마이페이지");
	 $(".dropdown-menu-right a").eq(1).attr("href","/member/logout").text("로그아웃");
	
		 	});
<%}%>
	
function show(){
	var A = document.getElementById("A");
	var B = $("#B").text();
     if(A.style.display == "none"){
		 A.style.display = "block";
		$("#B").text("접기▲");
	}else{
		A.style.display = "none";
		$("#B").text("시세현황보기▼");
	}
}

$( document ).ready( function() {
  var jbOffset = $( '.jbMenu' ).offset();
  $( window ).scroll( function() {
    if ( $( document ).scrollTop() > jbOffset.top ) {
      $( '.jbMenu' ).addClass( 'jbFixed' );
    }
    else {
      $( '.jbMenu' ).removeClass( 'jbFixed' );
    }
  });
} );
</script>
	
	

</head>
<body>
<div class="preloader loader" style="display: block; background:#f2f2f2;"> <img src="/resources/image/loader.gif"  alt="#"/></div>
<header>
  <div class="header-top">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="top-left pull-left">
            <div class="language">
              <form action="#" method="post" enctype="multipart/form-data" id="language">
                <div class="btn-group" style="display: none;">
                  <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <img src="/resources/image/flags/gb.png" alt="Korea" title="Korea">Korea <i class="fa fa-caret-down"></i></button>
                  <ul class="dropdown-menu">
                    <li><a href="#"><img src="/resources/image/flags/lb.png" alt="Korea" title="Korea"> Korea</a></li>
                    <li><a href="#"><img src="/resources/image/flags/gb.png" alt="English" title="English"> English</a></li>
                  </ul>	
                </div>
              </form>
            </div>
            <div class="currency">
              <form action="#" method="post" enctype="multipart/form-data" id="currency" style="display: none;">
                <div class="btn-group">
                  <button class="btn btn-link dropdown-toggle" data-toggle="dropdown"> <strong>$</strong> <i class="fa fa-caret-down"></i> </button>
                  <ul class="dropdown-menu">
                    <li>
                      <button class="currency-select btn btn-link btn-block" type="button" name="EUR">€ Euro</button>
                    </li>
                    <li>
                      <button class="currency-select btn btn-link btn-block" type="button" name="GBP">£ Pound Sterling</button>
                    </li>
                    <li>
                      <button class="currency-select btn btn-link btn-block" type="button" name="USD">$ US Dollar</button>
                    </li>
                  </ul>
                </div>
              </form>
            </div>
          </div>
          
          <div class="top-right pull-right">
            <div id="top-links" class="nav pull-right">
              <ul class="list-inline">
              		<li><span id="check_id"><i class="fa fa-user"></i>${login.member_id }님 환영 합니다.</span></li>
                	<li class="dropdown"><a href="#" title="My Account" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-user"></i><span>My Account</span> <span class="caret"></span></a>
                  		<ul class="dropdown-menu dropdown-menu-right">
                    			<li><a href="/member/join0">회원가입</a></li>
                  				  <li><a href="/member/login">로그인</a></li>
                 		 </ul>
                </li>
                <!-- <li><a href="#" id="wishlist-total" title="Wish List (0)"><i class="fa fa-heart"></i><span>Wish List</span><span> (0)</span></a></li> -->
              </ul>
              <div class="search-box">
                          <input class="input-text" placeholder="search.." type="text">
                          <button class="search-btn"><i class="fa fa-search"></i></button>
                        </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="header-inner">
      <div class="col-sm-4 col-xs-6 header-left">
        <div class="shipping">
          <div class="shipping-img"></div>
          <div class="shipping-text">(02)534-7777<br><span class="shipping-detail">고객센터 이용시간 9:00 ~ 19:00</span></div>
        </div>
      </div>
      <div class="col-sm-4 col-xs-12 header-middle">
        <div class="header-middle-top">
          <div id="logo"> <a href="/"><img src="/resources/image/mainlogo.png" title="E-Commerce" alt="E-Commerce" class="img-responsive" /></a> </div>
        </div>
      </div>
      <div class="col-sm-4 col-xs-12 header-right">
        <div id="cart" class="btn-group btn-block" style="display: none;">
          <button type="button" class="btn btn-inverse btn-block btn-lg dropdown-toggle cart-dropdown-button"> <span id="cart-total"><span class="cart-title">Shopping Cart</span><br>
          0 item(s) - $0.00</span> </button>
          <ul class="dropdown-menu pull-right cart-dropdown-menu">
            <li>
              <table class="table table-striped">
                <tbody>
                  <tr>
                    <td class="text-center"><a href="#"><img class="img-thumbnail" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" src="/resources/image/product/7product50x59.jpg"></a></td>
                    <td class="text-left"><a href="#">lorem ippsum dolor dummy</a></td>
                    <td class="text-right">x 1</td>
                    <td class="text-right">$254.00</td>
                    <td class="text-center"><button class="btn btn-danger btn-xs" title="Remove" type="button"><i class="fa fa-times"></i></button></td>
                  </tr>
                </tbody>
              </table>
            </li>
            <li>
              <div>
                <table class="table table-bordered">
                  <tbody>
                    <tr>
                      <td class="text-right"><strong>Sub-Total</strong></td>
                      <td class="text-right">$210.00</td>
                    </tr>
                    <tr>
                      <td class="text-right"><strong>Eco Tax (-2.00)</strong></td>
                      <td class="text-right">$2.00</td>
                    </tr>
                    <tr>
                      <td class="text-right"><strong>VAT (20%)</strong></td>
                      <td class="text-right">$42.00</td>
                    </tr>
                    <tr>
                      <td class="text-right"><strong>Total</strong></td>
                      <td class="text-right">$254.00</td>
                    </tr>
                  </tbody>
                </table>
                <p class="text-right"> <span class="btn-viewcart"><a href="cart.html"><strong><i class="fa fa-shopping-cart"></i> View Cart</strong></a></span> <span class="btn-checkout"><a href="checkout.html"><strong><i class="fa fa-share"></i> Checkout</strong></a></span> </p>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</header>
<div class="jbMenu">
<nav id="menu" class="navbar">
  <div class="nav-inner container">
    <div class="navbar-header"><span id="category" class="visible-xs">Categories</span>
      <button type="button" class="btn btn-navbar navbar-toggle" ><i class="fa fa-bars"></i></button>
    </div>
    <div class="navbar-collapse">
      <ul class="main-navigation"> 
        <li><a href="/"   class="parent"  >홈</a> </li>
        <li><a href="/product/list_product"   class="parent"  >과일/채소</a> </li>
        <li><a href="/auction/auction_list"   class="parent"  >일반경매</a> </li>
         <li><a href="/auction/rt_auction_list"   class="parent" >실시간경매</a> </li>
        <li><a href="/center/customer_view"   class="parent"  >고객센터</a> </li>
        <li><a href="/mypage/list_Inquiry" class="active parent">MyPage</a>
          <ul>
            <li><a href="category.html">주문배송조회</a></li>
            <li><a href="/cart/cart">장바구니</a></li>
            <li><a href="checkout.html">결제 페이지</a></li>
            <li><a href="/mypage/list_Inquiry" >1:1 문의</a></li>
            <li style="display: none;"><a href="/product/Insert_product">셀러 판매물품 등록</a></li>
            <li style="display: none;"><a href="/auction/rt_auction_register" >셀러 실시간 물품 등록</a></li>
            <li style="display: none;"><a href="/mypage/auction_view" >경매</a></li>
            </ul>
        </li>       
        <div class="show_price" >
			<button type="button"  id="B" onclick="show();" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block addtocart" >시세현황보기▼</button>
		</div>        
         </ul>
       
      
    </div>
   
      
  </div>
</nav>
<div id="A" style="display: none;">
		<div style="display: inline-table;">
          <iframe src="/product/getdate" name=ce width=600 height=190 frameborder=0 style="border-width:0px; border-color:white; border-style:solid;" ></iframe>
          </div>
          
          <div style="display: inline-table;">
          <iframe src="/product/getdate1" name=ce width=600 height=190 frameborder=0 style="border-width:0px; border-color:white; border-style:solid;" ></iframe>
          </div>
        </div>


   </div>


