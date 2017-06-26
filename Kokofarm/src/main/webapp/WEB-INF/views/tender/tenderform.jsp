<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@include file="../include/header.jsp"%>
 <%
   MemberVO member = (MemberVO) session.getAttribute("login");
   String id= member.getMember_id();
   System.out.println("세션에서 얻어온 memeber_id ="+id);
 %>
 
 <script type="text/javascript">
 
  var time=${visitingTime};
  
   function timer(){ 
	   
	   if(time<=0){
		   clearInterval(tid);
		   time=0;
		   document.getElementById('h_tend_time').innerHTML="0일0시간0분0초";
		  // $('#successPayButton').show();
	   } 
	   else if(time <3600){
		   $('#tend_time').hide();
	   	m= Math.floor(time/(24*60*60))+"일"+Math.floor((time%(24*60*60)/(60*60)))+"시간"+Math.floor(((time%3600)/60))+"분"+time%60+"초";
	   	document.getElementById('h_tend_time').innerHTML=m;
	   	time--;
	   }
	   else{
		   m= Math.floor(time/(24*60*60))+"일"+Math.floor((time%(24*60*60)/(60*60)))+"시간"+Math.floor(((time%3600)/60))+"분"+time%60+"초";
		   	document.getElementById('tend_time').innerHTML=m;
		   	time--;
	   }
   } 
   
   /* function check(){
	   if(${member_id}!=null){
		   $('#successPayButton').show();
	   }
   } */
   
 
 $(function(){
	 
	 
	 
	 tid=setInterval(timer,1000);
	 
	 $('#tenderinfoview').hide();
	 
	 $('#tenderinfo').on('click',function(){
		$('#tenderinfoview').slideDown('slow');
		return false;
	 });
	
	 $('#tenderinfoend').on('click',function(){
		 $('#tenderinfoview').hide();
		 return false;
	 });
	 
	  var formObj = $("form[role='form']");
	  
	  $('#payNow').on('click',function(){
		  formObj.attr("action", "/tender/tenderpay");
		  formObj.submit();
	  });
	  
	  $('#payLater').on('click',function(){
		  formObj.attr("action","../mypage/auction_view");
		  formObj.submit();
	  })
	  
	  if(${pay_state} != null){
		  $('#payNow').hide();
		  $('#payLater').hide();
	  }

 });
   

   function tend(){
	 
			 var tender_price = $('#tenderpriceId').val();
			 
			 if(tender_price > ${auction.auction_up}){
				 alert('상한가를 확인하세요.');
				 alert(${auction.auction_up});
			 }else if(tender_price < ${auction.auction_down}){
			   alert('하한가를 확인하세요.');
			 }else if(tender_price <= ${current_price}){
				 alert('현재가를 확인하세요.');
			 }else{
				 $('#form').submit();
			 }
   }
   
 
