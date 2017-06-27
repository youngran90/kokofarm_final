<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코팜::경매상품</title>

<%@include file="../include/header.jsp"%>
<style>
	.product-name .auction_name:hover{
		color: #F26B18;
	}
	#list_img{
		/* border: 1px solid red; */
		width: 650px;
		height: 150px;
	}
	#register_button{
		border: none;
		font-weight: bold;
		background: #F26B18;
		color: #FFFFFF;
		width: 100px;
		height: 30px;
		position: relative;
		left: 1079px;
		top: -27px;
	}
	#register_button:hover{
		border: solid 1px #F26B18;
		background: #FFFFFF;
		color: #F26B18;
		font-weight: bold;
	}
	#auction_timer{
		border: solid 1px red;
		width: 60px;
		height: 30px;
		display: inline-block;
		position: absolute;
		z-index: 1;
		left: 20px;
		
	}
	#auction_timer:hover{
		border: solid 1px blue;
		width: 60px;
		height: 30px;
		display: inline-block;
		position: absolute;
		z-index: 1;
		left: 20px;
	}
</style>

<script>

window.onload = function(){
	//판매자가 아니면 상품등록X
	var seller_no= '${login.seller_no}'
		
	if(seller_no==''){
		$('#register_button').hide();
	}else{
		$('#register_button').show();
	}
	
	
	//sort 부제:머리가 나쁘면 몸이 고생한다.
		$('#list_fruit').hide();
		$('#list_vege').hide();
		$('#list_new').hide();
		$('#list_end').hide();
		
		$('#none').click(function(){
			//alert("기본리스트");
			$('#list_default').show();
			$('#list_fruit').hide();
			$('#list_vege').hide();
			$('#list_new').hide();
			$('#list_end').hide();
		});
		$('#fruit').click(function(){
			//alert("과일리스트");
			$('#list_fruit').show();
			$('#list_default').hide();
			$('#list_vege').hide();
			$('#list_new').hide();
			$('#list_end').hide();
		});
		$('#vege').click(function(){
			//alert("채소리스트");
			$('#list_vege').show();
			$('#list_default').hide();
			$('#list_fruit').hide();
			$('#list_new').hide();
			$('#list_end').hide();
		});
		$('#new').click(function(){
			//alert("신규등록순");
			$('#list_new').show();
			$('#list_default').hide();
			$('#list_fruit').hide();
			$('#list_vege').hide();
			$('#list_end').hide();
		});
		$('#end').click(function(){
			//alert("마감임박순");
			$('#list_end').show();
			$('#list_default').hide();
			$('#list_fruit').hide();
			$('#list_vege').hide();
			$('#list_new').hide();
		});
	}
	
	
	//상품등록
	function move_register(){
		window.location.href="auction_register";
	}

	
	//검색기능
	function searchingAuction(){
				
					self.location = "auction_list"
					+ '${auctionPage.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				
			};
			
			
