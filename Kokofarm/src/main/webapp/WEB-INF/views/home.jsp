<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
  <%@include file="include/header.jsp" %>
   
       
  <style>
   .button-group-admin{
	display: none;
}
 .button-group-admin .addmainslider-btn{
  background: #ef8829;
	display: inline-block;
	padding: 8px 17px;
	font-weight:500;
	float: none;
	width: auto;
	color: #ffffff;
	margin:0 2px;
	position: relative;
	left: 90%;
  }
  
  .button-group-admin .addmainProduct-btn{
  background: #ef8829;
	display: inline-block;
	padding: 8px 17px;
	font-weight:500;
	float: none;
	width: auto;
	color: #ffffff;
	margin:0 2px;
	position: relative;
	left: 1350px;
  }
  
  
  /* 적용 버튼 */
  

.button-group-admin{
	position: relative;
	right: 0px;
	bottom : 0px;
	width: 100%;
	bottom: 0px;
	margin-bottom: 20px;

}

/*  .mainbanner .button-group{
	float: right;
}  */
   
@media (max-width: 768px) {
.button-group-admin{
	border-left: none;
}
}
 .button-group-admin button{
	width: 60%;
	border: none;
	display: inline-block;
	background-color: #eee;
	color: #888;
	text-align: center;
}
.button-group-admin button:hover {
	background: #000;
	color: #ffffff;
	text-decoration: none;
	cursor: pointer;
}     

.auctionsale_banner{
width:1250px;
height:210px;
padding-top:10px;
margin:0 auto 60px;
 margin-top: 20px;

background: url("/resources/files/attach/Rtauctionbanner.png") no-repeat;
background-size: 1200px 200px;

}


.auction_image{
    position: relative;
    left: 612px;
display : inline-block;
float :left;
width: 200px;
height: 110px;
}

.right2{
left : 723px;
}

.time_count_banner{
position: relative;
    top: 117px;
    left: 99px;
background : url("/resources/files/attach/bg_main_time.png") no-repeat 50% 50%;
background-size : 197px 68px;
display: inline-block;
margin-left: 113px;

}

.time_count{
width: 197px;
height : 49px;
display: block;
text-align: center;

}


.time_countdown1{
    position: relative;
    top: 18px;
display:inline-block;
text-align:center;
font-size:31px;
font-weight:bold;
font-family:Tahoma;
color:#593e35;

}


.time_countdown1 div{
vertical-align:top;
display:inline-block;
margin:0 4px;
}

.auctionsale_banner .time_countdown1 .today-timer1
{
margin : 0px;
width:4px;
height:22px;
background:url(../resources/files/attach/time_colon.png) no-repeat left;
} 

.sp_11{
    position: relative;
    top: 3px;

}
.sp_1{
margin-left : 30px;
    font-size: 14px;
    font-family: Tahoma;
    font-weight: bold;
    color: #f0774f;
}

.sp_2{
margin-left : 10px;
   font-size: 14px;
font-family: YG77;
   font-weight: bold;
    color: #fce2b8;
}



/* 	.auctionsale_banner .time_end{display:block;text-align:center;font-size:25px;font-family:YG78;color:#593e35;padding-top:6px;}
	.timesale_banner .ts_item .bot_con .time_end span{font-size:25px;font-family:YG74;}
	.timesale_banner .ts_item .bot_con.end{display:none;}
	.timesale_banner .ts_item.off .bot_con{display:none;}
	.timesale_banner .ts_item.off .bot_con.end{display:block;}
 */

  </style>
   
    <script type="text/javascript">
       $(function(){    	  
    	if($('.time_countdown1>div').eq(2).text()=="종료"){
    		$('.today-timer1').css("display","none");
    	}
    		
    		
    	
    	   $("button.wishlist").css("display","none");
    	   $("button.compare").css("display","none");
    	   
    	   $(".addmainslider-btn").on('click',function(){
    		   openWin= window.open("/main/product_add","childForm","width=600, height=500, resizable = no, scrollbars = yes");
    	   });
    	   
    	   
    	   $('.addtocart-btn').on('click',function(){
    		   alert($(this).attr('no'));
    		   var product_no = $(this).attr("no");
    		   var amount = 1;
    		   $.ajax({
    			type : "get",
    			url : "/cart/cart_detail",
    			data : {num : amount, product_no : product_no},
    			dataType : "text",
    			success : function(){
    				alert("장바구니에 추가되었습니다.");
    			}
    				
    			   
    		   });
  			
  			 
  		 });
    	   
    	   
       });	
  
 	<% 
 	MemberVO vo1 = (MemberVO)session.getAttribute("login");
 	if(vo1 !=null){
 	if(vo1.getMember_id().equals("ddong85")){
 		%>
 		$(document).ready(function(){
 			$(".button-group-admin").css("display","block");
 		});
 	
 	<%}
 	}
 	%>
 	
 	
 	

 	    
   </script> 
   
    