</script>
<div class="container">
  <ul class="breadcrumb">
    <li style="margin-left: 15px;"><a href="index.html"><i class="fa fa-home"></i></a></li>
    <li><a href="category.html">경매</a></li>
    <li><a href="#">경매상세</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
      <div class="column-block">
        <div class="column-block">
          <div class="columnblock-title">Categories</div>
          <div class="category_block">
            <ul class="box-category treeview-list treeview">
              <li><a href="../auction/auction_list" class="activSub">경매리스트</a>
                <!-- <ul>
                  <li><a href="#">PC</a></li>
                  <li><a href="#">MAC</a></li>
                </ul> -->
              </li>
              <!-- <li><a href="#" class="activSub"></a>
                <ul>
                  <li><a href="#">Macs</a></li>
                  <li><a href="#">Windows</a></li>
                </ul>
              </li> -->
              <!-- <li><a href="#" class="activSub">Components</a>
                <ul>
                  <li><a href="#">Mice and Trackballs</a></li>
                  <li><a href="#" class="activSub" >Monitors</a>
                    <ul>
                      <li><a href="#"  >test 1</a></li>
                      <li><a href="#"  >test 2</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Windows</a></li>
                </ul>
              </li>
              <li><a href="#">Tablets</a></li>
              <li><a href="#">Software</a></li>
              <li><a href="#">Phones & PDAs</a></li>
              <li><a href="#">Cameras</a></li>
              <li><a href="#">MP3 Players</a></li> -->
            </ul>
          </div>
        </div>
        <h3 class="productblock-title">인기상품</h3>
        <div class="row bestseller-grid product-grid">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="tenderform?auction_no=${auctionbest0.auction_no }&pay_state=null"> <img src="/resources/files/attach/${auctionbest0.auction_title_img }" alt="${auctionbest0.auction_name }" title="${auctionbest0.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="tenderform?auction_no=${auctionbest0.auction_no }&pay_state=null" title="${auctionbest0.auction_name }">${auctionbest0.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${auctionbest0.auction_up }원</span></p>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${auctionbest0.auction_down }원</span> </p>
              </div>
             <!--  <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="tenderform?auction_no=${auctionbest1.auction_no }&pay_state=null"> <img src="/resources/files/attach/${auctionbest1.auction_title_img }" alt="${auctionbest1.auction_name }" title="${auctionbest1.auction_name }" class="img-responsive" /> </a>
                <!-- <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div> -->
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="tenderform?auction_no=${auctionbest1.auction_no }&pay_state=null" title="${auctionbest1.auction_name }">${auctionbest1.auction_name }</a></h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${auctionbest1.auction_up }원</span> </p>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${auctionbest1.auction_down }원</span> </p>
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="tenderform?auction_no=${auctionbest2.auction_no }&pay_state=null"> <img src="/resources/files/attach/${auctionbest2.auction_title_img }" alt="${auctionbest2.auction_name }" title="${auctionbest2.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="tenderform?auction_no=${auctionbest2.auction_no }&pay_state=null" title="${auctionbest2.auction_name }">${auctionbest2.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${auctionbest2.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${auctionbest2.auction_down }원 </span> </p>               
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="tenderform?auction_no=${auctionbest3.auction_no }&pay_state=null"> <img src="/resources/files/attach/${auctionbest3.auction_title_img }" alt="${auctionbest3.auction_name }" title="${auctionbest3.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="tenderform?auction_no=${auctionbest3.auction_no }&pay_state=null" title="${auctionbest3.auction_name }">${auctionbest3.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${auctionbest3.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${auctionbest3.auction_down }원 </span> </p>               
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="tenderform?auction_no=${auctionbest4.auction_no }&pay_state=null"> <img src="/resources/files/attach/${auctionbest4.auction_title_img }" alt="${auctionbest4.auction_name }" title="${auctionbest4.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="tenderform?auction_no=${auctionbest4.auction_no }&pay_state=null" title="${auctionbest4.auction_name }">${auctionbest4.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${auctionbest4.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${auctionbest4.auction_down }원 </span> </p>               
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
        </div>
        <h3 class="productblock-title" style="display: none;">Latest</h3>
        <div class="row latest-grid product-grid" style="display: none;">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock">
              <a href="#">
              <img src="/resources/files/attach/${auctionbest2.auction_title_img }" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" />
              </a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"><a href="#"><img src="image/product/2product50x59.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /></a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"><a href="#"><img src="image/product/3product50x59.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /></a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"><a href="#"><img src="image/product/2product50x59.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /></a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>
        <h3 class="productblock-title" style="display: none;">Specials</h3>
        <div class="row special-grid product-grid" style="display: none;">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"><img src="image/product/5product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"><img src="image/product/6product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"><img src="image/product/7product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"><img src="image/product/6product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="content" class="col-sm-9">
      <div class="row">
        <div class="col-sm-6">
          <div class="thumbnails">
          <!-- 이미지 부분 -->
            <div><a class="thumbnail" href="image/product/product8.jpg" title="lorem ippsum dolor dummy"><img src="/resources/files/attach/${auction.auction_title_img }" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
            <!-- <div id="product-thumbnail" class="owl-carousel" style="display: none;">
               <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product1.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-1-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product2.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-2-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product3.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-3-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product4.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-4-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product5.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-5-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product6.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-6-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product7.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-7-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
            </div> -->
          </div>
        </div>
        
        
        <!-- 여기서부터 상품상세 -->
        <form id="form" action="tenderform" method="post">
         <!-- action="tenderform"  -->
        <div class="col-sm-6">
          <h1 class="productpage-title">${auction.auction_name}</h1>
          <div class="rating product"> 
            <span class="fa fa-stack">
               <i class="fa fa-star fa-stack-1x"></i>
               <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="fa fa-stack">
              <i class="fa fa-star fa-stack-1x"></i>
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span>
            <span class="fa fa-stack">
              <i class="fa fa-star fa-stack-1x"></i>
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="fa fa-stack">
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="fa fa-stack">
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="review-count">
              <a href="#" onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">1 reviews</a> / <a href="#" onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">Write a review</a>
            </span>
            <hr>
            <!-- AddThis Button BEGIN -->
           <div class="addthis_toolbox addthis_default_style">
              <a class="addthis_button_facebook_like"></a>
              <a class="addthis_button_tweet"></a>
              <a class="addthis_button_pinterest_pinit"></a>
              <a class="addthis_counter addthis_pill_style"></a>
            </div>
            <!-- AddThis Button END -->
          </div>
          <ul class="list-unstyled productinfo-details-top">
            <li>
              <h2 class="productpage-price"></h2>
            </li>
            <li><span class="productinfo-tax"></span></li>
          </ul>
           <!-- <hr> -->
          <ul class="list-unstyled product_info">
            <input type="hidden" name="auction_no" value="${auction.auction_no}">
            <li>
              <label>경매시작일 : </label>
              <span> ${auction.start_date }</span></li>
            <li>
              <label>경매종료일 :</label>
              <span> ${auction.end_date }</span></li>
            <li>
              <label>상한가 :</label>
              <span> ${auction.auction_up}</span></li>
            <li>
              <label>하한가 :</label>
              <span> ${auction.auction_down}</span></li>
            <li>
              <label>현재가 :</label>
              <span> ${current_price }</span></li>
            <li>
              <label>입찰수 :</label>
              <span> ${tender_number } </span></li>
            <li>
              <label><a href="#" id="tenderinfo">경매내역보기</a></label>
             <!--  <label><input type="button" id="tenderinfo" value="경매내역보기"></label> -->
              <div id="tenderinfoview"> 
                <div style="margin-left: 120px">
                  <p style="color: #ff6600; float: left; margin-right: 10px;">◈ 낙찰자</p>
                  <p style="color: #004eff">◈ 낙찰가능자</p>
                </div>
                <table id="tenderviewtable" style="border: 1px;">
                  <tr style="background: #ef8829; color: white; text-align: center;">
                    <th style="text-align: center;">입찰자ID &nbsp;&nbsp;</th>
                    <th style="text-align: center;">입찰일자 &nbsp;&nbsp;</th>
                    <th style="text-align: center;">입찰가격 &nbsp;&nbsp;</th>
                  </tr>
                  <c:forEach items="${s_list}" var="tenderVO">
					<tr style="text-align: center;">
					 <c:choose>
					   <c:when test="${tenderVO.tender_price == current_price}">
					     <c:choose>
					       <c:when test="${tenderVO.tender_price == auction.auction_up}">
					         <td style="color: #ff6600; font-weight: bold;">${tenderVO.member_id}</td>
					       </c:when>
					       <c:otherwise>
					         <c:choose>
					          <c:when test="${visitingTime==0 }">
					            <td style="color: #ff6600; font-weight: bold;">${tenderVO.member_id}</td>
					          </c:when>
					          <c:otherwise>
					             <td style="color: #004eff; font-weight: bold;">${tenderVO.member_id}</td>
					          </c:otherwise>
					         </c:choose>     
					       </c:otherwise>
					     </c:choose>
					    <td>${tenderVO.tender_date}</td>
					    <td>${tenderVO.tender_price}</td>
					   </c:when>
					   <c:otherwise>
					    <td>${tenderVO.member_id}</td>
					    <td>${tenderVO.tender_date}</td>
					    <td>${tenderVO.tender_price}</td>
					  </c:otherwise>
					  </c:choose>
					</tr>
				  </c:forEach>
                </table>
                <a href="#" id="tenderinfoend" style="margin-left:245px">접기</a>
              </div></li>
            <li>
              <label>남은시간 :</label>
              <%-- <c:choose>
                <c:when test="${visitingTime <=3600}"> --%>
                  <span id="h_tend_time" style="color: red; font-weight: bold;"></span>
                <%-- </c:when>
                <c:otherwise> --%>
                  <span id="tend_time"></span>
                <%-- </c:otherwise>
              </c:choose> --%>
              </li>
          </ul>
          <hr>
          <p class="product-desc"></p>
          <div id="product">
            <div class="form-group">
		       <c:choose>
		       <c:when test="${ current_price == auction.auction_up}">
		         <p class="end">경매가 완료되었습니다.<p> 
		       </c:when>
		       <c:when test="${visitingTime==0 }">
		         <p class="end">경매가 종료되었습니다.</p>
		         <!-- <input type="button" value="경매 확인하기" id="checkSuccess" style="background: #ef8829; color: white;">  -->
		         <!-- <input type="button" value="바로결제" id="payNow" style="background: #ef8829; color: white; float: left;  margin-right: 10px;">
		         <input type="button" value="나중에 결제" id="payLater"> -->
		       </c:when>
		       <c:otherwise>
              <label class="control-label qty-label" for="input-quantity">입찰가격</label>
              <input type="number" id="tenderpriceId" name="tender_price" id="input-quantity" class="form-control productpage-qty" style="width:150px; float: left"/>
              <input style="float: left; visibility: hidden; width : 0;">
              <input type="hidden" name="product_id" value="48" />
              
              <div class="btn-group">
                 <button type="button" data-toggle="tooltip" class="btn btn-default wishlist" title="Add to Wish List" style="display: none;"><i class="fa fa-heart-o" style="display: none;"></i></button> 
                
               <!-- 입찰버튼 -->
                <input type="button" id="button-cart" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block addtocart" value="입찰하기" onclick="tend()">
                <button type="button" data-toggle="tooltip" class="btn btn-default compare" title="Compare this Product"style="display: none;" ><i class="fa fa-exchange" style="display: none;"></i></button>
                </div>
               </c:otherwise>    
       			</c:choose>
               
              </div>
             
            </div>
          </div>
        <!-- </div> -->
       </form>
       
          <div id="successPayButton" style="margin-left: 730px;">
             <form role="form" method="post">
		       <input type="hidden" name="tender_no" value="${tender_no}">
			   <input type="hidden" name="member_id" value="${member_id }">
			   <input type="hidden" name="auction_no" value="${auction.auction_no}">
			   <input type="hidden" name="auction_title_img" value="${auction.auction_title_img }">
		       
		       <%-- <c:choose>
		        <c:when test="${member_id==null }">
		          <input type="submit" value="바로결제" id="payNow" style="display:none; background: #ef8829; color: white; float: left; margin-right: 10px; height: 30px;">
		          <input type="submit" value="나중에 결제" id="payLater" style="display:none; height: 30px; background: white; color: black;">
		        </c:when>
		        
		        <c:if test="${visitingTime==0 }">
		        <c:when test="${member_id=id }">
		           <input type="submit" value="바로결제" id="payNow" style="background: #ef8829; color: white; float: left; margin-right: 10px; height: 30px;">
		           <input type="submit" value="나중에 결제" id="payLater" style="height: 30px; background: white; color: black;">
		        </c:when>
		        </c:if>
		        <c:otherwise>
		           <input type="submit" value="바로결제" id="payNow" style="display:none; background: #ef8829; color: white; float: left; margin-right: 10px; height: 30px;">
		           <input type="submit" value="나중에 결제" id="payLater" style="display:none; height: 30px; background: white; color: black;">
		        </c:otherwise>
		       </c:choose> --%>
		       
		        <c:if test="${member_id==login.member_id}">
		        <input type="submit" value="바로결제" id="payNow" style="background: #ef8829; color: white; float: left; margin-right: 10px; height: 30px;">
		        <input type="submit" value="나중에 결제" id="payLater" style="height: 30px; background: white; color: black;">
		        </c:if>
		       
		    </form>
           </div>
         
      </div>
      
        
        
      <div class="productinfo-tab">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-description" data-toggle="tab" style="font-size: 15px; font-weight: bold;">상세설명</a></li>
          <li><a href="#tab-review" data-toggle="tab" style="display: none;">Reviews (1)</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-description">
            <div class="cpt_product_description ">
              <div style="text-align: center; margin-top: 60px; font-size: 20px; font-weight: bold;">
                ${auction.auction_content }
              </div>
            </div>
            <!-- cpt_container_end --></div>
          <div class="tab-pane" id="tab-review">
            <form class="form-horizontal">
              <div id="review"></div>
              <h2>Write a review</h2>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-name">ID</label>
                  <input type="text" name="name" value="${login.member_id}" id="input-name" class="form-control" readonly="readonly"/>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">Your Review</label>
                  <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                  <div class="help-block"><span class="text-danger">Note:</span> HTML is not translated!</div>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label">Rating</label>
                  &nbsp;&nbsp;&nbsp; Bad&nbsp;
                  <input type="radio" name="rating" value="1" />
                  &nbsp;
                  <input type="radio" name="rating" value="2" />
                  &nbsp;
                  <input type="radio" name="rating" value="3" />
                  &nbsp;
                  <input type="radio" name="rating" value="4" />
                  &nbsp;
                  <input type="radio" name="rating" value="5" />
                  &nbsp;Good</div>
              </div>
              <div class="buttons clearfix">
                <div class="pull-right">
                  <button type="button" id="button-review" data-loading-text="Loading..." class="btn btn-primary" onclick="">Continue</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <h3 class="productblock-title" style="display: none;">Related Products</h3>
      <div class="box" style="display: none;">
        <div id="related-slidertab" class="row owl-carousel product-slider">
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-1-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-2-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-3-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-4-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-5-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-6-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-7-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="../include/footer.jsp"%>
</body>
</html>