</script>
<!-- <div class="preloader loader" style="display: block; background:#f2f2f2;"> <img src="image/loader.gif"  alt="#"/></div> -->
<div class="container">
  <ul class="breadcrumb" style="padding-left: 15px;">
    <li><a href="http://localhost:8081/"><i class="fa fa-home"></i></a></li>
    <li><a href="/auction/auction_list">일반 경매</a></li>
    <li><a href="#">경매 상품</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
   		<div class="column-block">
        <div class="column-block">
          <div class="columnblock-title">Categories</div>
          <div class="category_block">
            <ul class="box-category treeview-list treeview">
              <li><a href="../auction/auction_list" class="activSub">일반경매</a>
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
        <h3 class="productblock-title">신규등록상품</h3>
        <div class="row bestseller-grid product-grid">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="../tender/tenderform?auction_no=${new_auction0.auction_no}&pay_state=null"> <img src="/resources/files/attach/${new_auction0.auction_title_img}" alt="${new_auction0.auction_name}" title="${new_auction0.auction_name}" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${new_auction0.auction_no}&pay_state=null" title="${new_auction0.auction_name}">${new_auction0.auction_name}</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${new_auction0.auction_up}원</span></p>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${new_auction0.auction_down}원</span> </p>
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
              <div class="image product-imageblock"> <a href="../tender/tenderform?auction_no=${new_auction1.auction_no}&pay_state=null"> <img src="/resources/files/attach/${new_auction1.auction_title_img}" alt="${new_auction1.auction_name}" title="${new_auction1.auction_name}" class="img-responsive" /> </a>
                <!-- <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div> -->
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${new_auction1.auction_no}&pay_state=null" title="${new_auction1.auction_name}">${new_auction1.auction_name}</a></h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${new_auction1.auction_up}원</span> </p>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${new_auction1.auction_down}원</span> </p>
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
              <div class="image product-imageblock"> <a href="../tender/tenderform?auction_no=${new_auction2.auction_no}&pay_state=null"> <img src="/resources/files/attach/${new_auction2.auction_title_img}" alt="${new_auction2.auction_name}" title="${new_auction2.auction_name}" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${new_auction2.auction_no}&pay_state=null" title="${new_auction2.auction_name}">${new_auction2.auction_name}</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${new_auction2.auction_up}원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${new_auction2.auction_down}원 </span> </p>               
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
              <div class="image product-imageblock"> <a href="../tender/tenderform?auction_no=${new_auction3.auction_no}&pay_state=null"> <img src="/resources/files/attach/${new_auction3.auction_title_img}" alt="${new_auction3.auction_name}" title="${new_auction3.auction_name}" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${new_auction3.auction_no}&pay_state=null" title="${new_auction3.auction_name }">${new_auction3.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${new_auction3.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${new_auction3.auction_down }원 </span> </p>               
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
              <div class="image product-imageblock"> <a href="../tender/tenderform?auction_no=${new_auction4.auction_no }&pay_state=null"> <img src="/resources/files/attach/${new_auction4.auction_title_img }" alt="${new_auction4.auction_name }" title="${new_auction4.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${new_auction4.auction_no }&pay_state=null" title="${new_auction4.auction_name }">${new_auction4.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${new_auction4.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${new_auction4.auction_down }원 </span> </p>               
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
      <!-- LNB (Search) 시작 -->
      <div class="panel panel-default filter" style="display: none;">
        <div class="panel-heading columnblock-title">Refine Search</div>
        <div class="filter-block">
          <div class="list-group"> <a class="list-group-item">Color</a>
            <div class="list-group-item">
              <div id="filter-group1">
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="1" />
                  Black (7)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="2" />
                  Blue (6)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="3" />
                  Red (6)</label>
              </div>
            </div>
            <a class="list-group-item">Price</a>
            <div class="list-group-item">
              <div id="filter-group2">
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="4" />
                  $100-$300 (6)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="5" />
                  $301-$1000 (6)</label>
              </div>
            </div>
            <a class="list-group-item">Size</a>
            <div class="list-group-item">
              <div id="filter-group3">
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="6" />
                  Big (3)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="7" />
                  Medium (3)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="8" />
                  Small (1)</label>
              </div>
            </div>
          </div>
          <div class="panel-footer text-right">
            <button type="button" id="button-filter" class="btn btn-primary">Refine Search</button>
          </div>
        </div>
      </div>
      <!-- LNB (Search) 끝 -->
      <!-- Special 시작 -->
      <div class="banner" style="display: none;">
        <div class="item"> <a href="#"><img src="image/banners/LeftBanner.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
      </div>
      <h3 class="productblock-title" style="display: none;">Specials</h3>
      <div class="row special-grid product-grid" style="display: none;">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/5product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/1product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div><div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/2product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div><div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/5product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/4product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Special 끝 -->
    <!-- 리스트 시작 -->
    <div id="content" class="col-sm-9">
      <h2 class="category-title" style="font-weight: bold; position: relative; top: 1px;">일반 경매</h2>
      <input type="button" id="register_button" value="상품등록" onclick="move_register()" style="position:relative; left:840px;">
      <!-- <div class="row category-banner">
        <div class="col-sm-12 category-image"><img src="image/banners/category-banner.jpg" alt="Desktops" title="Desktops" class="img-thumbnail" /></div>
        <div class="col-sm-12 category-desc">Lorem ipsum dolomagna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.</div>
      </div> -->
      <div class="category-page-wrapper" style="border-bottom: none;">
        <div class="col-md-6 list-grid-wrapper">
          <div class="btn-group btn-list-grid">
            <button type="button" id="grid-view" class="btn btn-default grid" data-toggle="tooltip" title="Grid"><i class="fa fa-th"></i></button>
          </div>
          <!-- <a href="#" id="compare-total"></a> </div> -->
        <div class="col-md-1 text-right page-wrapper" style="position: relative; bottom: 35px;"> 
        <div>
        <select name="searchType" style="display: none;">
         	<option value="t" selected
         		<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
         		auction_name</option>
         </select>
         <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" style="border: 1px solid #EDEDED;">
		 <button id="search" onclick="searchingAuction()">검색</button>
        </div>
        <div class="col-md-2 text-right sort-wrapper">
          <label class="control-label" for="input-sort"></label>
          <form role="form" id="formselect" name="formselect" method="get">
          <div class="sort-inner">
            <select id="auction-sort" name="auction-sort" class="form-control" onChange="auction_sort(this.value)"
            style="font-size: 13px; text-align: center; width: 226px; position: relative; left: 10px;">
              <option id="none" selected>----</option>
	          <option id="fruit" >과일</option>
	          <option id="vege" >채소</option>
              <option id="new" >신규등록순</option>
              <option id="end" >마감임박순</option>
            </select>
            <input type="hidden" name="dd">
            <input type="hidden" value="전송">
          </div>
          </form>
        </div>
      </div>
      <br><br><br>
     
     <div id="list_default" class="grid-list-wrapper" >
     <c:forEach items="${list}" var="AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" style="width: 220px; height:300px; padding:0; margin-right: 10px;" >
     		<div class="product-thumb" style="width: 200px; height: 300px;">
     			<div class="image product-imageblock"><a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><img src='/resources/files/attach/${AuctionRegisterVO.auction_title_img}' class="img-responsive" id="list_img"></a></div>
     			<h4 class="product-name" style="height: 35px; text-align: center;"> <a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><span class="auction_name">${AuctionRegisterVO.auction_name}</span></a></h4>
     			<div style="overflow: hidden;" >
     			<p style="margin-right:10px; color: gray; font-size:12px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">경매종료일</span>${AuctionRegisterVO.end_date}
     			</p>
     			<p class="price product-price" style="margin-right:10px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">상한가</span>${AuctionRegisterVO.auction_up}
     			</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${AuctionRegisterVO.auction_down}
     			</p>
     			</div>
     		</div>
     	</div>
     	</c:forEach>
       </div>
       <div id="list_fruit" class="grid-list-wrapper">
     <c:forEach items="${list_Fruit}" var="AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" style="width: 220px; height:300px; padding:0; margin-right: 10px;" >
     		<div class="product-thumb" style="width: 200px; height: 300px;">
     			<div class="image product-imageblock"><a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><img src='/resources/files/attach/${AuctionRegisterVO.auction_title_img}' class="img-responsive" id="list_img"></a></div>
     			<h4 class="product-name" style="height: 35px; text-align: center;"> <a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><span class="auction_name">${AuctionRegisterVO.auction_name}</span></a></h4>
     			<div style="overflow: hidden;" >
     			<p style="margin-right:10px; color: gray; font-size:12px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">경매종료일</span>${AuctionRegisterVO.end_date}
     			</p>
     			<p class="price product-price" style="margin-right:10px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">상한가</span>${AuctionRegisterVO.auction_up}
     			</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${AuctionRegisterVO.auction_down}
     			</p>
     			</div>
     		</div>
     	</div>
     	</c:forEach>
       </div>
       <div id="list_vege" class="grid-list-wrapper">
     <c:forEach items="${list_Vege}" var="AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" style="width: 220px; height:300px; padding:0; margin-right: 10px;">
     		<div class="product-thumb" style="width: 200px; height: 300px;">
     			<div class="image product-imageblock"><a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><img src='/resources/files/attach/${AuctionRegisterVO.auction_title_img}' class="img-responsive" id="list_img"></a></div>
     			<h4 class="product-name" style="height: 35px; text-align: center;"> <a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><span class="auction_name">${AuctionRegisterVO.auction_name}</span></a></h4>
     			<div style="overflow: hidden;" >
     			<p style="margin-right:10px; color: gray; font-size:12px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">경매종료일</span>${AuctionRegisterVO.end_date}
     			</p>
     			<p class="price product-price" style="margin-right:10px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">상한가</span>${AuctionRegisterVO.auction_up}
     			</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${AuctionRegisterVO.auction_down}
     			</p>
     			</div>
     		</div>
     	</div>
     	</c:forEach>
       </div>
       <div id="list_new" class="grid-list-wrapper">
     <c:forEach items="${list_New}" var="AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" style="width: 220px; height:300px; padding:0; margin-right: 10px;">
     		<div class="product-thumb" style="width: 200px; height: 300px;">
     			<div class="image product-imageblock"><a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><img src='/resources/files/attach/${AuctionRegisterVO.auction_title_img}' class="img-responsive" id="list_img"></a></div>
     			<h4 class="product-name" style="height: 35px; text-align: center;"> <a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><span class="auction_name">${AuctionRegisterVO.auction_name}</span></a></h4>
     			<div style="overflow: hidden;">
     			<p style="margin-right:10px; color: gray; font-size:12px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">경매종료일</span>${AuctionRegisterVO.end_date}
     			</p>
     			<p class="price product-price" style="margin-right:10px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">상한가</span>${AuctionRegisterVO.auction_up}
     			</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${AuctionRegisterVO.auction_down}
     			</p>
     			</div>
     		</div>
     	</div>
     	</c:forEach>
       </div>
       <div id="list_end" class="grid-list-wrapper">
     <c:forEach items="${list_End}" var="AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" style="width: 220px; height:300px; padding:0; margin-right: 10px;">
     		<div class="product-thumb" style="width: 200px; height: 300px;">
     			<div class="image product-imageblock"><a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><img src='/resources/files/attach/${AuctionRegisterVO.auction_title_img}' class="img-responsive" id="list_img"></a></div>
     			<h4 class="product-name" style="height: 35px; text-align: center;"> <a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}&pay_state=null&tender_price_1=0"><span class="auction_name">${AuctionRegisterVO.auction_name}</span></a></h4>
     			<div style="overflow: hidden;">
     			<p style="margin-right:10px; color: gray; font-size:12px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">경매종료일</span>${AuctionRegisterVO.end_date}
     			</p>
     			<p class="price product-price" style="margin-right:10px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">상한가</span>${AuctionRegisterVO.auction_up}
     			</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${AuctionRegisterVO.auction_down}
     			</p>
     			</div>
     		</div>
     	</div>
     	</c:forEach>
       </div>
       
       
      <!-- 페이징 처리 -->
      <div class="category-page-wrapper" style="border-bottom: none; width: 940px; margin-top: 150px;">
        <!-- <div class="result-inner"></div> -->
        <div style="text-align: center;">
          <ul class="pagination">
          <c:if test="${auctionPage.prev}">
          	<li><a href="auction_list${auctionPage.makeSearch(auctionPage.startPage - 1)}">&lt;</a></li> 
          </c:if>
          <c:forEach begin="${auctionPage.startPage}" end="${auctionPage.endPage}" var="idx">
          	<li <c:out value="${auctionPage.cri.page == idx?'class=active':''}"/>><a href="auction_list?page=${idx}">${idx}</a></li>
          </c:forEach>
          <c:if test="${auctionPage.next && auctionPage.endPage > 0}">
          	<li><a href="auction_list?page=${auctionPage.endPage + 1}">&gt;</a></li>
          </c:if>
            <!-- <li><a href="category.html">&gt;|</a></li> -->
          </ul>
        </div>
      </div>
      <!-- 페이징 처리 끝 -->
    </div>
  </div>
</div>
</div>
</div>

<%@include file="../include/footer.jsp"%>
</body>