<div class="mainbanner">
  <div id="main-banner" class="owl-carousel home-slider">
    <div class="item"> <a href="#"><img src="/resources/files/attach/여름과일기획전_메인배너.jpg" alt="main-banner1" class="img-responsive" /></a> </div>
    <div class="item"> <a href="#"><img src="/resources/files/attach/토마토할인_메인배너.jpg" alt="main-banner2" class="img-responsive" /></a> </div>
    <div class="item"> <a href="#"><img src="/resources/files/attach/수박_메인배너.jpg" alt="main-banner3" class="img-responsive" /></a> </div>
   </div>
    <div class="button-group-admin">
  	 	 <button class="addmainslider-btn" type="button">슬라이더 교체</button>
 	</div>
</div>
    
<!-- <script src="/resources/main/countdown.js"> -->
<script src="/resources/main/countdown2.js">


</script>
<div class="container">
  <div class="row">
  
    <div class="cms_banner">   		 
   		  <div class="auctionsale_banner"> 
   		  <div class="auction_image left1">
   		  	<img alt="" src="/resources/files/attach/banner.jpg" style="width: 200px; height: 100px;">
   		  
   		  </div>
   		  
   		  			<div class="time_count_banner" >
   		  				<div class = "sp_11">
   		  					<span class="sp_1">
   		  						10시까지
   		  					</span>
							<span class="sp_2">
			   				  	남은시간
			   				 </span>
   		  				</div>	
      		    	<div class="time_count">
      		    	          <span class="time_countdown1" id="el-countdown-0">
								<div class="today-timer"></div>
								<div class="today-timer1"></div>
								<div class="today-timer">종료</div>
								<div class="today-timer1"></div>
								<div class="today-timer"></div>
							</span>
				
							<script type="text/javascript">
									Countdown.init('2017-06-24 10:57:00', 'el-countdown-0','1111');
							</script> 
					</div>						
				 </div>
				 
								
			<div class="auction_image right2">
   		  		<img alt="" src="/resources/files/attach/banner.jpg" style="width: 200px; height: 100px;">
   		  
   		  </div>					
									 
			<div class="time_count_banner" >
				<div class = "sp_11">
				
					<span class="sp_1">
   		  				22시까지
   		  			</span>
					<span class="sp_2">
			   		  	남은시간
			   		  </span>
					</div>
					<div class="time_count">
					
			      			<span class="time_countdown1" id="el-countdown-1">
			      		
								<div class="today-timer"></div>
								<div class="today-timer1"></div>
								<div class="today-timer">종료</div>
								<div class="today-timer1"></div>
								<div class="today-timer"></div>
							</span>
				
							<script type="text/javascript">
									Countdown.init('2017-06-24 11:00:00', 'el-countdown-1','1111');
							</script> 
					</div>
      		</div>
          
          </div>
       </div>
  	 <div class="button-group-admin">
  	 	 <button class="addmainslider-btn" type="button" style="right: 0px;">상품 교체 (위)</button>
 	</div>
  </div>
  <div class="row">
    <div id="content" class="col-sm-12">
      <div class="customtab">
        <div id="tabs" class="customtab-wrapper">
          <ul class='customtab-inner'>
            <li class='tab'><a href="#tab-latest">신상품</a></li>
            <li class='tab'><a href="#tab-special">경매 상품</a></li>
            <li class='tab'><a href="#tab-bestseller">베스트셀러 상품</a></li>
          </ul>
        </div>
        <!-- 일반 상품 리스트 -->
        <div id="tab-latest" class="tab-content">
          <div class="box">
            <div id="latest-slidertab" class="row owl-carousel product-slider">
              <c:forEach items="${Latestlist }" var="LproductVO">
              <div class="item">
                <div class="product-thumb transition">
                  <div class="image product-imageblock"> 
                  	<a href="/product/detail_product?product_no=${LproductVO.product_no }">
                  		<img src="/resources/files/attach/${LproductVO.product_mainimage}" alt="${LproductVO.product_name}" title="${LproductVO.product_name }"   class="img-responsive" /> 
                  	</a>
                    <div class="button-group">
                      <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                      <button type="button" class="addtocart-btn" no="${LproductVO.product_no }" >Add To Cart</button>
                      <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                    </div>
                  </div>
                  <div class="caption product-detail">
                    <h4 class="product-name"><a href="/product/detail_product?product_no=${LproductVO.product_no }" title="${LproductVO.product_name}">${LproductVO.product_name}</a></h4>
                    <p class="price product-price">${LproductVO.product_price }원<!-- <span class="price-tax">Ex Tax: $100.00</span> --></p>
                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                  </div>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" >Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
              </div>
              </c:forEach>           
            </div>
          </div>
        </div>
        <!-- tab-경매 상품 리스트-->
        <div id="tab-special" class="tab-content" style="margin-top: 35px;">
          <div class="box">
            <div id="special-slidertab" class="row owl-carousel product-slider">
              <c:forEach items="${auctionList }" var="LauctionList">
              <div class="item">
                <div class="product-thumb transition">
                  <div class="image product-imageblock"> <a href="/tender/tenderform?auction_no=${LauctionList.auction_no }&pay_state=null"> <img src="/resources/files/attach/${LauctionList.auction_title_img }" alt="${LauctionList.auction_name }" title="${LauctionList.auction_name }" class="img-responsive" /> </a>
                  <!--   <div class="button-group">
                      <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                      <button type="button" class="addtocart-btn" >Add To Cart</button>
                      <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                    </div> -->
                  </div>
                  <div class="caption product-detail">
                    <h4 class="product-name"><a href="product.html" title="${LauctionList.auction_name }">${LauctionList.auction_name }</a></h4>
                    <p class="price product-price">현재가 : ${LauctionList.tender_price}원 <span class="price-tax">Ex Tax: $210.00</span> </p>
                  </div>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn">Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
              </div>
              </c:forEach>             
            </div>
          </div>
        </div>
        <!-- 베스트 판매 리스트-->
        <div id="tab-bestseller" class="tab-content" style="margin-top: 35px;">
          <div class="box">
            <div id="bestseller-slidertab" class="row owl-carousel product-slider">              
              <c:forEach items="${bestList}" var="LbestList">            
              <div class="item">
                <div class="product-thumb transition">
                  <div class="image product-imageblock"> <a href="/product/detail_product?product_no=${LbestList.product_no }"> <img src="/resources/files/attach/${LbestList.product_mainimage }" alt="${LbestList.product_name }" title="${LbestList.product_name }" class="img-responsive" /> </a>
                    <div class="button-group">
                      <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                      <button type="button" class="addtocart-btn"  no="${LbestList.product_no }">Add To Cart</button>
                      <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                    </div>
                  </div>
                  <div class="caption product-detail">
                    <h4 class="product-name"><a href="/product/detail_product?product_no=${LbestList.product_no }" title="${LbestList.product_name }">${LbestList.product_name }</a></h4>
                    <p class="price product-price">${LbestList.product_price }원 <span class="price-tax">Ex Tax: $210.00</span> </p>
                  </div>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" no="${LbestList.product_no }">Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
              </div>
              </c:forEach>            
            </div>
          </div>
        </div>
        <h3 class="productblock-title">Weekly Top Products</h3>
        <div class="box">
          <div id="Weekly-slider" class="row owl-carousel product-slider">
            <div class="item product-slider-item">
              <div class="product-thumb transition">
                <div class="image product-imageblock"> <a href="product.html"> <img src="../../../resources/image/product/product4.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" >Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
                <div class="caption product-detail">
                  <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                  <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
                </div>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
            </div>
            <div class="item product-slider-item">
              <div class="product-thumb transition">
                <div class="image product-imageblock"> <a href="product.html"> <img src="../../../resources/image/product/product5.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" >Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
                <div class="caption product-detail">
                  <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                  <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
                </div>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
            </div>
            <div class="item product-slider-item">
              <div class="product-thumb transition">
                <div class="image product-imageblock"> <a href="product.html"> <img src="../../../resources/image/product/product6.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" >Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
                <div class="caption product-detail">
                  <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                  <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
                </div>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
            </div>
            <div class="item product-slider-item">
              <div class="product-thumb transition">
                <div class="image product-imageblock"> <a href="#"> <img src="../../../resources/image/product/product7.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" >Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
                <div class="caption product-detail">
                  <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                  <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
                </div>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
            </div>
            <div class="item product-slider-item">
              <div class="product-thumb transition">
                <div class="image product-imageblock"> <a href="#"> <img src="../../../resources/image/product/product8.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" >Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
                <div class="caption product-detail">
                  <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                  <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
                </div>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
            </div>
            <div class="item product-slider-item">
              <div class="product-thumb transition">
                <div class="image product-imageblock"> <a href="#"> <img src="../../../resources/image/product/product1.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                  <div class="button-group">
                    <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                    <button type="button" class="addtocart-btn" >Add To Cart</button>
                    <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
                <div class="caption product-detail">
                  <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                  <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
                </div>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="parallax">
        	<ul id="testimonial" class="row owl-carousel product-slider">
          <li class="item">
            <div class="panel-default">
              <div class="testimonial-desc">Rem ipsum doLorem ipsum ut Rem ipsum doLorem ipsum ut labore et dolore malabore et dolore maipsum doLorem ipsum ut labore et dolore magna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing</div>
              <div class="testimonial-image"><img src="../../../resources/image/t1.jpg" alt="#"></div>
              <div class="testimonial-name"><h2>Nunc rutrum scel potent</h2></div>
              <div class="testimonial-designation"><p>Web Designer</p></div>

            </div>
          </li>
          <li class="item">
            <div class="panel-default">
              <div class="testimonial-desc">Rem ipsum doLoremRem ipsum doLorem ipsum ut labore et dolore ma ipsum ut labore et dolore  Rem ipsum doLorem ipsum ut labore et dolore mamagna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing</div>
              <div class="testimonial-image"><img src="../../../resources/image/t2.jpg" alt="#"></div>
              <div class="testimonial-name"><h2>Nunc rutrum scel potent</h2></div>
              <div class="testimonial-designation"><p>Web Deweloper</p></div>

            </div>
          </li>
          <li class="item">
            <div class="panel-default">
              <div class="testimonial-desc">RemRem ipsum doLorem ipsum ut labore et dolore ma ipsum doLorem ipsum ut labore et dolore magna.Rem ipsum doLorem ipsum ut labore et dolore maLorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing</div>
              <div class="testimonial-image"><img src="../../../resources/image/t3.jpg" alt="#"></div>
              <div class="testimonial-name"><h2>Nunc rutrum scel potent</h2></div>
              <div class="testimonial-designation"><p>Web Designer</p></div>

            </div>
          </li>
          <li class="item">
            <div class="panel-default">
              <div class="testimonial-desc">Rem ipsum doLorem Rem ipsum doLorem ipsum ut labore et dolore maipsum ut  Rem ipsum doLorem ipsum ut labore et dolore ma labore et dolore magna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing</div>
              <div class="testimonial-image"><img src="../../../resources/image/t4.jpg" alt="#"></div>
              <div class="testimonial-name"><h2>Nunc rutrum scel potent</h2></div>
              <div class="testimonial-designation"><p>Web Deweloper</p></div>

            </div>
          </li>
        </ul>
      </div>  -->
      <!-- <div class="row">
        <div class="cms_banner">
          <div class="col-md-4 cms-banner-left"> <a href="#"><img alt="#" src="../../../resources/image/banners/subbanner5.jpg"></a> </div>
          <div class="col-md-4 cms-banner-middle"> <a href="#"><img alt="#" src="../../../resources/image/banners/subbanner6.jpg"></a> </div>
          <div class="col-md-4 cms-banner-right"> <a href="#"><img alt="#" src="../../../resources/image/banners/subbanner7.jpg"></a> </div>
        </div>
      </div> -->
     <!--  <div id="subbanner4" class="banner" >
        <div class="item"> <a href="#"><img src="../../../resources/image/banners/subbanner4.jpg" alt="Sub Banner4" class="img-responsive" /></a> </div>
      </div> -->
      <h3 class="productblock-title">Featured Products</h3>
      <!-- <div class="box">
        <div id="feature-slider" class="row owl-carousel product-slider">
          <div class="item product-slider-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="product.html"> <img src="../../../resources/image/product/product4.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add To Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item product-slider-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="product.html"> <img src="../../../resources/image/product/product5.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add To Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item product-slider-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="product.html"> <img src="../../../resources/image/product/product6.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add To Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item product-slider-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="../../../resources/image/product/product7.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add To Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item product-slider-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/product8.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add To Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item product-slider-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="../../../resources/image/product/product1.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add To Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="lorem ippsum dolor dummy">lorem ippsum dolor dummy</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add To Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div> -->
      <!-- <div class="blog">
        <div class="blog-heading">
          <h3>Latest Blogs</h3>
        </div>
        <div class="blog-inner box">
          <ul class="list-unstyled blog-wrapper" id="latest-blog">
            <li class="item blog-slider-item">
              <div class="panel-default">
                <div class="blog-image"> <a href="#" class="blog-imagelink"><img src="../../../resources/image/blog/blog_1.jpg" alt="#"></a> <span class="blog-hover"></span> <span class="blog-date">06/07/2015</span> <span class="blog-readmore-outer"><a href="#" class="blog-readmore">Read More</a></span> </div>
                <div class="blog-content"> <a href="#" class="blog-name">
                  <h2>Nunc rutrum scel potent</h2>
                  </a>
                  <div class="blog-desc">Rem ipsum doLorem ipsum ut labore et dolore magna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing...</div>
                  <a href="#" class="blog-readmore">Read More</a> <span class="blog-date">06/07/2015</span> </div>
              </div>
            </li>
            <li class="item blog-slider-item">
              <div class="panel-default">
                <div class="blog-image"> <a href="#" class="blog-imagelink"><img src="../../../resources/image/blog/blog_2.jpg" alt="#"></a> <span class="blog-hover"></span> <span class="blog-date">06/07/2015</span> <span class="blog-readmore-outer"><a href="#" class="blog-readmore">Read More</a></span> </div>
                <div class="blog-content"> <a href="#" class="blog-name">
                  <h2>Nunc rutrum scel potent</h2>
                  </a>
                  <div class="blog-desc">Rem ipsum doLorem ipsum ut labore et dolore magna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing...</div>
                  <a href="singale-blog.html" class="blog-readmore">Read More</a> <span class="blog-date">06/07/2015</span> </div>
              </div>
            </li>
            <li class="item blog-slider-item">
              <div class="panel-default">
                <div class="blog-image"> <a href="#" class="blog-imagelink"><img src="../../../resources/image/blog/blog_3.jpg" alt="#"></a> <span class="blog-hover"></span> <span class="blog-date">06/07/2015</span> <span class="blog-readmore-outer"><a href="singale-blog.html" class="blog-readmore">Read More</a></span> </div>
                <div class="blog-content"> <a href="#" class="blog-name">
                  <h2>Nunc rutrum scel potent</h2>
                  </a>
                  <div class="blog-desc">Rem ipsum doLorem ipsum ut labore et dolore magna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing...</div>
                  <a href="singale-blog.html" class="blog-readmore">Read More</a> <span class="blog-date">06/07/2015</span> </div>
              </div>
            </li>
            <li class="item blog-slider-item">
              <div class="panel-default">
                <div class="blog-image"> <a href="#" class="blog-imagelink"><img src="../../../resources/image/blog/blog_4.jpg" alt="#"></a> <span class="blog-hover"></span> <span class="blog-date">06/07/2015</span> <span class="blog-readmore-outer"><a href="#" class="blog-readmore">Read More</a></span> </div>
                <div class="blog-content"> <a href="#" class="blog-name">
                  <h2>Nunc rutrum scel potent</h2>
                  </a>
                  <div class="blog-desc">Rem ipsum doLorem ipsum ut labore et dolore magna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing...</div>
                  <a href="#" class="blog-readmore">Read More</a> <span class="blog-date">06/07/2015</span> </div>
              </div>
            </li>
            <li class="item blog-slider-item">
              <div class="panel-default">
                <div class="blog-image"> <a href="#" class="blog-imagelink"><img src="../../../resources/image/blog/blog_5.jpg" alt="#"></a> <span class="blog-hover"></span> <span class="blog-date">06/07/2015</span> <span class="blog-readmore-outer"><a href="#" class="blog-readmore">Read More</a></span> </div>
                <div class="blog-content"> <a href="#" class="blog-name">
                  <h2>Nunc rutrum scel potent</h2>
                  </a>
                  <div class="blog-desc">Rem ipsum doLorem ipsum ut labore et dolore magna.Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipisicing...</div>
                  <a href="#" class="blog-readmore">Read More</a> <span class="blog-date">06/07/2015</span> </div>
              </div>
            </li>
          </ul>
        </div>
      </div> -->
      <div id="brand_carouse" class="owl-carousel brand-logo">
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand1.png" alt="Disney" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand2.png" alt="Dell" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand3.png" alt="Harley" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand4.png" alt="Canon" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand5.png" alt="Canon" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand6.png" alt="Canon" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand7.png" alt="Canon" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand8.png" alt="Canon" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand9.png" alt="Canon" class="img-responsive" /></a> </div>
        <div class="item text-center"> <a href="#"><img src="../../../resources/image/brand/brand5.png" alt="Canon" class="img-responsive" /></a> </div>
      </div>
    </div>
  </div>
</div>

<%@include file="include/footer.jsp" %>